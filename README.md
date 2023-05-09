# Kartoza Handbook

Organisational Handbook and Technical Docs Repository for Kartoza. Here is where we highlight the procedures, principles, and processes related to Development, DevOps, and GIS, in line with the organisation's best practices. Please review this content at [https://kartoza.github.io/TheKartozaHandbook](https://kartoza.github.io/TheKartozaHandbook) for more information.

## Building the Kartoza Handbook as a PDF

### Check out the code

You need both the Kartoza Handbook repo and the mkdocs pdf building repo:

```bash
git clone git@github.com:kartoza/TheKartozaHandbook.git
```

### Install Dependencies

You need to install these packages:

```bash
pip install mkdocs-with-pdf
pip install mkdocs-material
pip install mdx_gh_links
pip install mkdocs-pdf-export-plugin
```

### Build the documentation

> Note that whenever you add new sections to nav in the mkdocs.yml
> (used for building the web version), you should apply those same
> edits to mkdocs-pdf.yml if you want those new sections to appear
> in the pdf too.

```bash
cd  docs
./build-docs-pdf.sh
xdg-open TheKartozaHandbook.pdf
```

If you are in VSCode, you can also just run the 'Compile PDF' task. The
generated PDF will be placed in docs/pdfs/.
