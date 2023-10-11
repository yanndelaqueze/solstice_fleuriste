// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application";

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

import TestController from "./test_controller";
application.register("test", TestController);

import PolygonDrawingController from "./polygon_drawing_controller";
application.register("polygon-drawing", PolygonDrawingController);

import AddressAutocompleteController from "./address_autocomplete_controller";
application.register("address-autocomplete", AddressAutocompleteController);

import DisplayDeliveryAreaController from "./display_delivery_area_controller";
application.register("display-delivery-area", DisplayDeliveryAreaController);

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
