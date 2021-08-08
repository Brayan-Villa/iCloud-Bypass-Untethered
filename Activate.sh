#!/bin/bash
function point1()
{
  clear&&point2
}
function point2()
{
  SN=$(ideviceinfo | grep -w SerialNumber | awk '{printf $NF}');
  AS=$(ideviceinfo | grep -w ActivationState: | awk '{printf $NF}');
  UD=$(ideviceinfo | grep UniqueDeviceID | awk '{printf $NF}');
  IM=$(ideviceinfo | grep InternationalMobileEquipmentIdentity | awk '{printf $NF}');
  if test -z "$AS"; 
    then
		  idevicepair pair &>>/dev/nul& echo 'TU DISPOSITIVO NO HA SIDO DETECTADO, SE INTENTARÁ PAREAR CON LA PC';
		  echo 'SI TU DISPOSITIVO ESTÁ CONECTADO, PRECIONA CONFIAR EN CASO DE QUE SE TE SOLICITE';sleep 3;point1
echo '';
		  echo 'YOUR DEVICE HAS NOT BEEN DETECTED, IT WILL TRY TO STOP WITH THE PC ';
		  echo 'IF YOUR DEVICE IS CONNECTED, PRICE TO TRUST IN CASE YOU ARE REQUESTED';sleep 3;point1
    else
		 rm ~/.ssh/known_hosts&&iproxy 22 44 &>>/dev/nul&
		  echo '¡DISPOSITIVO DETECTADO CON ÉXITO!';echo '';echo 'DEVICE DETECTED SUCCESSFULLY!';
		  sleep 3; clear;
		  echo 'INTENTANDO MOSTRAR DATOS DEL iDEVICE';echo '';echo 'TRYING TO DISPLAY DATA FROM iDEVICE';
		  sleep 2; echo ''; echo '';
		  echo 'Estado de Activación:	'$AS'';
		  echo 'Numero de Serie:	'$SN'';
		  echo 'IMEI:			'$IM'';
		  echo 'UniqueDeviceID:		'$UD''; echo '';
		  echo 'Activation Status:	'$AS '';
		  echo 'Serial Number:		'$SN '';
		  echo 'IMEI:			'$IM '';
		  echo 'UniqueDeviceID:		'$UD '';
		  read -p 'PRECIONA ENTER PARA INICIAR EL PROCESO	 PRESS ENTER TO START THE PROCESS';
   fi      
}
echo "VERIFICANDO INSTALACIÓN DE DEPENDENCIAS"; echo ''; echo "VERIFYING DEPENDENCE INSTALLATION"; sleep 3; clear;
Check=$(find /usr/bin -iname "LibimobiledeviceEXE");
if test -z "$Check"; 
  then
    echo 'DESCARGANDO DEPENDENCIAS NECESARIAS'; echo '';echo 'DOWNLOADING NECESSARY DEPENDENCES'; sleep 2; echo '==============================================';
    cd /usr/bin/ && git clone https://github.com/Brayan-Villa/LibimobiledeviceEXE; 
    cd /usr/bin/LibimobiledeviceEXE/ && mv ./* ../;
    echo '=============================================='; echo '';
    echo 'COMPLETADO!'; sleep 3; point1;
  else
    point1;
fi
function Inicio() {	  
rm tokenfinal tokenpre activ &>>/dev/nul&
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'mount -o rw,union,update /';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'snappy -f / -r `snappy -f / -l | sed -n 2p` -t orig-fs';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -rf /usr/libexec/substrate /usr/libexec/substrated /usr/bin/cycc /usr/bin/cynject /./Library/Frameworks/* /usr/lib/cycript0.9 /usr/lib/libsubstrate.dylib /Library/MobileSubstrate /usr/include/substrate.h /usr/lib/substrate';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'cp -rp /./System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/FactoryActivation.pem /./System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chflags -R nouchg /private/var/mobile/Library/Preferences';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -f /private/var/mobile/Library/Preferences/*purplebuddy*';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chflags -R nouchg /private/var/wireless/Library/Preferences';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -f /private/var/wireless/Library/Preferences/*device_*';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(find /./private/var/containers/Data/System -iname "internal"); chflags -R nouchg $GUI; rm -rf $GUI; key=$(find ./ -iname "activation_records"); if test -z $key; then echo ""; else chflags -R nouchg activation_records; rm -rf activation_records; fi ';
sshpass -p 'alpine' scp -p ./lzma root@localhost:'/./usr/bin/';
sshpass -p 'alpine' scp -p ./plutil root@localhost:'/./usr/bin/';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chmod -R 00755 /usr/bin';
sshpass -p 'alpine' scp -p ./boot root@localhost:'/./ref.tar.lzma';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'lzma -d -v /./ref.tar.lzma'; 
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'tar -xvf /./ref.tar -C /./';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chmod -R 00755 /usr/bin /usr/libexec /sbin /bin /usr/sbin';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'BasebandON &>/log; rm /./ref.tar';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost '/usr/libexec/substrate';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost '/usr/libexec/substrated';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'echo "{ Filter = { Bundles = ( \"com.apple.mobileactivationd\", \"com.apple.Security\" ); }; }" &>/./Library/MobileSubstrate/DynamicLibraries/untethered.plist';
sshpass -p 'alpine' scp -p ./untethered root@localhost:'/./Library/MobileSubstrate/DynamicLibraries/untethered.dylib';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'plutil -binary /./Library/MobileSubstrate/DynamicLibraries/untethered.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chmod 00777 /./Library/MobileSubstrate/DynamicLibraries/untethered.dylib';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'cd /System/Library && launchctl unload LaunchDaemons/com.apple.mobile.lockdown.plist && launchctl unload LaunchDaemons/com.apple.mobileactivationd.plist && launchctl load LaunchDaemons/com.apple.mobile.lockdown.plist && launchctl load LaunchDaemons/com.apple.mobileactivationd.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(uicache --respring && killall SpringBoard mobileactivationd); if test -z "$key"; then killall HUD SpringBoard mobileactivationd; else echo '' >>/dev/nul; fi';
idevicepair pair;
#==================================WARNING==================================

# UN BILLETE GENERADO POR LA TERMINAL YA NO SERÁ UTILIZADO.
# DEBE MONTAR SU SERVIDOR DE ACTIVACIÓN PARA HACER UNA LLAMADA
# AQUÍ DEPENDERÁ DE SU SERVIDOR SI SU DISPOSITIVO ESTÁ ACTIVADO POR COMPLETO

# A TICKET GENERATED BY THE TERMINAL WILL NO LONGER BE USED.
# YOU NEED TO MOUNT YOUR ACTIVATION SERVER TO MAKE A CALL
# HERE WILL DEPEND ON YOUR SERVER IF YOUR DEVICE IS FULL ACTIVATED

#==================================WARNING==================================

ideviceactivation activate -d -s https://

sleep 5;

sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); chflags -R nouchg $key';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); plutil -"-BootSessionRTCResetCount" -remove $key/data_ark.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); plutil -"-BootSessionUUID" -remove $key/data_ark.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); plutil -"-BrickState" -remove $key/data_ark.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); plutil -"-TotalRTCResetCount" -remove $key/data_ark.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); plutil -"-UIKLegacyMigrationCompleted" -remove $key/data_ark.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); plutil -"-ActivationState" -remove $key/data_ark.plist && rm /guid';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(find /private/var/containers/Data/System -iname "activation_records"); plutil -UniqueDeviceCertificate -remove $GUI/activation_record.plist; plutil -LDActivationVersion -remove $GUI/activation_record.plist; chflags -R uchg $GUI/'

sshpass -p 'alpine' scp -p ./iuntethered root@localhost:'/./Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'echo "{ Filter = { Bundles = ( \"com.apple.mobileactivationd\" ); }; }" &>/./Library/MobileSubstrate/DynamicLibraries/iuntethered.plist';

sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chmod 00755 /./Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'cd /System/Library && launchctl unload -w -F LaunchDaemons*';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -f /./Library/MobileSubstrate/DynamicLibraries/untethered.dylib';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -f /./Library/MobileSubstrate/DynamicLibraries/untethered.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chflags nouchg /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'plutil -kPostponementTicket -remove /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'plutil -dict -kPostponementTicket /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'plutil -kPostponementTicket -ActivationState -string Activated /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'plutil -kPostponementTicket -ActivityURL -string https://albert.apple.com/deviceservices/activity /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'plutil -kPostponementTicket -PhoneNumberNotificationURL -string https://albert.apple.com/deviceservices/phoneHome /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'plutil -kPostponementTicket -ActivationTicket -string "MIICogIBATALBgkqhkiG9w0BAQsxaJ8/BCIpOuefQAThUH8An0sU8u7ynkFtjU5iK7LCVPXvf1IsCsqfh20HNWFRCSOYRJ+XPQwAAAAA7u7u7u7u7u+flz4EAAAAAJ+XPwQBAAAAn5dABAEAAACfl0EEAQAAAJ+XTAQAAAAABIIBADqStNCOV64BLCKVls72U5Bwh8qTJHwaQtkPjUj/wh3RbtC45BoDNebydW4RmSefowABaXRYFfGFhuyXHxfQyxre5gDMh6CftLMQdSuE0tLHw+Kki0me5xFxBFHtwQdt/fgd1VRnNUI8zokLGfjm4N8V3A6oMvnDwZLlZMci7jPhDOk7OW2P6XD0RCirK6kaYMQEgJdPr5lCUJRv2ywc0URrGMWNvU759pObUPjHgIvqNXY+7MeLi3vKqRpft7beOwDohoo1e1+GVQVGYP7qYYmNBMJlLFO75h8bDaSMc3a5MfDgwDekbZn7Q0ZiQ2TPHB/FQSsbfphSRWfnmr9b3/mjggEgMAsGCSqGSIb3DQEBAQOCAQ8AMIIBCgKCAQEArJFPRdnc/E7Vgatg/AHbKnGEudR+ug8WZghxMOlPad3fL42hHAXReVRcBE5liQXEyaP0ojy3s3QJhuNEXwLMYOLCKJNAj4SrE6dZqJ9CQamouvEnZjdC/gLBG5jSuAI4zF+hjObe8OZnV6YGcooEbRkA51dj+x5zmY+vT0va/w+EOdAiTWi6xiWdVFQTXCpCTUzA9qcax58XUi04+dcVSEwVO9U3ZeyoIUrJD/FmoDjjZOidCHDgsCGlnLfQP/gLKOMpOfzw4dWFIW1IiDvs9Uy+U3YhyyE4HPDVx2oAf8ojhBMzsdqXGVV148H0mZSkR4+ulZVlR4E/mxB2ZdP7HQIDAQAB" /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'cd /System/Library && launchctl load -w -F LaunchDaemons*';

sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "data_ark.plist"); build=$(ls /private/var/root/Library/Caches/com.apple.coresymbolicationd); plutil -"-BuildVersion" -string $build $key';	
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "data_ark.plist"); build=$(ls /private/var/root/Library/Caches/com.apple.coresymbolicationd); plutil -"-LastActivated" -string $build $key';	
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "data_ark.plist"); build=$(ls /private/var/root/Library/Caches/com.apple.coresymbolicationd); plutil -"-ActivationState" -remove $key';	
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "data_ark.plist"); build=$(ls /private/var/root/Library/Caches/com.apple.coresymbolicationd); plutil -"-BrickState" -remove $key';	
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "data_ark.plist"); build=$(ls /private/var/root/Library/Caches/com.apple.coresymbolicationd); plutil -"-ActivationState" -string Activated $key';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "data_ark.plist"); build=$(ls /private/var/root/Library/Caches/com.apple.coresymbolicationd); plutil -"-BrickState" -0 -false $key';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "data_ark.plist"); plutil -binary $key';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'key=$(find /private/var/containers/Data/System -iname "internal"); chflags -R uchg $key';

sshpass -p 'alpine' scp -p ./purplebuddy root@localhost:'/./private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'Purple="/./private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist"; chown mobile $Purple; chmod 00600 $Purple; chflags uchg $Purple';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -f /usr/libexec/substrate*';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm /usr/bin/cy*';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -rf /./Library/Frameworks/*';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -rf /usr/lib/cycript0.9';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm /usr/lib/libsubstrate.dylib';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -rf /./Library/MobileSubstrate';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm /usr/include/substrate.h';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm -rf /usr/lib/substrate';

echo 'Y2hmbGFncyBub3VjaGcgL3ByaXZhdGUvdmFyL3dpcmVsZXNzL0xpYnJhcnkvUHJlZmVyZW5jZXMvY29tLmFwcGxlLmNvbW1jZW50ZXIuZGV2aWNlX3NwZWNpZmljX25vYmFja3VwLnBsaXN0OyBwbHV0aWwgLWtQb3N0cG9uZW1lbnRUaWNrZXQgLXJlbW92ZSAvcHJpdmF0ZS92YXIvd2lyZWxlc3MvTGlicmFyeS9QcmVmZXJlbmNlcy9jb20uYXBwbGUuY29tbWNlbnRlci5kZXZpY2Vfc3BlY2lmaWNfbm9iYWNrdXAucGxpc3Q7IHBsdXRpbCAtZGljdCAta1Bvc3Rwb25lbWVudFRpY2tldCAvcHJpdmF0ZS92YXIvd2lyZWxlc3MvTGlicmFyeS9QcmVmZXJlbmNlcy9jb20uYXBwbGUuY29tbWNlbnRlci5kZXZpY2Vfc3BlY2lmaWNfbm9iYWNrdXAucGxpc3Q7IHBsdXRpbCAta1Bvc3Rwb25lbWVudFRpY2tldCAtQWN0aXZhdGlvblN0YXRlIC1zdHJpbmcgQWN0aXZhdGVkIC9wcml2YXRlL3Zhci93aXJlbGVzcy9MaWJyYXJ5L1ByZWZlcmVuY2VzL2NvbS5hcHBsZS5jb21tY2VudGVyLmRldmljZV9zcGVjaWZpY19ub2JhY2t1cC5wbGlzdDsgcGx1dGlsIC1rUG9zdHBvbmVtZW50VGlja2V0IC1BY3Rpdml0eVVSTCAtc3RyaW5nIGh0dHBzOi8vYWxiZXJ0LmFwcGxlLmNvbS9kZXZpY2VzZXJ2aWNlcy9hY3Rpdml0eSAvcHJpdmF0ZS92YXIvd2lyZWxlc3MvTGlicmFyeS9QcmVmZXJlbmNlcy9jb20uYXBwbGUuY29tbWNlbnRlci5kZXZpY2Vfc3BlY2lmaWNfbm9iYWNrdXAucGxpc3Q7IHBsdXRpbCAta1Bvc3Rwb25lbWVudFRpY2tldCAtUGhvbmVOdW1iZXJOb3RpZmljYXRpb25VUkwgLXN0cmluZyBodHRwczovL2FsYmVydC5hcHBsZS5jb20vZGV2aWNlc2VydmljZXMvcGhvbmVIb21lIC9wcml2YXRlL3Zhci93aXJlbGVzcy9MaWJyYXJ5L1ByZWZlcmVuY2VzL2NvbS5hcHBsZS5jb21tY2VudGVyLmRldmljZV9zcGVjaWZpY19ub2JhY2t1cC5wbGlzdDsgcGx1dGlsIC1rUG9zdHBvbmVtZW50VGlja2V0IC1BY3RpdmF0aW9uVGlja2V0IC1zdHJpbmcgIk1JSUNvZ0lCQVRBTEJna3Foa2lHOXcwQkFRc3hhSjgvQkJ0TnhwMmZRQVRoVUg4QW4wc1VjYnB3UW5FTUc1ZEhlaDdyMHhFN0xyS0FybStmaDIwSE5aSmhCbGxJVVorWFBRd0FBQUFBN3U3dTd1N3U3dStmbHo0RUFBQUFBSitYUHdRQkFBQUFuNWRBQkFFQUFBQ2ZsMEVFQVFBQUFKK1hUQVFBQUFBQUJJSUJBSlhTVWZiSGNwdzIzK1c1ZzJEOWI0Y0gxck5Pd0ZMa0NFQkpkcUlxSG9sTi8yeE9ZdGlTcnpQV2h3NGJUN0dzNGF4ZGNNanAxcGdJY2pDLzJTU2hPc0hZNHUrSTYzYVhNK3hOUytPMWRPM1pjS3l4LzZySkM1cWdPaTAwT3h2b2FXd1pvQk1nVlU4b2E4dzJOSDJZYk1Wbk1zOFF4TGs1cnRZUGpNRWtrU2J2cVNnOWxHVnd5aGtCVHBHdi85VHBtemdwVXpkVGswa093YitHWTY0Skw5UTB3QlE4RHp3eEZRbVRYUnNlS09HTFhwV2hQK3hBeFpvSm9TRXRjZ1R2bVVtZDdHNnBqTm5peDVYeDJ5Z3RJd2pCQnZmMUhJOFZBUFdMcGhMWlZRamlGbEp4Y2ZxL3ZvQzRRNDNiQVRhbk1YdUt2QmI0c0FYYUxpUzRhVDBjLzNxamdnRWdNQXNHQ1NxR1NJYjNEUUVCQVFPQ0FROEFNSUlCQ2dLQ0FRRUFySkZQUmRuYy9FN1ZnYXRnL0FIYktuR0V1ZFIrdWc4V1pnaHhNT2xQYWQzZkw0MmhIQVhSZVZSY0JFNWxpUVhFeWFQMG9qeTNzM1FKaHVORVh3TE1ZT0xDS0pOQWo0U3JFNmRacUo5Q1FhbW91dkVuWmpkQy9nTEJHNWpTdUFJNHpGK2hqT2JlOE9ablY2WUdjb29FYlJrQTUxZGoreDV6bVkrdlQwdmEvdytFT2RBaVRXaTZ4aVdkVkZRVFhDcENUVXpBOXFjYXg1OFhVaTA0K2RjVlNFd1ZPOVUzWmV5b0lVckpEL0Ztb0RqalpPaWRDSERnc0NHbG5MZlFQL2dMS09NcE9menc0ZFdGSVcxSWlEdnM5VXkrVTNZaHl5RTRIUERWeDJvQWY4b2poQk16c2RxWEdWVjE0OEgwbVpTa1I0K3VsWlZsUjRFL214QjJaZFA3SFFJREFRQUJNSUlDb2dJQkFUQUxCZ2txaGtpRzl3MEJBUXN4YUo4L0JCdE54cDJmUUFUaFVIOEFuMHNVY2Jwd1FuRU1HNWRIZWg3cjB4RTdMcktBcm0rZmgyMEhOWkpoQmxsSVVaK1hQUXdBQUFBQTd1N3U3dTd1N3UrZmx6NEVBQUFBQUorWFB3UUJBQUFBbjVkQUJBRUFBQUNmbDBFRUFRQUFBSitYVEFRQUFBQUFCSUlCQUpYU1VmYkhjcHcyMytXNWcyRDliNGNIMXJOT3dGTGtDRUJKZHFJcUhvbE4vMnhPWXRpU3J6UFdodzRiVDdHczRheGRjTWpwMXBnSWNqQy8yU1NoT3NIWTR1K0k2M2FYTSt4TlMrTzFkTzNaY0t5eC82ckpDNXFnT2kwME94dm9hV3dab0JNZ1ZVOG9hOHcyTkgyWWJNVm5NczhReExrNXJ0WVBqTUVra1NidnFTZzlsR1Z3eWhrQlRwR3YvOVRwbXpncFV6ZFRrMGtPd2IrR1k2NEpMOVEwd0JROER6d3hGUW1UWFJzZUtPR0xYcFdoUCt4QXhab0pvU0V0Y2dUdm1VbWQ3RzZwak5uaXg1WHgyeWd0SXdqQkJ2ZjFISThWQVBXTHBoTFpWUWppRmxKeGNmcS92b0M0UTQzYkFUYW5NWHVLdkJiNHNBWGFMaVM0YVQwYy8zcWpnZ0VnTUFzR0NTcUdTSWIzRFFFQkFRT0NBUThBTUlJQkNnS0NBUUVBckpGUFJkbmMvRTdWZ2F0Zy9BSGJLbkdFdWRSK3VnOFdaZ2h4TU9sUGFkM2ZMNDJoSEFYUmVWUmNCRTVsaVFYRXlhUDBvankzczNRSmh1TkVYd0xNWU9MQ0tKTkFqNFNyRTZkWnFKOUNRYW1vdXZFblpqZEMvZ0xCRzVqU3VBSTR6Ritoak9iZThPWm5WNllHY29vRWJSa0E1MWRqK3g1em1ZK3ZUMHZhL3crRU9kQWlUV2k2eGlXZFZGUVRYQ3BDVFV6QTlxY2F4NThYVWkwNCtkY1ZTRXdWTzlVM1pleW9JVXJKRC9GbW9EampaT2lkQ0hEZ3NDR2xuTGZRUC9nTEtPTXBPZnp3NGRXRklXMUlpRHZzOVV5K1UzWWh5eUU0SFBEVngyb0FmOG9qaEJNenNkcVhHVlYxNDhIMG1aU2tSNCt1bFpWbFI0RS9teEIyWmRQN0hRSURBUUFCTUlJQ29nSUJBVEFMQmdrcWhraUc5dzBCQVFzeGFKOC9CQnROeHAyZlFBVGhVSDhBbjBzVWNicHdRbkVNRzVkSGVoN3IweEU3THJLQXJtK2ZoMjBITlpKaEJsbElVWitYUFF3QUFBQUE3dTd1N3U3dTd1K2ZsejRFQUFBQUFKK1hQd1FCQUFBQW41ZEFCQUVBQUFDZmwwRUVBUUFBQUorWFRBUUFBQUFBQklJQkFKWFNVZmJIY3B3MjMrVzVnMkQ5YjRjSDFyTk93RkxrQ0VCSmRxSXFIb2xOLzJ4T1l0aVNyelBXaHc0YlQ3R3M0YXhkY01qcDFwZ0ljakMvMlNTaE9zSFk0dStJNjNhWE0reE5TK08xZE8zWmNLeXgvNnJKQzVxZ09pMDBPeHZvYVd3Wm9CTWdWVThvYTh3Mk5IMlliTVZuTXM4UXhMazVydFlQak1Fa2tTYnZxU2c5bEdWd3loa0JUcEd2LzlUcG16Z3BVemRUazBrT3diK0dZNjRKTDlRMHdCUThEend4RlFtVFhSc2VLT0dMWHBXaFAreEF4Wm9Kb1NFdGNnVHZtVW1kN0c2cGpObml4NVh4MnlndEl3akJCdmYxSEk4VkFQV0xwaExaVlFqaUZsSnhjZnEvdm9DNFE0M2JBVGFuTVh1S3ZCYjRzQVhhTGlTNGFUMGMvM3FqZ2dFZ01Bc0dDU3FHU0liM0RRRUJBUU9DQVE4QU1JSUJDZ0tDQVFFQXJKRlBSZG5jL0U3VmdhdGcvQUhiS25HRXVkUit1ZzhXWmdoeE1PbFBhZDNmTDQyaEhBWFJlVlJjQkU1bGlRWEV5YVAwb2p5M3MzUUpodU5FWHdMTVlPTENLSk5BajRTckU2ZFpxSjlDUWFtb3V2RW5aamRDL2dMQkc1alN1QUk0ekYraGpPYmU4T1puVjZZR2Nvb0ViUmtBNTFkait4NXptWSt2VDB2YS93K0VPZEFpVFdpNnhpV2RWRlFUWENwQ1RVekE5cWNheDU4WFVpMDQrZGNWU0V3Vk85VTNaZXlvSVVySkQvRm1vRGpqWk9pZENIRGdzQ0dsbkxmUVAvZ0xLT01wT2Z6dzRkV0ZJVzFJaUR2czlVeStVM1loeXlFNEhQRFZ4Mm9BZjhvamhCTXpzZHFYR1ZWMTQ4SDBtWlNrUjQrdWxaVmxSNEUvbXhCMlpkUDdIUUlEQVFBQk1JSUNvZ0lCQVRBTEJna3Foa2lHOXcwQkFRc3hhSjgvQkJ0TnhwMmZRQVRoVUg4QW4wc1VjYnB3UW5FTUc1ZEhlaDdyMHhFN0xyS0FybStmaDIwSE5aSmhCbGxJVVorWFBRd0FBQUFBN3U3dTd1N3U3dStmbHo0RUFBQUFBSitYUHdRQkFBQUFuNWRBQkFFQUFBQ2ZsMEVFQVFBQUFKK1hUQVFBQUFBQUJJSUJBSlhTVWZiSGNwdzIzK1c1ZzJEOWI0Y0gxck5Pd0ZMa0NFQkpkcUlxSG9sTi8yeE9ZdGlTcnpQV2h3NGJUN0dzNGF4ZGNNanAxcGdJY2pDLzJTU2hPc0hZNHUrSTYzYVhNK3hOUytPMWRPM1pjS3l4LzZySkM1cWdPaTAwT3h2b2FXd1pvQk1nVlU4b2E4dzJOSDJZYk1Wbk1zOFF4TGs1cnRZUGpNRWtrU2J2cVNnOWxHVnd5aGtCVHBHdi85VHBtemdwVXpkVGswa093YitHWTY0Skw5UTB3QlE4RHp3eEZRbVRYUnNlS09HTFhwV2hQK3hBeFpvSm9TRXRjZ1R2bVVtZDdHNnBqTm5peDVYeDJ5Z3RJd2pCQnZmMUhJOFZBUFdMcGhMWlZRamlGbEp4Y2ZxL3ZvQzRRNDNiQVRhbk1YdUt2QmI0c0FYYUxpUzRhVDBjLzNxamdnRWdNQXNHQ1NxR1NJYjNEUUVCQVFPQ0FROEFNSUlCQ2dLQ0FRRUFySkZQUmRuYy9FN1ZnYXRnL0FIYktuR0V1ZFIrdWc4V1pnaHhNT2xQYWQzZkw0MmhIQVhSZVZSY0JFNWxpUVhFeWFQMG9qeTNzM1FKaHVORVh3TE1ZT0xDS0pOQWo0U3JFNmRacUo5Q1FhbW91dkVuWmpkQy9nTEJHNWpTdUFJNHpGK2hqT2JlOE9ablY2WUdjb29FYlJrQTUxZGoreDV6bVkrdlQwdmEvdytFT2RBaVRXaTZ4aVdkVkZRVFhDcENUVXpBOXFjYXg1OFhVaTA0K2RjVlNFd1ZPOVUzWmV5b0lVckpEL0Ztb0RqalpPaWRDSERnc0NHbG5MZlFQL2dMS09NcE9menc0ZFdGSVcxSWlEdnM5VXkrVTNZaHl5RTRIUERWeDJvQWY4b2poQk16c2RxWEdWVjE0OEgwbVpTa1I0K3VsWlZsUjRFL214QjJaZFA3SFFJREFRQUJNSUlDb2dJQkFUQUxCZ2txaGtpRzl3MEJBUXN4YUo4L0JCdE54cDJmUUFUaFVIOEFuMHNVY2Jwd1FuRU1HNWRIZWg3cjB4RTdMcktBcm0rZmgyMEhOWkpoQmxsSVVaK1hQUXdBQUFBQTd1N3U3dTd1N3UrZmx6NEVBQUFBQUorWFB3UUJBQUFBbjVkQUJBRUFBQUNmbDBFRUFRQUFBSitYVEFRQUFBQUFCSUlCQUpYU1VmYkhjcHcyMytXNWcyRDliNGNIMXJOT3dGTGtDRUJKZHFJcUhvbE4vMnhPWXRpU3J6UFdodzRiVDdHczRheGRjTWpwMXBnSWNqQy8yU1NoT3NIWTR1K0k2M2FYTSt4TlMrTzFkTzNaY0t5eC82ckpDNXFnT2kwME94dm9hV3dab0JNZ1ZVOG9hOHcyTkgyWWJNVm5NczhReExrNXJ0WVBqTUVra1NidnFTZzlsR1Z3eWhrQlRwR3YvOVRwbXpncFV6ZFRrMGtPd2IrR1k2NEpMOVEwd0JROER6d3hGUW1UWFJzZUtPR0xYcFdoUCt4QXhab0pvU0V0Y2dUdm1VbWQ3RzZwak5uaXg1WHgyeWd0SXdqQkJ2ZjFISThWQVBXTHBoTFpWUWppRmxKeGNmcS92b0M0UTQzYkFUYW5NWHVLdkJiNHNBWGFMaVM0YVQwYy8zcWpnZ0VnTUFzR0NTcUdTSWIzRFFFQkFRT0NBUThBTUlJQkNnS0NBUUVBckpGUFJkbmMvRTdWZ2F0Zy9BSGJLbkdFdWRSK3VnOFdaZ2h4TU9sUGFkM2ZMNDJoSEFYUmVWUmNCRTVsaVFYRXlhUDBvankzczNRSmh1TkVYd0xNWU9MQ0tKTkFqNFNyRTZkWnFKOUNRYW1vdXZFblpqZEMvZ0xCRzVqU3VBSTR6Ritoak9iZThPWm5WNllHY29vRWJSa0E1MWRqK3g1em1ZK3ZUMHZhL3crRU9kQWlUV2k2eGlXZFZGUVRYQ3BDVFV6QTlxY2F4NThYVWkwNCtkY1ZTRXdWTzlVM1pleW9JVXJKRC9GbW9EampaT2lkQ0hEZ3NDR2xuTGZRUC9nTEtPTXBPZnp3NGRXRklXMUlpRHZzOVV5K1UzWWh5eUU0SFBEVngyb0FmOG9qaEJNenNkcVhHVlYxNDhIMG1aU2tSNCt1bFpWbFI0RS9teEIyWmRQN0hRSURBUUFCTUlJQ29nSUJBVEFMQmdrcWhraUc5dzBCQVFzeGFKOC9CQnROeHAyZlFBVGhVSDhBbjBzVWNicHdRbkVNRzVkSGVoN3IweEU3THJLQXJtK2ZoMjBITlpKaEJsbElVWitYUFF3QUFBQUE3dTd1N3U3dTd1K2ZsejRFQUFBQUFKK1hQd1FCQUFBQW41ZEFCQUVBQUFDZmwwRUVBUUFBQUorWFRBUUFBQUFBQklJQkFKWFNVZmJIY3B3MjMrVzVnMkQ5YjRjSDFyTk93RkxrQ0VCSmRxSXFIb2xOLzJ4T1l0aVNyelBXaHc0YlQ3R3M0YXhkY01qcDFwZ0ljakMvMlNTaE9zSFk0dStJNjNhWE0reE5TK08xZE8zWmNLeXgvNnJKQzVxZ09pMDBPeHZvYVd3Wm9CTWdWVThvYTh3Mk5IMlliTVZuTXM4UXhMazVydFlQak1Fa2tTYnZxU2c5bEdWd3loa0JUcEd2LzlUcG16Z3BVemRUazBrT3diK0dZNjRKTDlRMHdCUThEend4RlFtVFhSc2VLT0dMWHBXaFAreEF4Wm9Kb1NFdGNnVHZtVW1kN0c2cGpObml4NVh4MnlndEl3akJCdmYxSEk4VkFQV0xwaExaVlFqaUZsSnhjZnEvdm9DNFE0M2JBVGFuTVh1S3ZCYjRzQVhhTGlTNGFUMGMvM3FqZ2dFZ01Bc0dDU3FHU0liM0RRRUJBUU9DQVE4QU1JSUJDZ0tDQVFFQXJKRlBSZG5jL0U3VmdhdGcvQUhiS25HRXVkUit1ZzhXWmdoeE1PbFBhZDNmTDQyaEhBWFJlVlJjQkU1bGlRWEV5YVAwb2p5M3MzUUpodU5FWHdMTVlPTENLSk5BajRTckU2ZFpxSjlDUWFtb3V2RW5aamRDL2dMQkc1alN1QUk0ekYraGpPYmU4T1puVjZZR2Nvb0ViUmtBNTFkait4NXptWSt2VDB2YS93K0VPZEFpVFdpNnhpV2RWRlFUWENwQ1RVekE5cWNheDU4WFVpMDQrZGNWU0V3Vk85VTNaZXlvSVVySkQvRm1vRGpqWk9pZENIRGdzQ0dsbkxmUVAvZ0xLT01wT2Z6dzRkV0ZJVzFJaUR2czlVeStVM1loeXlFNEhQRFZ4Mm9BZjhvamhCTXpzZHFYR1ZWMTQ4SDBtWlNrUjQrdWxaVmxSNEUvbXhCMlpkUDdIUUlEQVFBQiIgL3ByaXZhdGUvdmFyL3dpcmVsZXNzL0xpYnJhcnkvUHJlZmVyZW5jZXMvY29tLmFwcGxlLmNvbW1jZW50ZXIuZGV2aWNlX3NwZWNpZmljX25vYmFja3VwLnBsaXN0OyBjaGZsYWdzIHVjaGcgL3ByaXZhdGUvdmFyL3dpcmVsZXNzL0xpYnJhcnkvUHJlZmVyZW5jZXMvY29tLmFwcGxlLmNvbW1jZW50ZXIuZGV2aWNlX3NwZWNpZmljX25vYmFja3VwLnBsaXN0' &>./Untethered;
base64 -d -i ./Untethered &>./uu;
sshpass -p 'alpine' scp -p ./uu root@localhost:'/./bin/';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'chmod +x /./bin/uu; uu';
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'uicache --all && killall backboardd';
read -p 'CONCLUIDO';
		
}
Inicio
