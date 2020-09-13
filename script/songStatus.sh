#!/bin/env sh

#TODO
#(!)(v) Trailing text
#(!)( ) Fix when no player is running

while true;
do
	status=$(playerctl status 2>/dev/null &)
	if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
		separator="--"
		prefix=" | "

		pctl_title=$(playerctl metadata title 2>/dev/null &)

		if [[ -z $pctl_title ]]; then
			song=$(playerctl metadata artist 2>/dev/null &)
		else
			song=$(playerctl metadata --format "{{ title }}${separator}{{ artist }}" 2>/dev/null &)
		fi

		start_char=0
		want_charwidth=20
		real_charwidth=$(echo -n "$song" | wc -L)

		if [[ want_charwidth -lt real_charwidth ]]; then
			song="${song}${prefix}"
		fi


		while true;
		do
			if [[ $pctl_title != $(playerctl metadata title) ]]; then
				break
			fi

			pctl_status=$(playerctl status)
			if [[ want_charwidth -lt real_charwidth ]]; then

				printed_song=$(echo -n "${song:$start_char:$want_charwidth}")

				start_char=$(($start_char + 1))

				if [[ $(echo -n "$printed_song" | wc -L) -lt $want_charwidth ]]; then
					trailing_start=0
					diff=$(( $want_charwidth - $(echo -n "$printed_song" | wc -L) ))

					if [[ $diff -eq $want_charwidth  ]]; then
						start_char=0
						printed_song="${song:$start_char:$want_charwidth}"
						start_char=$(($start_char + 1))
					else
						printed_song="${printed_song}${song:$trailing_start:$diff}"
					fi
				fi

				#Bruteforcing when the length is larger then wanted
				temp_want=$(( $want_charwidth - 1 ))
				while [[ $(echo -n "$printed_song"| wc -L) -gt $want_charwidth ]]; do
					printed_song=$(echo -n "${printed_song:$trailing_start:$temp_want}")
					temp_want=$(( $temp_want - 1 ))
				done

			else #want_charwidth <= real_charwidth
				printed_song=$song
			fi

			case $pctl_status in
				"Playing")
					echo " $printed_song"
					;;
				"Paused")
					echo " $printed_song"
					;;
				*)
					echo " stopped"
					;;
			esac

			sleep 0.5
		done
	else
		echo " stopped"
	fi
done
