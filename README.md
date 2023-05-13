# Kartoza Handbook

Organisational Handbook and Technical Docs Repository for Kartoza. Here is where we highlight the procedures, principles, and processes related to Development, DevOps, and GIS, in line with the organisation's best practices. Please review this content at [https://kartoza.github.io/TheKartozaHandbook](https://kartoza.github.io/TheKartozaHandbook) for more information.

## Building the Kartoza Handbook as a PDF

### Check out the code

You need both the Kartoza Handbook repo and the mkdocs pdf building repo:

```bash
git clone git@github.com:kartoza/TheKartozaHandbook.git
```

### Install Dependencies (non direnv and venv way)

You need to install these packages:

```bash
pip install mkdocs-with-pdf
pip install mkdocs-material
pip install mdx_gh_links
pip install mkdocs-pdf-export-plugin
```

### Install Dependencies (venv way)

Initial setup

```bash
virtualenv --python=python3 env
source env/bin/activate
pip install -r requirements.txt
```

Subsequent sessions:

```bash
source env/bin/activate
```
When you are done with your session, deactivate your venv:

```bash
deactivate
```

### Using direnv (more preferred way)

Initial setup done once:

1. Install direnv with your package manager
2. Make sure it is set up in your bashrc 
```
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
source ~/.bashrc
```
3. Enter this git directory in your shell
4. ```pip install -r requirements.txt```

After this, whenever you enter the directory, direnv will load your direnv and penv for you. See .envrc for details on how it is configured.


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
