{ pkgs ? import <nixpkgs> {}}:

let
  my-python = pkgs.python310;
  python-with-my-packages = my-python.withPackages
    (p: with p; [ 
        mkdocs
        mkdocs-material
        pygobject3
    ]);
in pkgs.mkShell {
  packages = [ 
    pkgs.vim 
    pkgs.gobject-introspection
    pkgs.gtk3 
    pkgs.mkdocs
  ];
  buildInputs = [
    python-with-my-packages
  ];
  shellHook = ''
    PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
  '';
}
