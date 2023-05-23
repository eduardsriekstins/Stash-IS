import "leaflet-css"
import { Controller } from "@hotwired/stimulus"
import "leaflet"
import L from "leaflet";    
delete L.Icon.Default.prototype._getIconUrl;

export default class extends Controller {
  static targets = [ "placeholder" ]

  connect(){

    L.Icon.Default.mergeOptions({
      iconUrl:       'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-black.png',
      shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
    });

    this.map = L.map(this.placeholderTarget,{zoomDelta:0.5,zoomSnap:0.5}).setView([ 50.1960, -6.8712 ], 10);
    L.tileLayer('https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(this.map);
    setTimeout(()=>{ this.map.invalidateSize()}, 1000);
    this.map.setView(new L.LatLng(56.880, 24.605), 7);
    const mapdiv = document.getElementById("map");
    const addressdiv = document.getElementById("address");
    const address = addressdiv.dataset.address;
    const lat = mapdiv.dataset.lat;
    const lon = mapdiv.dataset.lon;
    var marker = L.marker([lat, lon]).addTo(this.map);
    marker.bindPopup(address).openPopup();
  }

  disconnect(){
    this.map.remove()
  }

}