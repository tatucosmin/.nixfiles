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

    # LSPs
    nil
    lua-language-server
  ];
}
