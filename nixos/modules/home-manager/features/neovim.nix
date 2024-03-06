{ pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      coc-vimlsp
      coc-json
      coc-tsserver
      coc-clangd
      coc-lua
      coc-cmake
    ];
    coc = {
      enable = true;
      settings = {
        "clangd.arguments" = [ "--header-insertion=never" ];
        "codelens.enable" = true;
        "dialog.rounded" = true;
        "languageserver" = {
          "nix" = {
            "command" = "nil";
            "filetypes" = [ "nix" ];
            "rootPatterns" = [ "flake.nix" ];
            "settings" = {
              "nil" = {
                "formatting" = { "command" = [ "nixpkgs-fmt" ]; };
              };
            };
          };
        };
      };
    };
  };

  xdg.configFile."nvim" = {
    source = ../../../configs/nvim;
    recursive = true;
  };
}
