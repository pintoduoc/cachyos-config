# Toggle using nmcli
if [ "$(nmcli -t -f DEVICE,STATE device | grep '^wlan0:' | cut -d: -f2)" = "connected" ]; then
    nmcli device disconnect wlan0
else
    nmcli device connect wlan0
fi
