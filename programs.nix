{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.gh.enable = true;
  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake .#default";
      sz = "source ~/.zshrc";
    };
    initContent = builtins.readFile ./zshrc;
  };
}
