{ ... }: {
  environment.etc."xdg/bspwm/sxhkdrc".text = ''
    super + Return
        kitty

    super + {q,r}
        bspc {quit,wm -r}

    super + {_,shift + }d
        bspc node -{c,k}

    super + m
        bspc desktop -l next

    super + f
        bspc node -t "~fullscreen"

    super + t
        /etc/xdg/bspwm/scripts/toggle_floating.sh

    super + s
        /etc/xdg/bspwm/scripts/toggle_floating_sticky.sh

    super + shift + s
        /etc/xdg/bspwm/scripts/toggle_tiled_sticky.sh

    super + {v,b}
        bspc node -g {marked,locked}

    super + y
        bspc query -N -n .focused | xclip -selection clipboard

    super + {_,shift + }a
        bspc node @parent -R { ,-}90

    super + {h,j,k,l}
        bspc node -f {west,south,north,east}

    super + {shift +,ctrl +}{h,j,k,l}
        bspc node -{n,s} {west,south,north,east} -f

    super + {_,shift + }n
        bspc node -f {next,prev}.local.!hidden.window

    super + bracket{left,right}
        bspc desktop -f {prev,next}.local

    super + {_,ctrl + }{1-9,0}
        bspc {desktop -f,node -d} {1-9,10}

    super + shift + {1-9,0}
        bspc node -d {1-9,10} -f

    super + ctrl + {h,j,k,l}
        bspc node -p {west,south,north,east}

    super + alt + {h,j,k,l}
        bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

    super + alt + shift + {h,j,k,l}
        bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

    super + {Left,Down,Up,Right}
        bspc node -v {-20 0,0 20,0 -20,20 0}
  '';
}
