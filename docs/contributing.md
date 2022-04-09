# Contributing

Although [Kartoza](https://kartoza.com) is a privately held Open Source development and consulting company, the organisation deeply values transparency, delivery of value to the broader community, and continuous engagement with all stakeholders.

Community contributions to this documentation site and associated resources are welcome. Contributions are expected to adhere to the QGIS.org [Diversity Statement](https://qgis.org/en/site/getinvolved/governance/codeofconduct/diversitystatement.html) and [Code of Conduct](https://qgis.org/en/site/getinvolved/governance/codeofconduct/codeofconduct.html).

!!! info

    If you have any queries or feedback, please contact us at [info@kartoza.com](mailto: info@kartoza.com)

## Conventions

The following conventions outline expectations for contributions to this documentation project:

- Use grammar checking tools where available, such as grammarly or spell checking extensions for your IDE
- Default to British English spellings rather than American English
- Do not commit sensitive information or links to non-public resources. This includes internal unlisted youtube channels, cloud storage repositories such as nextcloud, or personal details
- Due to the nature of the contents in this repository, when making large edits that do not create new content, communicate with team members to prevent collisions
- When producing assets such as images, ensure they are the minimum viable size and do not commit large resources to git
- Assets and media elements such as images are best left out of the source control where possible. Use an external storage system (e.g. minio/ s3), or paste an image into an image to get a GitHub reference to the media item rather than committing to git. This includes screenshots etc. that are likely to change or be updated over time. Use the assets directory to store assets that are not likely to change such as logos
- When using assets, upload them to a suitable file path according to their primary usage location, e.g. `assets/images/resources/cheatsheets/postgresql/joins.png`
- Due to the depth and breadth of these resources, it is necessary to manually index new pages in various subcategories to ensure access and discoverability

## Translations

Due to the scope and intension for frequent updates to this documentation, additional languages will not be supported at this time.

Translations and i18n are handled by the documentation framework, as outlined in the [mkdocs](https://www.mkdocs.org/dev-guide/translations/) and [mkdocs-material](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/) documentation.

## Framework

This documentation uses the [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) framework, and site configuration is specified in the mkdocs.yaml file. Various [extensions](https://squidfunk.github.io/mkdocs-material/setup/extensions) are supported to improve usability, such as [pymdown](https://facelessuser.github.io/pymdown-extensions/), which may be enabled via pull requests. Please note that only extensions which provide relevant value will be considered for integration, and extensions with significant learning curves or duplication should be avoided. Extensions which provide accessibility improvements are welcome.
