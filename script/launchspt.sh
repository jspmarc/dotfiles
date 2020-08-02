#!/usr/bin/env bash

if [[ -z "$(pgrep spotifyd)" ]]; then
	spotifyd
fi

spt
