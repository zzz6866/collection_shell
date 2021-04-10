#!/bin/sh
MODULES_DIR="/lib/modules"
MODULES_START=("cfg80211.ko" "88x2bu.ko rtw_switch_usb_mode=1")
MODULES_STOP=("88x2bu.ko" "cfg80211.ko")
start_modules() {
    echo "--- Load modules ---"
    for ((i = 0; i < ${#MODULES_START[@]}; i++)) do
        echo "Loading $MODULES_DIR/${MODULES_START[$i]}" 
        insmod $MODULES_DIR/${MODULES_START[$i]}
    done
	echo '4-2' | tee /sys/bus/usb/drivers/usb/unbind && echo '4-2' | tee /sys/bus/usb/drivers/usb/bind #usb load
}

stop_modules() {
    echo "--- Unload modules ---"
    for ((i = 0; i < ${#MODULES_STOP[@]}; i++)) do
        echo "Unloading $MODULES_DIR/${MODULES_STOP[$i]}" 
        rmmod $MODULES_DIR/${MODULES_STOP[$i]}
    done
}
case "$1" in start) start_modules ;; stop) stop_modules ;; *) echo "usage: $0 { start | stop }" exit 1 >&2 ;; esac
