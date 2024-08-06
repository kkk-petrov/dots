!#/bin/bash

get_wifiicon() {
    # Get the current connected network and signal strength
    local wifi_info=$(iwctl station list | grep 'connected')
    
    if [[ -z "$wifi_info" ]]; then
        echo "/path/to/wifi0.svg"
        return
    fi
    
    # Extract the signal strength (assuming it is the 5th column; adjust if needed)
    local signal_strength=$(echo "$wifi_info" | awk '{print $5}')
    
    # Determine the icon based on signal strength
    if (( signal_strength >= -30 )); then
        echo "~/.config/eww/widgets/utils/icons/wifi5.svg"
    elif (( signal_strength >= -50 )); then
        echo "~/.config/eww/widgets/utils/icons/wifi4.svg"
    elif (( signal_strength >= -60 )); then
        echo "~/.config/eww/widgets/utils/icons/wifi3.svg"
    elif (( signal_strength >= -70 )); then
        echo "~/.config/eww/widgets/utils/icons/wifi2.svg"
    elif (( signal_strength >= -80 )); then
        echo "~/.config/eww/widgets/utils/icons/wifi1.svg"
    else
        echo "~/.config/eww/widgets/utils/icons/wifi0.svg"
    fi
}
