{
  ...
}:
{
  flake.homeModules.fish = {
    programs.home-manager.enable = true;
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        fastfetch
      '';
      functions = {

        server-u = "sudo mount -t nfs 192.168.0.205:/4TB /mnt/Server4TB";

        server-d = "sudo umount /mnt/Server4TB";

        server2-u = "sudo mount -t nfs 192.168.0.205:/750GB /mnt/Server4TB";

        ps2 = "/home/zeon/udpfs_server/udpfsd -fsroot /mnt/4TB/PS2 -bind 192.168.0.129 -verbose";

        dockerssh = "ssh root@192.168.0.194";
      };
      functions.fish_prompt = {
        body = ''
          set_color "#DB4343"
          echo -n (whoami)

          set_color normal
          echo -n "@"

          set_color normal
          echo -n (hostname)

          set_color "#DB4343"
          echo -n " "(prompt_pwd)

          set_color normal
          echo -n " > "

          echo
        '';
      };
    };
  };
}
