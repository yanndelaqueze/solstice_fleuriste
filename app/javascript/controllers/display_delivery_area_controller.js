import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!

// Connects to data-controller="polygon-drawing"
export default class extends Controller {
  static values = {
    apiKey: String,
    currentCoordinates: String,
    addressCoordinates: String,
  };

  connect() {
    const addressCoordinates = JSON.parse(this.addressCoordinatesValue);
    const polygonCoordinates = [JSON.parse(this.currentCoordinatesValue)];
    console.log(polygonCoordinates);
    console.log(addressCoordinates);

    console.log(JSON.parse(this.currentCoordinatesValue));
    console.log("Polygon Draw - HELLO");
    mapboxgl.accessToken = this.apiKeyValue;

    // Display Map
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [55.56552, -21.35571],
      zoom: 11,
    });

    // Add Controls (check display error)
    this.map.addControl(new mapboxgl.NavigationControl());

    // Display the current Polygon on Map
    this.map.on("load", function () {
      this.addLayer({
        id: "polygon",
        type: "fill",
        source: {
          type: "geojson",
          data: {
            type: "Feature",
            geometry: {
              type: "Polygon",
              coordinates: polygonCoordinates,
            },
          },
        },
        layout: {},
        paint: {
          "fill-color": "#F043AC",
          "fill-opacity": 0.5,
        },
      });
    });

    // Add Address Marker to Map
    const marker = new mapboxgl.Marker()
      .setLngLat(addressCoordinates)
      .addTo(this.map);
  }
}
