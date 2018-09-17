#Script para la funcion infosis.sh

	echo "Para fecha digite -f para hora digite -h"
	read banderas
	case $banderas in
		-f )
			cat /sys/class/rtc/rtc0/date
			;;
		-h )
			cat /sys/class/rtc/rtc0/time
	esac
