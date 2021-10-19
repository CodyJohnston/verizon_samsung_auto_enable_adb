#! /bin/bash
# Author: Jonathan Scott aka Jonathan Villarreal
# Date: October 19th, 2021 - Date of public release correction
#
# Description:
# Find the available modem CU ports on macOS.
# Identifies if Samsung driver is active over MacOS driver, and identifies LG modems. This can only be used for one device plugged in at a time.
# If there is an error because of more than one modem identified at a time, the script will account for that, and connect to the latest modem that has arrived.
#
# Dependencies: Python2 and 3, gsmterm.py
# Installation: pip install python-gsmmodem-new
#
#
# This will only work on Samsung Verizon Devices, you must use other auto enable adb options for different carriers
#
#
# This was the original code I wrote, it is still valid. As you can see there are indications of of LG in this code, I will be releasing that code as well. 

sam_modem=$(ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*\|cu.SAMSUNG_MDM" | wc -l)
lg_modem=$(ls -A /dev/* | grep -e "cu.lgusbmodem*" | wc -l)
modem_count=$(ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*\|cu.SAMSUNG_MDM\|cu.lgusbmodem*" | wc -l)
modem_list=$(python /usr/local/lib/python2.7/site-packages/serial/tools/list_ports_osx.py | sed '/Bluetooth/d;/AirPods/d' | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*\|cu.lgusbmodem*")



            if [[ ${modem_count} -ge 1 && ${sam_modem} -ge 1 ]]; then

                echo "--------------------------------"
                echo "Samsung Device(s) Found: ${modem_count}"
                echo "--------------------------------"
                # echo "Enabling ADB: ${modem_list}"
						echo "Enabling ADB"
						ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+SYSSCOPE=1,0" 1>/dev/null #S8 allow usb debugging
						sleep 5
						ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+USBMODEM ENABLE" 1>/dev/null #S8 allow usb debugging
						sleep 10
						echo "pressing always allow usb debugging to be connected"
						echo ""
						echo "Initializing"
						# ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+CSIM=?" #S8 & S8+ allow usb debugging
		# 				sleep 2
		# 				ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+CKPD=v" #S8 & S8+ allow usb debugging
		# 				sleep 2
                        ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+CTSA=2,170,1209" 1>/dev/null #S8 & S8+ allow usb debugging
						sleep 4
						ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+CTSA=2,1140,1558" 1>/dev/null #S7 Edge allow usb debugging
						sleep 8
						echo "Pressing usb debugging ok"
						echo ""
						ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+CTSA=2,880,1420" 1>/dev/null #S8 USB Debugging ok
						sleep 4
						ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+CTSA=2,928,1365" 1>/dev/null #S8+  USB Debugging ok
						sleep 4
						ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*" | xargs -n1 -I% modem-cmd % "AT+CTSA=2,1200,1786" 1>/dev/null #S7 Edge USB Debugging OK
						
                        
            else [[ ${modem_count} -eq 0 ]]
                echo "No Modem Found: Check Your Connection or Restart The Device."
                    sleep 3
            fi
			
			
			
