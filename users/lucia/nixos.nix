{ pkgs, inputs, ... }:

{

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  users.users.lucia = {
    isNormalUser = true;
    home = "/home/lucia";
    extraGroups = [ "docker" "lxd" "wheel" "dialout" "tty"];
    shell = pkgs.bash;
    hashedPassword = "";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMAYiFyoiz/ZxOZP7TPusk8/I1x7Dcz6aG7KznK7VlcP"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
