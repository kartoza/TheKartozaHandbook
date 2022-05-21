# MkDocs PDF

Serving a local clone of this documentation with docker is as simple as `docker run --rm -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material`.

This process walks through attempting to setup an environment with Docker that will produce PDF documentation for a MkDocs site with A MkDocs-Material Theme (Like this one).

Create a dockerfile with the relevant dependencies in line with the [mkdocs-material docs](https://squidfunk.github.io/mkdocs-material/getting-started/#with-docker) and the [mkdocs-pdf-export-plugin](https://github.com/zhaoterryy/mkdocs-pdf-export-plugin).

```
FROM squidfunk/mkdocs-material:8.2.15

# RUN pip install mkdocs-pdf-export-plugin

# Thanks to:
# https://stackoverflow.com/questions/71372066/docker-fails-to-install-cffi-with-python3-9-alpine-in-dockerfile
# https://github.com/Kozea/WeasyPrint/issues/699

RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers \
    && apk add musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-dev gdk-pixbuf

RUN python -m pip install --upgrade pip && \
    python -m pip install mkdocs-pdf-export-plugin

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
```

Now create the custom mkdocs-material docker image with the command `docker build -t my-mkdocs .`.

Once this image is built, edit the `mkdocs.yml` file to include the plugin:

```
plugins:
  - search
  - pdf-export
```

Now you can run the documentation with the command `docker run --rm -p 8000:8000 -v ${PWD}:/docs my-mkdocs`.

!!! danger "WARNING"

    This docker file takes rather a long time to start up...

The docker logs will hang while the documentation is built. This is much slower with the PDF export plugin.

```
warnings.warn(
INFO     -  Cleaning site directory
INFO     -  The following pages exist in the docs directory, but are not included in the "nav" configuration:
  - development/conventions/dev_processes.md
  - development/conventions/git.md
  - development/conventions/ides.md
  - development/conventions/project_processes.md
  - development/environments/links.md
  - development/environments/vscode/extension_install.md
  - development/environments/vscode/links.md
  - development/technologies/frameworks.md
  - development/technologies/languages.md
  - devops/infrastructure/personal_infrastructure.md
  - devops/infrastructure/rancher-k3s-single-node.md
  - devops/security/links.md
  - library/cheatsheets/bash.md
  - library/cheatsheets/postgresql.md
  - library/media/newsletters.md
  - library/tutorials/general/index.md
  - library/tutorials/general/google-meet.md
  - library/tutorials/general/jitsi.md
  - library/tutorials/general/zoom.md
  - library/tutorials/links/index.md
  - library/tutorials/qgis/index.md
```

After a long wait period, the docker log should let you know the system is running and you can access the site on your local machine from the URL http://127.0.0.1:8000

```
INFO     -  Documentation built in 224.82 seconds
INFO     -  [11:40:10] Watching paths for changes: 'docs', 'mkdocs.yml'
INFO     -  [11:40:10] Serving on http://0.0.0.0:8000/
```

Once it's built it should include a pdf export button at the top of each page.

TODO:

- Add theming/ customization
- Incorporate into GitHub Pages site and actions
