import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
  };

  connect() {
    console.log("hello map");
    mapboxgl.accessToken = this.apiKeyValue;

    // Display Map
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [55.56294, -21.35408],
      zoom: 15,
    });

    // Add Controls (check display error)
    this.map.addControl(new mapboxgl.NavigationControl());

    // Add Solstice Marker to Map
    const el = document.createElement("div");
    el.className = "marker-solstice";
    const markerSolstice = new mapboxgl.Marker(el)
      .setLngLat([55.56294, -21.35408])
      .addTo(this.map);
  }
}
