# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "stimulus-carousel", to: "https://ga.jspm.io/npm:stimulus-carousel@5.0.1/dist/stimulus-carousel.mjs"
pin "dom7", to: "https://ga.jspm.io/npm:dom7@4.0.4/dom7.esm.js"
pin "ssr-window", to: "https://ga.jspm.io/npm:ssr-window@4.0.2/ssr-window.esm.js"
pin "swiper/bundle", to: "https://ga.jspm.io/npm:swiper@8.4.5/swiper-bundle.esm.js"
pin "stimulus-lightbox", to: "https://ga.jspm.io/npm:stimulus-lightbox@3.2.0/dist/stimulus-lightbox.mjs"
pin "lightgallery", to: "https://ga.jspm.io/npm:lightgallery@2.7.0/lightgallery.es5.js"
pin "leaflet", to: "https://ga.jspm.io/npm:leaflet@1.9.3/dist/leaflet-src.js"
pin "leaflet-css", to: "https://ga.jspm.io/npm:leaflet-css@0.1.0/dist/leaflet.css.min.js"
pin "leaflet-control-geocoder", to: "https://ga.jspm.io/npm:leaflet-control-geocoder@2.4.0/dist/Control.Geocoder.modern.js"
