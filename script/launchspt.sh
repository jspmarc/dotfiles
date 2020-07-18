#!/bin/bash

if [[ -z "$(pgrep spotifyd)" ]]; then
	spotifyd
fi

spt
