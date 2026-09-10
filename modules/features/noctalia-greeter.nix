{
  ...
}:
{
  flake.nixosModules.noctalia-greeter =
    {
      pkgs,
      ...
    }:
    {
      programs.noctalia-greeter = {
        enable = true;
        # Optional configuration
        greeter-args = "";
        settings = {
          cursor = {
            theme = "Posy_Cursor";
            size = 24;
            path = "${pkgs.posy-cursors}/share/icons";
          };
          keyboard = {
            layout = "us";
            numlock = true;
          };
        };
      };
    };
}
