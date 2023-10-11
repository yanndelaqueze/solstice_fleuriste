import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!
import MapboxDraw from "@mapbox/mapbox-gl-draw";

// Connects to data-controller="polygon-drawing"
export default class extends Controller {
  static values = {
    apiKey: String,
    currentCoordinates: String,
  };

  static targets = ["polygonCoordinates"];

  connect() {
    const coordinates = [JSON.parse(this.currentCoordinatesValue)];

    console.log(JSON.parse(this.currentCoordinatesValue));
    console.log(this.apiKeyValue);
    console.log(this);
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

    // Initialize a drawing tool
    this.draw = new MapboxDraw({
      displayControlsDefault: false,
      controls: {
        polygon: true, // Enable polygon drawing
        trash: true, // Allow users to delete drawn shapes
      },
    });

    // Add Drawing tool to Map
    this.map.addControl(this.draw);

    // When the user creates a polygon, store its coordinates in the form input
    const input = this.polygonCoordinatesTarget;
    this.map.on("draw.create", function (e) {
      console.log(e);
      const coordinates = e.features[0].geometry.coordinates[0];
      console.log(coordinates);
      input.value = JSON.stringify(coordinates);
    });

    //Display the current Polygon on Map
    this.map.on("load", function () {
      console.log(this);
      console.log(coordinates);
      this.addLayer({
        id: "polygon",
        type: "fill",
        source: {
          type: "geojson",
          data: {
            type: "Feature",
            geometry: {
              type: "Polygon",
              coordinates: coordinates,
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
  }
}
