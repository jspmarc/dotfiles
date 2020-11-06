#!/bin/env  sh

# This is a menu to control music, brightness, volume, bluetooth, wifi; for now.
# TODO
# (!)(v) Music
# (!)( ) Rofi theme
# (!)( ) Change each function into an infinite loop so to not calls itself
# (!)( ) Change player in player control
# (?)( ) Realtime update

function brightness_control {
    set=" Set"
    dec=" 10%"
    inc=" 10%"
    back=" Back"
    exit="X Exit"

    selected=$(
        printf "%s\n%s\n%s\n%s\n%s" "$set" \
        "$dec" \
        "$inc" \
        "$back" \
        "$exit" | rofi -dmenu -config $HOME/script/rofi/quickSettings/backlight.rasi -p " "
    )

    [[ -z $selected ]] && exit
    case $selected in
        "$set")
            n=$(rofi -dmenu -config $HOME/script/rofi/quickSettings/backlight.rasi -p "Set to: ")
            xbacklight -set $n
            brightness_control
            ;;
        "$dec")
            xbacklight -dec 10
            brightness_control
            ;;
        "$inc")
            xbacklight -inc 10
            brightness_control
            ;;
        "$back")
            main
            ;;
        "$exit")
            exit
            ;;
        *)
            brightness_control
    esac
}

function volume_control {
    set=" Set"
    dec=" 10%"
    inc=" 10%"

    tmp=$(amixer sget Master | grep 'Front Left:' | awk '{print $6}')
    muted=${tmp:1:${#tmp}-2}
    if [[ 'on' == "$muted" ]]; then
        mute=" Mute"
    else
        mute=" Unmute"
    fi

    back=" Back"
    exit="X Exit"

    selected=$(
        printf "%s\n%s\n%s\n%s\n%s\n%s" "$set" \
        "$dec" \
        "$inc" \
        "$mute" \
        "$back" \
        "$exit" | rofi -dmenu -config $HOME/script/rofi/quickSettings/vol.rasi -p " "
    )

    [[ -z $selected ]] && exit
    case $selected in
        "$set")
            n=$(rofi -dmenu -config $HOME/script/rofi/quickSettings/vol.rasi -p "Set to: ")
            amixer -q set Master "$n%"
            volume_control
            ;;
        "$dec")
            amixer -q set Master 10%-
            volume_control
            ;;
        "$inc")
            amixer -q set Master 10%+
            volume_control
            ;;
        "$mute")
            tmp=$(amixer sget Master | grep 'Front Left:' | awk '{print $6}')
            muted=${tmp:1:${#tmp}-2}
            if [[ 'on' == "$muted" ]]; then
                amixer -q set Master mute
            else
                amixer -q set Master unmute
            fi
            volume_control
            ;;
        "$back")
            main
            ;;
        "$exit")
            exit
            ;;
        *)
            volume_control
    esac
}

function bluetooth_control {
    connection=""
    more=" More"
    back=" Back"
    exit="X Exit"

    if [[ $(bluetoothctl show 64:6E:69:A7:CC:68 | grep Powered | awk '{print $2}') == 'yes' ]]; then
        onf=" Turn off"
    else
        onf=" Turn on"
    fi

    if [[ $(bluetoothctl info) == "Missing device address argument" ]]; then
        connection="Not connected"
    else
        connection="Connected"
    fi

    selected=$(
        printf "%s\n%s\n%s\n%s\n%s" "$connection" \
        "$onf" \
        "$more" \
        "$back" \
        "$exit" | rofi -dmenu -config $HOME/script/rofi/quickSettings/bluetooth.rasi -p " "
    )

    [[ -z $selected ]] && exit
    case $selected in
        $onf)
            if [[ $(bluetoothctl show 64:6E:69:A7:CC:68 | grep Powered | awk '{print $2}') == 'yes' ]]; then
                bluetoothctl power off
            else
                bluetoothctl power on
            fi
            bluetooth_control
            ;;
        $more)
            blueman-manager
            exit
            ;;
        $back)
            main
            ;;
        $exit)
            exit
            ;;
        *)
            bluetooth_control
            ;;
    esac
}

function wifi_control {
    connection=""
    more=" More"
    back=" Back"
    exit="X Exit"

    wifi_off_icon=''
    wifi_on_icon=''

    if [[ $(nmcli radio wifi) == "enabled" ]]; then
        onf="${wifi_off_icon} Turn off"
        connection="Co: $(nmcli device | grep '^wlp3s0' | awk '{print $4}')"
    else
        connection="Dc: Off"
        onf="${wifi_on_icon} Turn on"
    fi

    selected=$(
        printf "%s\n%s\n%s\n%s\n%s" "$connection" \
        "$onf" \
        "$more" \
        "$back" \
        "$exit" | rofi -dmenu -config $HOME/script/rofi/quickSettings/wifi.rasi -p " "
    )

    [[ -z $selected ]] && exit
    case $selected in
        $onf)
            $HOME/script/toggleWLAN.sh
            wifi_control
            ;;
        $more)
            nm-connection-editor
            exit
            ;;
        $back)
            main
            ;;
        $exit)
            exit
            ;;
        *)
            wifi_control
            ;;
    esac
}

function player_control {
    #function change_player {
        #player=$(
            #playerctl -l | \
            #rofi -dmenu -config $HOME/script/rofi/quickSettings/player.rasi -p " "
        #)

        #[[ -z $selected ]] && player_control
    #}

    next=" Next"
    prev=" Prev"
    back=" Back"
    exit="X Exit"

    player=$(playerctl -l | head -n 1)

    status=$(playerctl status)
    case $status in
        "Paused")
            playpause=" Play"
            ;;
        "Playing")
            playpause=" Pause"
            ;;
        *)
            playpause="No media playing"
    esac

    selected=$(
        printf "%s\n%s\n%s\n%s\n%s" \
        "$playpause" \
        "$next" \
        "$prev" \
        "$back" \
        "$exit" | rofi -dmenu -config $HOME/script/rofi/quickSettings/player.rasi -p "${player:0:7}"
    )

    [[ -z $selected ]] && exit
    case $selected in
        $playpause)
            playerctl play-pause
            player_control
            ;;
        $next)
            playerctl next
            player_control
            ;;
        $prev)
            playerctl previous
            player_control
            ;;
        $back)
            main
            ;;
        $exit)
            exit
            ;;
        *)
            player_control
            ;;
    esac
}

function main {
    quickSettings_icon=''

    volume_icon=''
    volume_inc_icon=''
    volume_dec_icon=''
    volume_mute_icon=''

    brightness_bright_icon=''
    brightness_dim_icon=''

    bluetooth_icon=''
    bluetooth_pow_off_icon=''
    bluetooth_pow_on_icon=''

    wifi_off_icon=''
    wifi_on_icon=''

    player_icon=''

    exit_settings="X exit"

    # player settings selection
    player_settings="${player_icon} Player"

    # volume settings selection
    tmp=$(amixer sget Master | grep 'Front Left:' | awk '{print $5}')
    vol=${tmp:1:${#tmp}-2}
    notify-send "$vol"
    tmp=$(amixer sget Master | grep 'Front Left:' | awk '{print $6}')
    muted=${tmp:1:${#tmp}-2}
    if [[ 'on' == "$muted" ]]; then
        volume_settings="${volume_icon} ${vol}"
    else
        volume_settings="${volume_mute_icon} 00%"
    fi

    # brightness settings selection
    if [[ $(xbacklight -get) -ge 50 ]]; then
        brightness_settings="${brightness_bright_icon} $(xbacklight -get)%"
    else
        brightness_settings="${brightness_dim_icon} $(xbacklight -get)%"
    fi


    # wifi setting selection
    if [[ $(nmcli radio wifi) == "enabled" ]]; then
        wifi_settings="${wifi_on_icon} $(nmcli device | grep '^wlp2s0' | awk '{print $4}')"
    else
        wifi_settings="${wifi_off_icon} Off"
    fi

    # bluetooth settings selection
    #if [[ $(bluetoothctl show 64:6E:69:A7:CC:68 | grep Powered | awk '{print $2}') == 'yes' ]]; then
        #bluetooth_settings="${bluetooth_pow_on_icon} Bluetooth"
    #else
        #bluetooth_settings="${bluetooth_pow_off_icon} Bluetooth"
    #fi

    selected=$(
        printf "%s\n%s\n%s\n%s\n%s\n%s" "$volume_settings" \
        "$brightness_settings" \
        "$wifi_settings" \
        #"$bluetooth_settings" \
        "$player_settings" \
        "$exit_settings" | rofi -dmenu -config $HOME/script/rofi/quickSettings/quickSettings.rasi -p " "
    )

    [[ -z $selected ]] && exit
    case $selected in
        $volume_settings)
            volume_control
            ;;
        $brightness_settings)
            brightness_control
            ;;
        $wifi_settings)
            wifi_control
            ;;
        #$bluetooth_settings)
            #bluetooth_control
            #;;
        $player_settings)
            player_control
            ;;
        $exit_settings)
            exit
            ;;
        *)
            main
    esac
}

main
