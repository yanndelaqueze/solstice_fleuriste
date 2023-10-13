import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    addressCoordinates: String,
  };

  connect() {
    console.log("mini map - HELLO");
    mapboxgl.accessToken = this.apiKeyValue;

    const addressCoordinates = JSON.parse(this.addressCoordinatesValue);

    // Display Map
    if (this.addressCoordinatesValue !== null) {
      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10",
        center: addressCoordinates,
        zoom: 15,
      });
    } else {
      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10",
        center: [55.56552, -21.35571],
        zoom: 11,
      });
    }

    // Add Controls (check display error)
    this.map.addControl(new mapboxgl.NavigationControl());

    // Add Address Marker to Map
    if (this.addressCoordinatesValue !== null) {
      const element = document.createElement("div");
      element.className = "marker-address";
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
