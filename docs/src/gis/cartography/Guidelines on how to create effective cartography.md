# Guidelines on how to create effective cartography

This section is a collection of rules and mantras used by Kartoza to Make beautifull and effective catography.

## Symbol levels

![Symbol levels](docs/assets/images/symbollevels.gif)
Symbol levels tell QGIS in what order to draw the features symbols when there are multiple levels.

## Common issues in cartography

No. | Image | Description
----|-------|------------------------
1 | ![](img/overlapping-labels-and-features.png) | Dont let labels overlap features.
2 | ![](img/major-roads-cover-minor-roads.png) | Make sure that major roads cover minor roads.
3 | ![](img/scale-planning.png) | Set you canvas scale to the scale you plan to print at (1) then lock it (2) then when you zoom in and out with your scroll wheel it will zoom into pixels at the fixed scale (3).
4 | ![](img/abruptly-ending-roads.png) | Don't include roads on your map that end abruptly unless this indeed reflects reality.
5 | ![](img/road-cap-style.png) | Generally you should use a round cap style for your roads to avoid issues of the road cap extending beyond intersecting roads.
6 | ![](img/points-on-top.png) | As a general rule, points should be drawn above polygon and line features.
7 | ![](img/font-matches-language.png) | Use a font that matches the language of your map.
8 | ![](img/solid-symbol-layer-background.png) | Use symbol layers to place a solid background behind symbols which are transparent and are getting lost in the background.
9 | ![](img/inappropriate-transparency.png) | Do not use transparency inappropriately. Features like dams should be usually rendered with a solid fill.
10 | ![](img/avoid-visual-clutter.png) | Avoid visual clutter in your map. If there are too many features visible with similar contrast  your user will quickly become overwhelmed.

Template row:
1 | ![]() |
