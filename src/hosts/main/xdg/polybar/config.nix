{ ... }: {
  environment.etc."xdg/polybar/config.ini".text = ''
    [bar/bspwm-DP-2]
    inherit = bar/bspwm

    monitor = DP-2

    [bar/bspwm-DP-0]
    inherit = bar/bspwm

    monitor = DP-0

    [bar/bspwm]
    modules-left = bspwm-xworkspaces

    background = #11111b
    border-color = #45475a
    foreground = #cdd6f4

    border-top-size = 2pt
    height = 20px
    bottom = true

    font-0 = "JetBrainsMono Nerd Font:style=Bold:size=10;3"
    wm-restack = bspwm

    [module/bspwm-xworkspaces]
    type = internal/xworkspaces

    pin-workspaces = true

    label-active = " %name% "
    label-active-background = #cba6f7
    label-active-foreground = #11111b

    label-occupied = " %name% "
    label-occupied-background = #181825

    label-empty =

    [module/bspwm-node-id]
    type = custom/script

    tail = true
    exec = bspc subscribe node_focus | while read event monitor_id desktop_id node_id; do echo $node_id; done

    [module/bspwm-node-flags]
    type = custom/script

    format-foreground = #45475a

    tail = true
    exec = echo "    "
  '';
}
