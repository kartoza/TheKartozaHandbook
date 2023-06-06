{ pkgs ? import <nixpkgs> {}}:

let
  my-python = pkgs.python310;
  python-with-my-packages = my-python.withPackages
    (p: with p; [ 
        mkdocs
        mkdocs-material
    ]);
in pkgs.mkShell {
  packages = [ 
    pkgs.vim 
  ];
  buildInputs = [
    python-with-my-packages
  ];
  shellHook = ''
    PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
  '';
}
