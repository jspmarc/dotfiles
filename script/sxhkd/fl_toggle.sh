#!/bin/sh
if [ -z "$(bspc query -N -n .focused.floating -d focused)" ]; then
	bspc node focused.tiled -t floating
else
	bspc node focused.floating -t tiled
fi
