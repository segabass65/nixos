{ ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = " -> ";
      };
      modules = [
        {
          type = "custom";
          format = " ENVIRONMENT";
          outputColor = "green";
        }
        {
          type = "shell";
          key = "├ Shell";
          keyColor = "green";
          format = "{pretty-name} {version}";
        }
        {
          type = "wm";
          key = "├ WM";
          keyColor = "green";
          format = "{pretty-name} ({protocol-name}) {version}";
        }
        {
          type = "terminal";
          key = "├ Terminal";
          keyColor = "green";
          format = "{pretty-name} {version}";
        }
        "break"
        {
          type = "custom";
          key = " OS";
          keyColor = "yellow";
          format = "GNU/Linux";
        }
        {
          type = "os";
          key = "├ Distro";
          keyColor = "yellow";
          format = "{pretty-name}";
        }
        {
          type = "kernel";
          key = "├ Kernel";
          keyColor = "yellow";
          format = "{sysname} {release}";
        }
        {
          type = "custom";
          key = "├ Bootloader";
          keyColor = "yellow";
          format = "systemd-boot";
        }
        {
          type = "initsystem";
          key = "├󰔛 Init System";
          keyColor = "yellow";
          format = "{name} {version}";
        }
        {
          type = "gpu";
          key = "├󱁤 Driver";
          keyColor = "yellow";
          format = "{driver}";
        }
        {
          type = "packages";
          key = "├󰏗 Packages";
          keyColor = "yellow";
        }
        {
          type = "disk";
          key = "├󰃭 Age";
          keyColor = "yellow";
          folders = "/";
          format = "{days} days";
        }
        "break"
        {
          type = "chassis";
          key = "󰒋 HARDWARE";
          keyColor = "red";
          format = "{type}";
        }
        {
          type = "cpu";
          key = "├ CPU";
          keyColor = "red";
          format = "{name}";
        }
        {
          type = "gpu";
          key = "├󰾲 GPU";
          keyColor = "red";
          format = "{name} ({type})";
        }
        {
          type = "memory";
          key = "├ RAM";
          keyColor = "red";
          format = "{total}";
        }
        {
          type = "command";
          key = "├󰋊 Storage";
          keyColor = "red";
          text = "lsblk -dbno SIZE | awk '{sum+=$1} END {printf \"%.2f GiB\\n\", sum / 1024^3}'";
        }
        "break"
        "break"
        "colors"
      ];
    };
  };
}
