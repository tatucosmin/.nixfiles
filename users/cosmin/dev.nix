{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # I wonder what this language is
    zig

    # C++
    libcxx
    clang-tools
    clang

    # Shared
    llvm
    lldb

    # Other
    nil
  ];
}
