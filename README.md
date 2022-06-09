# Kartoza Handbook

Organisational Handbook and Technical Docs Repository for Kartoza. Here is where we highlight the procedures, principles, and processes related to Development, DevOps, and GIS, in line with the organisations best practices. Please review this content at [https://kartoza.github.io/TheKartozaHandbook](https://kartoza.github.io/TheKartozaHandbook) for more information.

## Building the Kartoza Handbook as a PDF

### Check out the code

You need both the Kartoza Handbook repo and the mkdocs pdf building repo:

```bash
git clone git@github.com:kartoza/TheKartozaHandbook.git
```

### Install Dependencies

You need so install these packages:

```bash
pip install mkdocs-with-pdf
pip install mkdocs-material
pip install mdx_gh_links
pip install mkdocs-pdf-export-plugin
```

Note the following assets are used during the building of the mkdocs project as a pdf:

```bash
docs/img/kartozaBackgroundBorder.png  
docs/img/logo.png
docs/css/extra.css
docs/assets/*.otf
mkdocs-pdf.yml
```


### Build the documentation

> Note that whenever you add new sections to nav in the mkdocs.yml 
> (used for building the web version), you should apply those same 
> edits to mkdocs-pdf.yml if you want those new sections to appear 
> in the pdf too.

```bash
mkdocs build --config-file mkdocs-pdf.yml
mv site/pdf/combined.pdf TheKartozaHandbook.pdf
xdg-open TheKartozaHandbook.pdf
```





