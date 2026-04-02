{ inputs, self, ... }: {
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
           
           ps2 = "if grep -qs /mnt/PS2 /proc/mounts
                       sudo umount /dev/sda2 && cd /home/zeon/udpbd-server/build && sudo ./udpbd-server.x86_64 /dev/sda2
                  else
                      cd /home/zeon/udpbd-server/build && sudo ./udpbd-server.x86_64 /dev/sda2
                  end";
           ps2-remount = "sudo mount -t exfat -o uid=1000,gid=1000 /dev/sda2 /mnt/PS2";
           
           dockerssh = "ssh root@192.168.0.194";
         };
      };
   };
}
