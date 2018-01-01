zen-3d
========

[![Latest NPM release][npm-badge]][npm-badge-url]
[![License][license-badge]][license-badge-url]
[![Issues][issues-badge]][issues-badge-url]
![Dev Dependencies][devDependencies-badge]

### JavaScript 3D library ###

The aim of the project is to create an easy to use, lightweight, 3D/2D library. The library only provides WebGL renderers.

[Examples](https://shawn0326.github.io/zen-3d/examples/) &mdash;
[RoadMap](https://trello.com/b/7Ie3DDBP) &mdash;
[Documentation](https://shawn0326.github.io/zen-3d/docs/) &mdash;
[Tests](https://shawn0326.github.io/zen-3d/tests/)

[![image](./examples/resources/screenshot/screenshot1.png)](https://shawn0326.github.io/zen-3d/examples/#material_cubetexture_realtimeenvmap)
[![image](./examples/resources/screenshot/screenshot2.png)](https://shawn0326.github.io/zen-3d/examples/#material_cubetexture_envmap)
[![image](./examples/resources/screenshot/screenshot3.png)](https://shawn0326.github.io/zen-3d/examples/#canvas2d_canvas2d)
[![image](./examples/resources/screenshot/screenshot4.png)](https://shawn0326.github.io/zen-3d/examples/#webvr_car)
<br />
[![image](./examples/resources/screenshot/screenshot5.png)](https://shawn0326.github.io/zen-3d/examples/#animation_monster)
[![image](./examples/resources/screenshot/screenshot6.png)](https://shawn0326.github.io/zen-3d/examples/#sprite_sprites)
[![image](./examples/resources/screenshot/screenshot7.png)](https://shawn0326.github.io/zen-3d/examples/#material_shadermaterial)
[![image](./examples/resources/screenshot/screenshot8.png)](https://shawn0326.github.io/zen-3d/examples/#particle_particle)

### Build ###

* install [Node.js](https://nodejs.org) (include NPM).

* install devDependencies packages.

````
npm install
````

* you can run the following scripts

````
// build shader & zen3d
npm run default
// build zen3d
npm run build
// watch build zen3d
npm run watch
// build extensions
npm run extension
// build shader
npm run shader
// run qunit test
npm run test
// start a server to run examples
npm run example
````

build path is `./build`.

### Usage ###

you can use `zen3d.js` or `zen3d.min.js` in your page simply by this:

````html
<script src="zen3d.min.js"></script>
````

zen-3d use JSON([assimp2json](https://github.com/acgessler/assimp2json)) as default supported format of model.


[npm-badge]: https://img.shields.io/npm/v/zen-3d.svg
[npm-badge-url]: https://www.npmjs.com/package/zen-3d
[license-badge]: https://img.shields.io/npm/l/zen-3d.svg
[license-badge-url]: ./LICENSE
[issues-badge]: https://img.shields.io/github/issues/shawn0326/zen-3d.svg
[issues-badge-url]: https://github.com/shawn0326/zen-3d/issues
[devDependencies-badge]: https://img.shields.io/librariesio/github/shawn0326/zen-3d.svg
