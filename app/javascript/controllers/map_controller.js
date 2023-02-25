import { Controller } from "@hotwired/stimulus"
// import { propertiesForValueDefinitionPair } from "@hotwired/stimulus/dist/types/core/value_properties"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}

 //  NOT SURE ABOUT FOLLOWING CODE
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
// // [...]
//   connect() {
//     // [...]
//     this.#addMarkersToMap()
//     this.#fitMapToMarkers()

//     this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
//                                         mapboxgl: mapboxgl }))
//   }
// private

// connect() {
//   // [...]
//   this.#addMarkersToMap()
//   this.#fitMapToMarkers()
// }

// // [...]
// #fitMapToMarkers() {
//   const bounds = new mapboxgl.LngLatBounds()
//   this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
//   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
// }
