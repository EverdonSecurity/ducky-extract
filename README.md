# ducky-extract
```
Powershell 2.0 compatible  Rubbber Ducky Exfiltration Bundle
-------------------------------------------------------------------------------
gianfranco.alongi@everdonsecurity.com _ ____        rubber ducky exfiltration
            A.K.A                    | |___ \       software for Win 7,8,10
  _ __ ___   __ _ _ __ __ _ _   _  __| | __) |_ __  
 | '_ ` _ \ / _` | '__/ _` | | | |/ _` ||__ <| '__|
 | | | | | | (_| | | | (_| | |_| | (_| |___) | |   
 |_| |_| |_|\__,_|_|  \__,_|\__,_|\__,_|____/|_| 
-------------------------------------------------------------------------------

Rubber Ducky Exfiltration Code for Windows 7 SP1,8,10 (powershell 2.0 and upward) 
Exfiltrates User documents in background while showing a PDF in the foreground.
The attack is composed of three main parts (each one will be explained in 
more detail later)

  i. A PS1 script you need to do some slight modification on - called 0.ps1 
 ii. One Ducky Script you need to encode and put on the rubber ducky  - duckyscript.txt
iii. A PDF of your choise that you need to upload somewhere 

The attack is SAFE in that it leaves no traces leading to the exfiltrator.
A detailed Picture of the Attack can be seen in 001.jpg
So, if you want to use this, do the following

(1) Start by uploading your PDF to a service like transfer.sh, save the URL.
(2) Now choose an alias which is unlikely to collide - like h4xX0rSrul31337.
(3) Modify the PS1 script, and set the variables in the beginning of each block

	$ALIAS="h4xX0rSrul31337"
	$PDF="THE_URL_YOU_GOT_FROM_TRANSFER.SH"

(4) Now, upload the PS1 script to Pastebin, copy the RAW link (PASTEBIN_RAW_LINK).
(5) Modify the Ducky Script with the PASTEBIN_RAW_LINK
(6) Encode the Ducky Script and put on the rubber ducky.
(7) Put the rubber ducky into the victim machine.
(8) Visit the link http://tinyurl.com/$ALIAS to get your stuff
```
