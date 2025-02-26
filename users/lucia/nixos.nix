{ pkgs, inputs, ... }:

{

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  users.users.lucia = {
    isNormalUser = true;
    home = "/home/lucia";
    extraGroups = [ "docker" "lxd" "wheel" "dialout" "tty"];
    shell = pkgs.bash;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMAYiFyoiz/ZxOZP7TPusk8/I1x7Dcz6aG7KznK7VlcP"
    ];
    hashedPassword = "$6$/mP1IhHmmnTGeFs0$BNUzT8.vy6.bxfxHNB85yUlHQKiL7AwOn/.re.M71YKRW1ytj0keKdES4kokDazT7RXWMR5/bIk5lAUqOJKT10";
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
