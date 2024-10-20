#!/bin/bash
# Set them to empty is NOT SECURE but avoid them display in random logs.
export VNC_PASSWD=''
export USER_PASSWD=''
export HTTP_AUTH_USER=''
export HTTP_AUTH_PASSWD=''

export DBUS_SESSION_BUS_ADDRESS=$(cat /var/run/dbus/DBUS_SESSION_BUS_ADDRESS)
export TERM=linux
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=fcitx

xdg-mime default xfe.desktop inode/directory
stalonetray --dockapp-mode simple &

if [ "$(arch)" = "x86_64" ]; then
	/opt/napcat.packet/napcat.packet.linux 2>&1 &
	sleep 2
fi

while true; do
	echo "[QQDaemon] Starting QQ ...."
	/opt/QQ/qq --no-sandbox &
	echo "[QQDaemon] Started QQ ."
	wait $!
	echo "[QQDaemon] QQ exited, auto start after 3 seconds ..."
	sleep 3
done
