# Polyglot: The Emoji Map

Although it may have a steep initial learning curve or implementation strategy, using emoji and unicode symbols to tag elements is a fun and intuitive way to attach metadata to elements which makes visually scanning over documents and commit histories much more effective in multiple languages.

In order for this to be effective, a consistent method of referencing the emoji meanings is required. This is challenging because the utilisation of emoji are typically context specific, which requires a mapping of emoji meanings for various contexts.

> Kartoza values inclusion and diversity. Please contribute to ensure that the items represented here remain inclusive and fair wherever possible.

## gitmoji

Tagging commit messages in git is a useful tool for visually assessing the issues addressed by a particular commit.

A community standard has already been developed, available at [https://gitmoji.dev/](https://gitmoji.dev/)

### kitmoji (gitmoji-)

gitmoji is fairly comprehensive collection, and used quite widely in the tech community (relative to similar projects). The downside to this is that it is rather verbose and becomes cumbersome to learn and use.

The simple solution is to select a subset (kit) of the gitmoji icons and use them as broader higher level categories. This keeps things a bit more consistent and allows gradual adoption of the wider collection.
| Icon | Reference | Function |
| ---- | -------------------- | -------------- |
| ✨ | `:sparkles:` | New features. |
| 🐛 | `:bug:` | Bugfix. |
| ♻️ | `:recycle:` | Refactoring/ Comments. |
| 📝 | `:memo:` | Documentation. |
| 💄 | `:lipstick:` | UI |
| ⚡️ | `:zap:` | Performance. |
| 🚀 | `:rocket:` | CI/ CD. |
| ✅ | `:white_check_mark:` | Testing. |
| 🔒️ | `:lock:` | Security. |
| 🔥 | `:fire:` | Remove data. |
| ⏪️ | `:rewind:` | Revert changes. |
| ⚗️ / 💩 | `:alembic:` / `:poop:` | Experiments/ PoC/ bad code |

Not every commit has to have a gitmoji, but it's useful for common cases.

## GeoMoji

As with gitmoji, we need a consistent way to reference Geographic Information Elements. This could be related to data sources, licenses, tools, or standard metadata categories. Some may [confuse the concept of geomoji with generic symbology and signage](https://eos.org/geofizz/geomojis-translate-geoscience-across-any-language), but in this instance the reference is to a series of common Emoji characters which can be used as concise, visually effective hashtags that can be used across across applications, search tools, git messages, documentation, or social media. It would be great to extend this concept to a collection of map symbols (e.g. using emoji instead of a font library).

A alpha-state concept project is in development at [https://github.com/zacharlie/geomoji](https://github.com/zacharlie/geomoji).
