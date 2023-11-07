import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    currentCoordinates: String,
    addressCoordinates: String,
  };

  connect() {
    const polygonCoordinates = [JSON.parse(this.currentCoordinatesValue)];
    console.log(polygonCoordinates);

    console.log(JSON.parse(this.currentCoordinatesValue));
    console.log("Polygon Draw - HELLO");
    mapboxgl.accessToken = this.apiKeyValue;

    // Display Map
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
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
          "fill-color": "#788f48",
          "fill-opacity": 0.5,
        },
      });
    });

    // Add Solstice Marker to Map
    const el = document.createElement("div");
    el.className = "marker-solstice";
    const markerSolstice = new mapboxgl.Marker(el)
      .setLngLat([55.56294, -21.35408])
      .addTo(this.map);

    // Add Address Marker to Map
    if (this.addressCoordinatesValue !== null) {
      const element = document.createElement("div");
      element.className = "marker-address";
      const addressCoordinates = JSON.parse(this.addressCoordinatesValue);
      const markerAddress = new mapboxgl.Marker(element)
        .setLngLat(addressCoordinates)
        .addTo(this.map);
    } else {
      // Handle the case when this.addressCoordinatesValue is null
      console.log(
        "this.addressCoordinatesValue is null, so not executing the rest of the code."
      );
    }
  }
}
