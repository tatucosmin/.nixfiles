{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # I wonder what this language is
    zig
    zls

    # C++
    libcxx
    clang-tools
    clang

    # Shared
    llvm
    lldb

    # HTML
    superhtml

    # Python
    python315
    ruff
    ty

    # Nix
    nil

    # Lua
    lua-language-server
  ];
}
