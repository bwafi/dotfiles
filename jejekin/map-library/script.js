let map;
let marker;
let coordinateDefault = [-6.229846469045478, 106.8269535846587];

const initializeMap = (coordef) => {
  map = L.map("map").setView(coordef, 10);
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png").addTo(map);
  marker = L.marker(coordef).addTo(map);
};

initializeMap(coordinateDefault);

const changeMap = (coord, zoom, popup) => {
  map.setView(coord, zoom);
  marker.setLatLng(coord).bindPopup(popup).openPopup();
};

const locationTitle = document.querySelector(".title-location");
const mouseLocation = document.querySelector(".coordinate");

document.getElementById("jejakin").addEventListener("click", () => {
  changeMap([-6.229846469045478, 106.8269535846587], 15, "<p>Jejakin Map</p>");
  locationTitle.innerHTML = "Jejekin Map";
});

document.getElementById("syahroni").addEventListener("click", () => {
  changeMap([-8.111554, 113.396259], 13, "<p>Syahroni Map</p>");
  locationTitle.innerHTML = "Syahroni Map";
});

map.on("mousemove", (e) => {
  mouseLocation.innerHTML =
    "Koordinat Mouse : " +
    e.latlng.lat.toFixed(6) +
    ", " +
    e.latlng.lng.toFixed(6);
});
