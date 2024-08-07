#!/bin/bash

## Files and Data
PREV_TOTAL=0
PREV_IDLE=0
cpuFile="/tmp/.cpu_usage"

## Get CPU usage
get_cpu() {
    if [[ -f "${cpuFile}" ]]; then
        fileCont=$(cat "${cpuFile}")
        PREV_TOTAL=$(echo "${fileCont}" | head -n 1)
        PREV_IDLE=$(echo "${fileCont}" | tail -n 1)
    fi
    
    CPU=(`cat /proc/stat | grep '^cpu '`) # Get the total CPU statistics.
    unset CPU[0]                          # Discard the "cpu" prefix.
    IDLE=${CPU[4]}                        # Get the idle CPU time.
    
    # Calculate the total CPU time.
    TOTAL=0
    
    for VALUE in "${CPU[@]:0:4}"; do
        let "TOTAL=$TOTAL+$VALUE"
    done
    
    if [[ "${PREV_TOTAL}" != "" ]] && [[ "${PREV_IDLE}" != "" ]]; then
        # Calculate the CPU usage since we last checked.
        let "DIFF_IDLE=$IDLE-$PREV_IDLE"
        let "DIFF_TOTAL=$TOTAL-$PREV_TOTAL"
        let "DIFF_USAGE=(1000*($DIFF_TOTAL-$DIFF_IDLE)/$DIFF_TOTAL+5)/10"
        echo "${DIFF_USAGE}"
    else
        echo "?"
    fi
    
    # Remember the total and idle CPU times for the next check.
    echo "${TOTAL}" > "${cpuFile}"
    echo "${IDLE}" >> "${cpuFile}"
}

## Get Used memory
get_mem() {
    printf "%.0f\n" $(free -m | grep Mem | awk '{print ($3/$2)*100}')
}

## Get Battery Capacity
get_bat(){
    local BAT=`ls /sys/class/power_supply | grep BAT | head -n 1`
    cat /sys/class/power_supply/${BAT}/capacity
}

## Get Battery Icons

get_baticon() {
    local BAT=`ls /sys/class/power_supply | grep BAT | head -n 1`
    local BATPER=`cat /sys/class/power_supply/${BAT}/capacity`
    if [[ "$BATPER" -le "20" ]]; then
        echo " "
        elif [[ "$BATPER" -le "40" ]]; then
        echo " "
        elif [[ "$BATPER" -le "60" ]]; then
        echo " "
        elif [[ "$BATPER" -le "80" ]]; then
        echo " "
    else
        echo " "
    fi
}


## Get Brightness
get_blight() {
    local change=$1
    case "$change" in
        "up") xbacklight -inc 1;;
        "down") xbacklight -dec 1;;
        "") echo $(xbacklight -get);;
        *) echo "Unrecognized command.";;
    esac
}

## Get Brightness Icons
get_bliicon() {
    local bright=`xbacklight -get`
    if [[ "$bright" -le "20" ]]; then
        echo ""
        elif [[ "$bright" -le "40" ]]; then
        echo ""
        elif [[ "$bright" -le "60" ]]; then
        echo ""
        elif [[ "$bright" -le "80" ]]; then
        echo ""
    else
        echo ""
    fi
}


## Get Volume
get_vol() {
    local change=$1
    case "$change" in
        "up") pamixer -i 1;;
        "down") pamixer -d 1;;
        "") echo $(pamixer --get-volume);;
        *) echo "Unrecognized command.";;
    esac
}

## Get Volume Icons
get_volicon() {
    local mute=`pamixer --get-mute`
    local vol=`pamixer --get-volume`
    if [[ "$mute" == "true" ]]; then
        echo ""
        elif [[ "$vol" -le "20" ]]; then
        echo ""
        elif [[ "$vol" -le "40" ]]; then
        echo ""
        elif [[ "$vol" -le "60" ]]; then
        echo ""
        elif [[ "$vol" -le "80" ]]; then
        echo ""
    else
        echo ""
    fi
}


## Get Wifi
get_wifi() {
    local wifi=`nmcli con show --active`
    if [[ -z "$wifi" || -z `iwgetid -r` ]]; then
        echo "Disconnected"
    else
        echo `iwgetid -r`
    fi
}

get_wifiicon() {
    # Check if there's a connected network
    local wifi=$(iwctl station list | grep 'connected')

    if [[ -z "$wifi" ]]; then
      echo "󰤭 "
    else
      echo "󰤨 "
    fi
}

## Get Bluetooth
get_blue() {
    local blue=`rfkill | grep bluetooth | awk '{ print $4 }'`
    if [[ "$blue" = "blocked" ]];then
        echo "Disconnected"
    else
        echo "Connected"
    fi
}

## Get Bluetooth Icon
get_blueicon() {
    local blue=`rfkill | grep bluetooth | awk '{ print $4 }'`
    if [[ "$blue" = "blocked" ]];then
        echo ""
    else
        echo ""
    fi
}

## Get Temperature
get_temp()
{
    echo `sensors | grep Core | awk '{print substr($3, 2, 2)}' | awk '{ tot+=$1;cnt++ } END { print int(tot/cnt) }'`
}

## Get Temperature Icon
get_tempicon()
{
    echo ""
}

## Execute accordingly
case "$1" in
    "cpu") get_cpu;;
    "mem") get_mem;;
    "bat") get_bat;;
    "baticon") get_baticon;;
    "bli") get_blight "$2";;
    "bliicon") get_bliicon;;
    "vol") get_vol "$2";;
    "volicon") get_volicon;;
    "wifi") get_wifi;;
    "wifiicon") get_wifiicon;;
    "blue") get_blue;;
    "blueicon") get_blueicon;;
    "temp") get_temp;;
    "tempicon") get_tempicon;;
    "name") echo ${USER^};;
    *) echo "Unrecognized command";;
esac
