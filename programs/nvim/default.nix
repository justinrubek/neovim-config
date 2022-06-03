{ pkgs, ... }:
let
  PWD = builtins.toString ./.;
  nvim-lsp-installer = pkgs.vimUtils.buildVimPlugin {
      name = "nvim-lsp-installer";
      src = pkgs.fetchFromGitHub {
        owner = "justinrubek";
        repo = "nvim-lsp-installer";
        rev = "4d35f4c";
        sha256 = "sha256-GMrNOCVcd0cM0jNaeuJhGQumuFaNeZT9Z7+5K5/y7jo=";
      };
  };
in
{
  enable = true;
  vimAlias = true;
  
  extraConfig = ''
    lua << EOF
    vim.defer_fn(function()
      vim.cmd [[
        luafile ${PWD}/settings.lua
        luafile ${PWD}/plugins/lsp.lua
        luafile ${PWD}/plugins/treesitter.lua
      ]]
    end, 70)
    EOF
  '';
  
  plugins = with pkgs.vimPlugins; [
    plenary-nvim
    indentLine

    # lsp
    nvim-lsp-installer
    nvim-lspconfig
    nvim-compe

    # navigation
    telescope-nvim

    # File tree
    nvim-web-devicons
    nvim-tree-lua

    # Aesthetic
    nvim-treesitter

  ];
}
