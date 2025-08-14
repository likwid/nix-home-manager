{ pkgs, ... }: {
  home.packages = [
    pkgs.devenv
    pkgs.zsh
  ];
}
