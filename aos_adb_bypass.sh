#! /bin/bash

# ----------------------------------
#   Android - Bypass Setup Screen - Samsung & LG & FRP & Reactivation Lock Removal
#   Author: Jonathan Scott aka Jonathan Villarreal
#   Date: 10/19/2021
# ----------------------------------

source $HOME/The_Drive/bash_profile/dev/scripts/sleeping.sh

RED='\033[0;31m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

ios_rd_software_version=$(echo "RC-1c")

space(){

    echo ""

    }

    double_space(){

    echo ""
    echo ""

}

printf "\n${PURPLE}#################################################################################################################${NC}"
printf "\n${PURPLE}--------------------------------------AOS Unlocking Tools--------------------------------------------------------${NC}"
printf "\n${PURPLE}-----------------------------------------------------------------------------------------------------------------${NC}"
printf "\n${PURPLE}--------------------------------------Brought To You By: Jonathan Scott-------------------------------------${NC}"
printf "\n${PURPLE}--------------------------------------Version: ${ios_rd_software_version}----------------------------------------${NC}"
printf "\n${PURPLE}--------------------------------------This Application Will Bypass an Android------------------------------------${NC}"
printf "\n${PURPLE}--------------------------------------Samsung or LG Setup Screen ------------------------------------------------${NC}"
printf "\n${PURPLE}--------------------------------------FRP or Reactivation Locked Device can also be removed----------------------${NC}"
printf "\n${PURPLE}#################################################################################################################${NC}"

    #    echo "AT+GMM" | socat -t 2.0 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl



       printf "\n${PURPLE}[INFO] Please accept the RSA prompt if prompted${NC}\n"

           adb wait-for-device shell getprop | grep -o 'ro.adb.secure' | sed 's/ro.adb.secure/ADB Authorized/'

        double_space



        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell svc power stayon true"
        printf "\n${PURPLE}[INFO][+]${NC} This is only being sent to keep the screen awake"
                adb shell svc power stayon true

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure user_setup_complete 1"
                adb shell settings put secure user_setup_complete 1

         printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system setup_wizard_has_run 1"
            adb shell settings put global setup_wizard_has_run 1

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell pm clear com.samsung.klmsagent"
        printf "\n${PURPLE}[INFO][+]${NC} This is Samsung Specific"
            adb shell pm clear com.samsung.klmsagent

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell pm clear com.sec.android.app.SecSetupWizard"
        printf "\n${PURPLE}[INFO][+]${NC} This is Samsung Specific"

                adb shell pm clear com.sec.android.app.SecSetupWizard
                adb shell pm clear com.google.android.setupwizard

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell pm clear com.android.LGSetupWizard"
        printf "\n${PURPLE}[INFO][+]${NC} This is LG Specific"

                adb shell pm clear com.android.LGSetupWizard

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell monkey -c android.intent.category.HOME 1"
                adb shell monkey -c android.intent.category.HOME 1 &>/dev/null

        printf "\n${PURPLE}[INFO][+]${NC} Please wait while the device setup is being bypassed"


    space








    #printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure device_provisioned 1"
        # adb shell settings put global device_provisioned 1


    #printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell content insert --uri content://settings/secure --bind name:s:user_setup_complete --bind value:s:1"
        # adb shell content insert --uri content://settings/secure --bind name:s:user_setup_complete --bind value:s:1

#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell am start -a android.settings.HOME_SETTINGS"
#        adb shell content insert --uri content://settings/secure --bind name:s:user_setup_complete --bind value:s:1

#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell input keyevent DIALER"
#        adb shell input keyevent DIALER





#pm_list=$(adb shell pm list packages -s | grep "samsung\|Samsung" | awk -F ':' '{print $2}')
#
# for i in ${pm_list}; do
#    printf "\n${CYAN}[ATTENTION][!]${NC} Uninstalling the following system packages: ${i}\n"
#    adb shell pm uninstall "${i}"
# done

#adb shell 'for app in $(pm list packages -s); do pm uninstall ${app:#*:}; done';
#
#samsung_kill=$(adb shell pm list packages | grep -v "samsung\|Samsung" | awk -F ':' '{print $2}')
#
#for i in ${samsung_kill}; do
#    printf "\n${CYAN}[ATTENTION][!]${NC} Clearing the following system packages: ${i}\n"
#    adb shell pm clear "${i}"
#    printf "\n${CYAN}[ATTENTION][!]${NC} Uninstalling the following system packages: ${i}\n"
#    adb shell pm uninstall "${i}"
#done


# This documentation on how I came to write this application
#https://developer.android.com/reference/android/provider/Settings.Secure.html
#https://developer.android.com/reference/android/provider/Settings.System.html
#https://developer.android.com/reference/android/provider/Settings.Global.html
 

#system(){
   
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system lock_screen_shortcut_app_list 0"
#    adb shell settings put system lock_screen_shortcut_app_list 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system lock_screen_shortcut_number_of_apps 0"
#    adb shell settings put system lock_screen_shortcut_number_of_apps 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system finger_print_shortcut_list 0"
#    adb shell settings put system finger_print_shortcut_list 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system recommended_apps_setting 0"
#    adb shell settings put system recommended_apps_setting 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system recommended_apps_automatically 0"
#    adb shell settings put system recommended_apps_automatically 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system recommended_apps_list_roaming 0"
#    adb shell settings put system recommended_apps_list_roaming 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system toolbox_apps 0"
#    adb shell settings put system toolbox_apps 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system notification_panel_active_app_list_for_reset 0"
#    adb shell settings put system notification_panel_active_app_list_for_reset 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system any_screen_enabled 1"
#    adb shell settings put system any_screen_enabled 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system lock_screen_face_with_voice 0"
#    adb shell settings put system lock_screen_face_with_voice 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system screen_mode_automatic_setting 0"
#    adb shell settings put system screen_mode_automatic_setting 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system fingerprint_used_samsungaccount 0"
#    adb shell settings put system fingerprint_used_samsungaccount 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system fingerprint_confirmed_samsungaccount 0"
#    adb shell settings put system fingerprint_confirmed_samsungaccount 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system samsung_errorlog_agree 0"
#    adb shell settings put system samsung_errorlog_agree 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system lock_to_app_enabled 0"
#    adb shell settings put system lock_to_app_enabled 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system assistant_menu 1"
#    adb shell settings put system assistant_menu 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system any_screen_running 1"
#    adb shell settings put system any_screen_running 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system mtp_usb_connection_status 1"
#    adb shell settings put system mtp_usb_connection_status 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system mtp_open_session 1"
#    adb shell settings put system mtp_open_session 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system mtp_usb_conditions_met 1"
#    adb shell settings put system mtp_usb_conditions_met 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system mtp_running_status 1"
#    adb shell settings put system mtp_running_status 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system mtp_drive_display 1"
#    adb shell settings put system mtp_drive_display 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system samsung_eula_agree 1"
#    adb shell settings put system samsung_eula_agree 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system tty_mode 1"
#    adb shell settings put system tty_mode 1
    
#    printf "\n${PURPLE}[INFO][+]${NC}Sending command: emergency_mode 1"
#    adb shell settings put system emergency_mode 1
    
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system show_camera_shortcut 1"
#    adb shell settings put system show_camera_shortcut 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system access_control_enabled 1"
#    adb shell settings put system access_control_enabled 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system db_smartlock_supported 0"
#    adb shell settings put system db_smartlock_supported 0
    
    #printf "\n${PURPLE}[INFO][+]${NC}Sending command: PREVIOUS_SYS_TIME `date "+%s"`"
    #This is going to pull the current epoch time of the current host
    #adb shell settings put system PREVIOUS_SYS_TIME `date +%s`
    
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system icc_lock_enable 0"
#    adb shell settings put system icc_lock_enable 0



#}

#system



# this is a very interesting module, it contains the following
# disabling of ADB, disabling of specific keyboard commands, disabling of debugging
# if we modify the js file, and redirect the url that connects on boot them you can bypass everything, even enabling ADB over wifi
# I have beautified the js after doing a curl, and it is accessibility_decoded_samsung.js
# this is another one that I have to look into http://ssl.gstatic.com/accessibility/javascript/android/chromeandroidvox.js
#adb shell settings put secure accessibility_script_injection_url, value=https://ssl.gstatic.com/accessibility/javascript/android/AndroidVox_v1.js

# I need to look into this one below
# adb shell settings put secure android_id value=71cad4ce1299db7
# bluetooth settings
# adb shell settings put secure bluetooth_name value=SM-N910V
# adb shell settings put secure bluetooth_address value=50:F0:D3:6D:48:E5
# adb shell settings put secure bluetooth_addr_valid value=1
# name=input_methods_subtype_history, value=com.sec.android.inputmethod/.SamsungKeypad;1724758274

#secure(){

#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure backup_enabled 0"
#    adb shell settings put secure backup_enabled 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure accessibility_web_content_key_bindings ="
#    adb shell settings put secure accessibility_web_content_key_bindings =
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure install_non_market_apps 1"
#    adb shell settings put secure install_non_market_apps 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure lockscreen.options 0"
#    adb shell settings put secure lockscreen.options 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure lock_signature_visible_pattern 0"
#    adb shell settings put secure lock_signature_visible_pattern 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure lockscreen.disabled 1"
#    adb shell settings put secure lockscreen.disabled 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure lock_screen_lock_after_time 0"
#    adb shell settings put secure lock_screen_lock_after_time 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure facelock_liveliness_recognition_threshold 0"
#    adb shell settings put secure facelock_liveliness_recognition_threshold 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure facelock_max_center_movement 0"
#    adb shell settings put secure facelock_max_center_movement 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure facelock_detection_threshold 0"
#    adb shell settings put secure facelock_detection_threshold 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure ssl_session_cache 0"
#    adb shell settings put secure ssl_session_cache 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure locationPackagePrefixBlacklist ="
#    adb shell settings put secure locationPackagePrefixBlacklist =
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure input_methods_subtype_history ="
#    adb shell settings put secure input_methods_subtype_history =
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure enabled_accessibility_services 1"
#    adb shell settings put secure enabled_accessibility_services 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure accessibility_enabled 1"
#    adb shell settings put secure accessibility_enabled 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure touch_exploration_enabled 1"
#    adb shell settings put secure touch_exploration_enabled 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure config_update_certificate ="
#    adb shell settings put secure config_update_certificate =
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure pubkey_blacklist ="
#    adb shell settings put secure pubkey_blacklist =
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure serial_blacklist ="
#    adb shell settings put secure serial_blacklist =
    

    
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure first_enter_wifisetupwizard 1"
#    adb shell settings put secure first_enter_wifisetupwizard 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure adb_enabled 1"
#    adb shell settings put secure adb_enabled 1
    
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure lockscreen.disabled 1"
#    adb shell settings put secure lockscreen.disabled 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure screensaver_enabled 0"
#    adb shell settings put secure screensaver_enabled 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure backup_enabled 1"
#    adb shell settings put secure backup_enabled 1

#}

#secure

#global(){

#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put global auto_swipe_main_user 1"
#    adb shell settings put global auto_swipe_main_user 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put global restricted_device_performance 0"
#    adb shell settings put global restricted_device_performance 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put global guest_user_enabled 0"
#    adb shell settings put global guest_user_enabled 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put global adb_enabled_changed_by_usb_mode 0"
#    adb shell settings put global adb_enabled_changed_by_usb_mode 0
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put global adb_enabled 1"
#    adb shell settings put global adb_enabled 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put global stay_on_while_plugged_in 7"
#    adb shell settings put global stay_on_while_plugged_in 7

#}

#global


#setprop(){

#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell setprop sys.skip_lockscreen 1"
#    adb shell setprop sys.skip_lockscreen 1
#
#    printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell setprop sys.locksecured false"
#    adb shell setprop sys.locksecured false

#}

#setprop

