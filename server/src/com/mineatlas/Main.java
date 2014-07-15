package com.mineatlas;

import amidst.Util;
import amidst.minecraft.IMinecraftInterface;
import amidst.minecraft.Minecraft;
import amidst.minecraft.MinecraftUtil;
import amidst.version.MinecraftVersion;
import org.simpleframework.http.Request;
import org.simpleframework.http.Response;
import org.simpleframework.http.core.Container;
import org.simpleframework.http.core.ContainerServer;
import org.simpleframework.transport.Server;
import org.simpleframework.transport.connect.Connection;
import org.simpleframework.transport.connect.SocketConnection;

import java.io.File;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.util.zip.GZIPOutputStream;

public class Main implements Container {
    public enum BiomeType {
        Default,
        Flat,
        Amplifed,
        LargeBiomes
    }

    private static synchronized int[] getData(long seed, BiomeType type, int x, int y, int size) {
        MinecraftUtil.createWorld(seed, type.toString().toLowerCase()); //'default 'flat' 'amplified' 'largebiomes'
        return MinecraftUtil.getBiomeData(x * size, y * size, size, size);
    }

    public void handle(Request request, Response response) {
        try {
            System.out.println(request.getPath());
            if (request.getPath().toString().equals("/data")) {
                final int x = Integer.parseInt(request.getParameter("x"));
                final int y = Integer.parseInt(request.getParameter("y"));
                final long seed = Long.parseLong(request.getParameter("seed"));
                final BiomeType type = BiomeType.valueOf(request.getParameter("type"));

                final int[] data = Main.getData(seed, type, x, y, 512);
                final int len = 512 * 512;
                byte[] byte_data = new byte[len];
                for (int i = 0; i < len; i++) {
                    byte_data[i] = (byte) data[i];
                }

                response.setValue("Content-Type", "text/plain");
                response.setValue("Server", "MineData/1.0");
                response.setValue("Content-Encoding", "gzip");
                response.setValue("Cache-Control", "public, max-age=200");

                OutputStream out_stream = response.getOutputStream();
                GZIPOutputStream zos = new GZIPOutputStream(out_stream);
                zos.write(byte_data);
                zos.close();
                out_stream.close();
            } else {
                OutputStream out_stream = response.getOutputStream();
                out_stream.close();
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception {
        Util.setMinecraftDirectory();
        MinecraftVersion version = MinecraftVersion.fromVersionPath(new File("/home/benj/.minecraft/versions/1.7.2/"));
        IMinecraftInterface minecraft = new Minecraft(version.getJarFile()).createInterface();
        MinecraftUtil.setBiomeInterface(minecraft);

        Container container = new Main();
        Server server = new ContainerServer(container);
        Connection connection = new SocketConnection(server);
        SocketAddress address = new InetSocketAddress(Integer.parseInt(args[0]));
        connection.connect(address);
    }
}