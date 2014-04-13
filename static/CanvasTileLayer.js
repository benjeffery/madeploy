/*
 * L.CanvasTileLayer is used for single zoom layer provided tiles drawn by canvas
 */

L.CanvasTileLayer = L.GridLayer.extend({

    options: {
        minZoom: 0,
        maxZoom: 18,

        zoomOffset: 0,

        nativeZoom: 15

        /*
         zoomReverse: <Number>,
         detectRetina: <Number>,
         */
    },

    initialize: function (options) {

        options = L.setOptions(this, options);

        // detecting retina displays, adjusting tileSize and zoom levels
        if (options.detectRetina && L.Browser.retina && options.maxZoom > 0) {

            options.tileSize = Math.floor(options.tileSize / 2);
            options.zoomOffset++;

            options.minZoom = Math.max(0, options.minZoom);
            options.maxZoom--;
        }
    },

    createTile: function (coords, done) {
        var tile = document.createElement('canvas');

        tile.coords = coords;

        /*
         Alt tag is set to empty string to keep screen readers from reading URL and for compliance reasons
         http://www.w3.org/TR/WCAG20-TECHS/H67
         */
        tile.alt = '';

        this._drawCanvasTile(tile, done);
        return tile;
    },

    _getTileSize: function () {
        var map = this._map,
            options = this.options,
            zoom = map.getZoom() + options.zoomOffset,
            zoomN = options.nativeZoom;
        return Math.round(map.getZoomScale(zoom) / map.getZoomScale(zoomN) * options.tileSize);
    }
});

L.canvasTileLayer = function (options) {
    return new L.CanvasTileLayer(options);
};
