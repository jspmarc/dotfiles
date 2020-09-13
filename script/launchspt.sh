#!/bin/env sh

if [[ -z "$(pgrep spotifyd)" ]]; then
	spotifyd
fi

spt
