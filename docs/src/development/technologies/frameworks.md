# Frameworks

Standardise on the frameworks used to encourage collaboration and efficiency.

## Cross platform

- [QT](https://www.qt.io/product/framework) (multiple)
- [React native](https://reactnative.dev/) (js)
- [Flutter](https://flutter.dev/) (dart)
- [Quasar](https://quasar.dev/) (js)
- [Beeware](https://beeware.org/) (python)
- [Kivy](https://kivy.org/) (python)

## Desktop

- See the cross platform section.
- [tauri](https://tauri.studio) (js/ rust): Uses a rust backend and javascript frontend as a more performant alternative to electron, which bundles chromium into every build.

## Mobile

If you're not going native, use the cross platform frameworks please.

## Web

- Django (python): Default to django. It's batteries included.
- Flask (python): Light weight python server
- FastApi (python): It's shiny, but pretty great. If you're a fan of starlette and async, and you only want a REST API, FastApi is where you might want to head. 90% of the time, use django+drf, or extend flask (more of the team can help you out there too). If you have to ask if you should use it, you probably shouldn't.
- Express (js): Serverside js.
- NextJS (js): Serverside react.
- Rails (ruby): If you are using or extending something in ruby (not recommended)
- [tauri](https://tauri.studio): Uses a rust backend and javascript frontend as a more performant alternative to electron, which bundles chromium into every build.

## Docs

Use Material Mkdocs

## Jamstack

Default to Hugo.

## GIS

OpenLayers, Leaflet, and CesiumJS. Turf.js, MapLibre. GeoDjango. pg_featureserv/ pg_tilserv.

## UI

Ensuring that consistent UI component libraries are used improves quality, efficiency, and consistency across applications and the overall UX.

### CSS frameworks

Bootstrap, bulma, tailwind

### Component libraries

Nobody will stop you from starting an app in kotlin, but it's unlikely to get the momentum or collaboration that is desired within the organisation.
