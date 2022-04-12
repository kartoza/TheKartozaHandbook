# Contributing

Although [Kartoza](https://kartoza.com) is a privately held Open Source development and consulting company, the organisation deeply values transparency, delivery of value to the broader community, and continuous engagement with all stakeholders.

Community contributions to this documentation site and associated resources are welcome. Contributions are expected to adhere to the QGIS.org [Diversity Statement](https://qgis.org/en/site/getinvolved/governance/codeofconduct/diversitystatement.html) and [Code of Conduct](https://qgis.org/en/site/getinvolved/governance/codeofconduct/codeofconduct.html).

!!! info

    If you have any queries or feedback, please contact us at [info@kartoza.com](mailto: info@kartoza.com)

## Conventions

The following conventions outline expectations for contributions to this documentation project:

- Use grammar checking tools where available, such as grammarly or spell checking extensions for your IDE
- Request a review for internal changes before they are merged into the main repository
- Default to British English spellings rather than American English
- Do not commit sensitive information or links to non-public resources. This includes internal unlisted youtube channels, cloud storage repositories such as nextcloud, or personal details
- Due to the nature of the contents in this repository, when making large edits that do not create new content, communicate with team members to prevent collisions
- When producing assets such as images, ensure they are the minimum viable size and do not commit large resources to git
- Assets and media elements such as images are best left out of the source control where possible. Use an external storage system (e.g. minio/ s3), or paste an image into an image to get a GitHub reference to the media item rather than committing to git. This includes screenshots etc. that are likely to change or be updated over time. Use the assets directory to store assets that are not likely to change such as logos
- When using assets, upload them to a suitable file path according to their primary usage location, e.g. `assets/images/resources/cheatsheets/postgresql/joins.png`
- Due to the depth and breadth of these resources, it is necessary to manually index new pages in various subcategories to ensure access and discoverability
- It makes sense to use a consistent legend of emoji for tagging project and documentation items. Although it may have a steep initial learning curve or implementation strategy, using emoji and unicode symbols to tag elements is a fun and intuitive way to attach metadata to elements which makes visually scanning over documents and commit histories much more effective in multiple languages. Please see the [polyglot](polyglot.md) document for more information.
- Build and check your changes locally to catch any errors before committing them to the main repository
- TODO: come up with some formatting guideline (e.g. max line length etc)

## Tags, Badges, and Shields

[Tagging elements with emoji](polyglot.md) is useful for visual identification and search of various elements in broader categories, but sometimes more explicit metadata is required to be attached to something to indicate whether it constitutes a general resource, opinion, community standard, or whether something is a known reference item connected to an official SOP. One method of identifying such features may be using [shields.io](https://shields.io), for example:

- ![Best Practice](https://img.shields.io/badge/kartoza-best--practice-blue) `![Best Practice](https://img.shields.io/badge/kartoza-best--practice-blue)`
- ![Community](https://img.shields.io/badge/community-standard-brightgreen) `![Community](https://img.shields.io/badge/community-standard-brightgreen)`
- ![Industry](https://img.shields.io/badge/industry-standard-yellowgreen) `![Industry](https://img.shields.io/badge/industry-standard-yellowgreen)`

## Translations

Due to the scope and intension for frequent updates to this documentation, additional languages will not be supported at this time.

Translations and i18n are handled by the documentation framework, as outlined in the [mkdocs](https://www.mkdocs.org/dev-guide/translations/) and [mkdocs-material](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/) documentation.

## Framework

This documentation uses the [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) framework, and site configuration is specified in the mkdocs.yaml file. Various [extensions](https://squidfunk.github.io/mkdocs-material/setup/extensions) are supported to improve usability, such as [pymdown](https://facelessuser.github.io/pymdown-extensions/), which may be enabled via pull requests. Please note that only extensions which provide relevant value will be considered for integration, and extensions with significant learning curves or duplication should be avoided. Extensions which provide accessibility improvements are welcome.

## Building

The online documentation is built using github actions and published to the gh-pages branch.

To build the documentation locally, use the docker command `docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material build` to populate the _site_ directory with the static content. To serve the data for testing, a simple solution is to use a python webserver to serve the data at `127.0.0.1:9101` using the command `cd site && python -m http.server --bind 127.0.0.1 9101`.

Note that the generated site data and assets are explicitly excluded from git.
