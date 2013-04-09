#!/bin/sh

IP="";
IP2="2001:db8:0:32::2";
IP3="2001:db8:0:68::2";
IP=`ifconfig wlan0 inet6 | grep -E "inet6.[2001]" | awk '{print $2}'`;

ERR="";

if [ $IP == $IP3 ]
then
  echo "Current $IP";
	 `ifconfig wlan0 inet6 $IP delete`;
	 `ifconfig wlan0 inet6 add $IP2/64 ssid AP1`;
	 `route delete -inet6 default`;
	 `route add -inet6 default 2001:db8:0:32::1`;
	echo "New IP $IP2";
else
	echo "Current $IP"
	 `ifconfig wlan0 inet6 $IP2 delete`;
	 `ifconfig wlan0 inet6 add $IP3/64 ssid AP2`;
	 `route delete -inet6 default`;
	 `route add -inet6 default 2001:db8:0:68::1`;
	echo "New IP $IP3";
fi

echo "";
exit

