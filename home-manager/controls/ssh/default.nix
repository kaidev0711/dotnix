{ config, pkgs, lib, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
}
