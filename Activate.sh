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
    else
		 rm ~/.ssh/known_hosts&&iproxy 22 44 &>>/dev/nul&
		  echo '¡DISPOSITIVO DETECTADO CON ÉXITO!';
		  sleep 3; clear;
		  echo 'INTENTANDO MOSTRAR DATOS DEL iDEVICE';
		  sleep 2; echo ''; echo '';
		  echo 'Estado de Activación:  '$AS'';
		  echo 'Numero de Serie:       '$SN'';
		  echo 'IMEI:                  '$IM'';
		  echo 'UniqueDeviceID:        '$UD''; echo '';
		  read -p 'PRECIONA ENTER PARA INICIAR EL PROCESO';
   fi      
}
echo "VERIFICANDO INSTALACIÓN DE DEPENDENCIAS";  sleep 3; clear;
Check=$(find /usr/bin -iname "LibimobiledeviceEXE");
if test -z "$Check"; 
  then
    echo 'DESCARGANDO DEPENDENCIAS NECESARIAS'; sleep 2; echo '==============================================';
    cd /usr/bin/ && git clone https://github.com/Brayan-Villa/LibimobiledeviceEXE; 
    cd /usr/bin/LibimobiledeviceEXE/ && mv ./* ../;
    echo '=============================================='; echo '';
    echo 'COMPLETADO!'; sleep 3; point1;
  else
    point1;
fi
function Inicio()
{	  
rm tokenfinal tokenpre activ &>>/dev/nul&
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'mount -o rw,union,update /';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'snappy -f / -r `snappy -f / -l | sed -n 2p` -t orig-fs';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /usr/libexec/substrate /usr/libexec/substrated /usr/bin/cycc /usr/bin/cynject /./Library/Frameworks/* /usr/lib/cycript0.9 /usr/lib/libsubstrate.dylib /Library/MobileSubstrate /usr/include/substrate.h /usr/lib/substrate';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'cp -rp /./System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/FactoryActivation.pem /./System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /private/var/mobile/Library/Preferences/*purplebuddy*';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'find /./private/var/containers/Data/System -iname "internal" >>/guid';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && rm -rf $GUI/../activation_records';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && rm -rf $GUI && rm /guid';
		sshpass -p 'alpine' scp -p ./uikit root@localhost:'/./';
		sshpass -p 'alpine' scp -p ./lzma root@localhost:'/./usr/bin/';
		sshpass -p 'alpine' scp -p ./plutil root@localhost:'/./usr/bin/';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'tar -xvf /./uikit -C /./';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chmod -R 755 /usr/bin';
		sshpass -p 'alpine' scp -p ./boot root@localhost:'/./boot.tar.lzma';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'lzma -d -v /./boot.tar.lzma'; 
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'tar -xvf /./boot.tar -C /./';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm /./boot.tar';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chmod 755 /usr/libexec/substrate';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost '/usr/libexec/substrate';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chmod 755 /usr/libexec/substrated';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost '/usr/libexec/substrated';
		sshpass -p 'alpine' scp -p ./untethered root@localhost:'/./Library/MobileSubstrate/DynamicLibraries/untethered.dylib';
		sshpass -p 'alpine' scp -p ./untetheredplist root@localhost:'/./Library/MobileSubstrate/DynamicLibraries/untethered.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chmod 00755 /./Library/MobileSubstrate/DynamicLibraries/untethered.dylib';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'cd /System/Library && launchctl unload LaunchDaemons/com.apple.mobile.lockdown.plist && launchctl unload LaunchDaemons/com.apple.mobileactivationd.plist && launchctl load LaunchDaemons/com.apple.mobile.lockdown.plist && launchctl load LaunchDaemons/com.apple.mobileactivationd.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'uicache --respring && killall SpringBoard mobileactivationd';
		idevicepair pair;
		sleep 5;
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'find /./private/var/containers/Data/System -iname "internal" >>/guid'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && mv /./flag $GUI/'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && mv /./unflag $GUI/'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && cd $GUI/ && chmod 00755 unflag && ./unflag'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && cd $GUI/ && chmod 00755 flag && ./flag'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && cd $GUI/../ && mkdir activation_records'
		ActivationState=$(ideviceinfo | grep ActivationState: | awk '{print $NF}');
		DeviceName=$(ideviceinfo | grep DeviceName | awk '{print $NF}');
		UniqueDeviceID=$(ideviceinfo | grep UniqueDeviceID | awk '{print $NF}');
		SerialNumber=$(ideviceinfo | grep -w SerialNumber | awk '{print $NF}');
		ProductType=$(ideviceinfo | grep ProductType | awk '{print $NF}');
		ProductVersion=$(ideviceinfo | grep ProductVersion | awk '{print $NF}');
		imei=$(ideviceinfo | grep InternationalMobileEquipmentIdentity | awk '{print $NF}');
		meid=$(ideviceinfo | grep MobileEquipmentIdentifier | awk '{print $NF}');
		me=$(if test -z "$meid"; then echo '	"MobileEquipmentIdentifier" = "'$meid'";'; else sleep 1;fi);
echo '
{
	"InternationalMobileEquipmentIdentity" = "'$imei'";'$me'
	"SerialNumber" = "'$SerialNumber'";
	"InternationalMobileSubscriberIdentity" = "";
	"ProductType" = "'$ProductType'";
	"UniqueDeviceID" = "'$UniqueDeviceID'";
	"ActivationRandomness" = "1A0CC786-CE38-4D31-BDFD-1FB4483AE4F8";
	"ActivityURL" = "https://albert.apple.com/deviceservices/activity";
	"IntegratedCircuitCardIdentity" = "";
	"CertificateURL" = "https://albert.apple.com/deviceservices/certifyMe";
	"PhoneNumberNotificationURL" = "https://albert.apple.com/deviceservices/phoneHome";
	"WildcardTicket" = "MIICogIBATALBgkqhkiG9w0BAQsxaJ8/BCIpOuefQAThUH8An0sU8u7ynkFtjU5iK7LCVPXvf1IsCsqfh20HNWFRCSOYRJ+XPQwAAAAA7u7u7u7u7u+flz4EAAAAAJ+XPwQBAAAAn5dABAEAAACfl0EEAQAAAJ+XTAQAAAAABIIBADqStNCOV64BLCKVls72U5Bwh8qTJHwaQtkPjUj/wh3RbtC45BoDNebydW4RmSefowABaXRYFfGFhuyXHxfQyxre5gDMh6CftLMQdSuE0tLHw+Kki0me5xFxBFHtwQdt/fgd1VRnNUI8zokLGfjm4N8V3A6oMvnDwZLlZMci7jPhDOk7OW2P6XD0RCirK6kaYMQEgJdPr5lCUJRv2ywc0URrGMWNvU759pObUPjHgIvqNXY+7MeLi3vKqRpft7beOwDohoo1e1+GVQVGYP7qYYmNBMJlLFO75h8bDaSMc3a5MfDgwDekbZn7Q0ZiQ2TPHB/FQSsbfphSRWfnmr9b3/mjggEgMAsGCSqGSIb3DQEBAQOCAQ8AMIIBCgKCAQEArJFPRdnc/E7Vgatg/AHbKnGEudR+ug8WZghxMOlPad3fL42hHAXReVRcBE5liQXEyaP0ojy3s3QJhuNEXwLMYOLCKJNAj4SrE6dZqJ9CQamouvEnZjdC/gLBG5jSuAI4zF+hjObe8OZnV6YGcooEbRkA51dj+x5zmY+vT0va/w+EOdAiTWi6xiWdVFQTXCpCTUzA9qcax58XUi04+dcVSEwVO9U3ZeyoIUrJD/FmoDjjZOidCHDgsCGlnLfQP/gLKOMpOfzw4dWFIW1IiDvs9Uy+U3YhyyE4HPDVx2oAf8ojhBMzsdqXGVV148H0mZSkR4+ulZVlR4E/mxB2ZdP7HQIDAQAB";
}' >>./tokenpre
		sleep 4
		base64 ./tokenpre &>>./tokenfinal&
		sleep 3
		token=$(cat ./tokenfinal)
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>AccountToken</key>
	<data>
	'$token'
	</data>
	<key>AccountTokenCertificate</key>
	<data>
	LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURaekNDQWsrZ0F3SUJBZ0lCQWpB
	TkJna3Foa2lHOXcwQkFRVUZBREI1TVFzd0NRWURWUVFHRXdKVlV6RVQKTUJFR0ExVUVD
	aE1LUVhCd2JHVWdTVzVqTGpFbU1DUUdBMVVFQ3hNZFFYQndiR1VnUTJWeWRHbG1hV05o
	ZEdsdgpiaUJCZFhSb2IzSnBkSGt4TFRBckJnTlZCQU1USkVGd2NHeGxJR2xRYUc5dVpT
	QkRaWEowYVdacFkyRjBhVzl1CklFRjFkR2h2Y21sMGVUQWVGdzB3TnpBME1UWXlNalUx
	TURKYUZ3MHhOREEwTVRZeU1qVTFNREphTUZzeEN6QUoKQmdOVkJBWVRBbFZUTVJNd0VR
	WURWUVFLRXdwQmNIQnNaU0JKYm1NdU1SVXdFd1lEVlFRTEV3eEJjSEJzWlNCcApVR2h2
	Ym1VeElEQWVCZ05WQkFNVEYwRndjR3hsSUdsUWFHOXVaU0JCWTNScGRtRjBhVzl1TUlH
	Zk1BMEdDU3FHClNJYjNEUUVCQVFVQUE0R05BRENCaVFLQmdRREZBWHpSSW1Bcm1vaUhm
	YlMyb1BjcUFmYkV2MGQxams3R2JuWDcKKzRZVWx5SWZwcnpCVmRsbXoySkhZdjErMDRJ
	ekp0TDdjTDk3VUk3ZmswaTBPTVkwYWw4YStKUFFhNFVnNjExVApicUV0K25qQW1Ba2dl
	M0hYV0RCZEFYRDlNaGtDN1QvOW83N3pPUTFvbGk0Y1VkemxuWVdmem1XMFBkdU94dXZl
	CkFlWVk0d0lEQVFBQm80R2JNSUdZTUE0R0ExVWREd0VCL3dRRUF3SUhnREFNQmdOVkhS
	TUJBZjhFQWpBQU1CMEcKQTFVZERnUVdCQlNob05MK3Q3UnovcHNVYXEvTlBYTlBIKy9X
	bERBZkJnTlZIU01FR0RBV2dCVG5OQ291SXQ0NQpZR3UwbE01M2cyRXZNYUI4TlRBNEJn
	TlZIUjhFTVRBdk1DMmdLNkFwaGlkb2RIUndPaTh2ZDNkM0xtRndjR3hsCkxtTnZiUzlo
	Y0hCc1pXTmhMMmx3YUc5dVpTNWpjbXd3RFFZSktvWklodmNOQVFFRkJRQURnZ0VCQUY5
	cW1yVU4KZEErRlJPWUdQN3BXY1lUQUsrcEx5T2Y5ek9hRTdhZVZJODg1VjhZL0JLSGhs
	d0FvK3pFa2lPVTNGYkVQQ1M5Vgp0UzE4WkJjd0QvK2Q1WlFUTUZrbmhjVUp3ZFBxcWpu
	bTlMcVRmSC94NHB3OE9OSFJEenhIZHA5NmdPVjNBNCs4CmFia29BU2ZjWXF2SVJ5cFhu
	YnVyM2JSUmhUekFzNFZJTFM2alR5Rll5bVplU2V3dEJ1Ym1taWdvMWtDUWlaR2MKNzZj
	NWZlREF5SGIyYnpFcXR2eDNXcHJsanRTNDZRVDVDUjZZZWxpblpuaW8zMmpBelJZVHh0
	UzZyM0pzdlpEaQpKMDcrRUhjbWZHZHB4d2dPKzdidFcxcEZhcjBaakY5L2pZS0tuT1lO
	eXZDcndzemhhZmJTWXd6QUc1RUpvWEZCCjRkK3BpV0hVRGNQeHRjYz0KLS0tLS1FTkQg
	Q0VSVElGSUNBVEUtLS0tLQo=
	</data>
	<key>AccountTokenSignature</key>
	<data>
	raD2OkSpiKa05ol4Af0pmP8R/g6ISCErqNxRJyi/yxShUZ7e0MFRFe7lsILfRxmJD+8E
	A2ztZSQ+euGLMD7sjyzwlJsY1C6yHAyh+mq1cmLrYas+e/muxO5DyoAGqsb5jTLeM0jS
	emD9aTA4r8aUbPvScjMIYHqHVMzLyZflZZ4=
	</data>
	<key>DeviceCertificate</key>
	<data>
	LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM4akNDQWx1Z0F3SUJBZ0lKVTlE
	eVdEQUlrV0pjTUEwR0NTcUdTSWIzRFFFQkJRVUFNRm94Q3pBSkJnTlYKQkFZVEFsVlRN
	Uk13RVFZRFZRUUtFd3BCY0hCc1pTQkpibU11TVJVd0V3WURWUVFMRXd4QmNIQnNaU0Jw
	VUdodgpibVV4SHpBZEJnTlZCQU1URmtGd2NHeGxJR2xRYUc5dVpTQkVaWFpwWTJVZ1Ew
	RXdIaGNOTWpBd016STVNRGd6Ck9UVXpXaGNOTWpNd016STVNRGd6T1RVeldqQ0JnekV0
	TUNzR0ExVUVBeFlrUVRnelJFUkROakV0TUVFME5DMDAKUkRNeExVRXlSREl0TmtaRE5V
	SXlPVGhCUWtRMU1Rc3dDUVlEVlFRR0V3SlZVekVMTUFrR0ExVUVDQk1DUTBFeApFakFR
	QmdOVkJBY1RDVU4xY0dWeWRHbHViekVUTUJFR0ExVUVDaE1LUVhCd2JHVWdTVzVqTGpF
	UE1BMEdBMVVFCkN4TUdhVkJvYjI1bE1JR2ZNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0R05B
	RENCaVFLQmdRRG5sbS96RitETUhQMUQKOEt3VlFKYkVYajhTU0NjWnhSREsrU1NSdytl
	UnVramd5VGZBd3pqa0poVjJ0YVNWbWdnVDVKWUVBWUdlaXFCcQovajdTV1lWL0ZVK3oz
	c3lEQTRhMlBMRjdSNFZyVXluOW9xRzg5ajdRS2pON2hpZnp3Y1lFWmhlWmV3bzZoTkVO
	ClRsVFlFK2RGZDVhOXgwbHhSQjFELzVXcnJtSGxaUUlEQVFBQm80R1ZNSUdTTUI4R0Ex
	VWRJd1FZTUJhQUZMTCsKSVNORWhwVnFlZFdCSm81ekVOaW5USTUwTUIwR0ExVWREZ1FX
	QkJTSE42R2FNQlIxeGVPYmc4U2pVNWU0T3FRYwpUakFNQmdOVkhSTUJBZjhFQWpBQU1B
	NEdBMVVkRHdFQi93UUVBd0lGb0RBZ0JnTlZIU1VCQWY4RUZqQVVCZ2dyCkJnRUZCUWNE
	QVFZSUt3WUJCUVVIQXdJd0VBWUtLb1pJaHZkalpBWUtBZ1FDQlFBd0RRWUpLb1pJaHZj
	TkFRRUYKQlFBRGdZRUE1QlI3aktnNFlBUm1GM3ZXVWR1NWRnTnhjd1RoU0hiYU9PNmdQ
	M25IeWhNU1B1NnIwYmxDcE0vdwpVZkNZZWZVV1Q0WFBXVXZwU2tsaW5QR1JiN01nSG5E
	WDJRVEM3REFYTTJiOHJiK2E5bTRYQkFFcmZyUVRlbkJJClFWdjI0ajRQSHdpNUd6L0I5
	QWJ6ZXEyTEw1blMvdmNKMDJ6VzJoUHhqb1lNQjVaU2UrYz0KLS0tLS1FTkQgQ0VSVElG
	SUNBVEUtLS0tLQo=
	</data>
	<key>DeviceConfigurationFlags</key>
	<string>0</string>
	<key>FairPlayKeyData</key>
	<data>
	LS0tLS1CRUdJTiBDT05UQUlORVItLS0tLQpBQUVBQVRRVHdOS1loa1B3UDVDVlF5Ly9k
	YWpqMUxlMm81Q2MzV0hUSlhKdmZNVWR0bG5yOGl3T29KMVFKZkpHClpJaWF5L2dib0t2
	Yzc4dzZTMTh6Q0FnMVpqdENCelhubGtmNjN0Z0wwOTF3bzA4SjFYTzY1Z0VwbDNURUxq
	V2EKcldMSnNCbm96ZHc0RGtHZHgybzhIRi95UTFvUTljVkxRZC8xL1I2d29oUVdNRFVq
	S3IrWnRMUUY5Z2lsUEdzdAptQ0NGTW5nRytWZEIzdGNsVVNWUGFoSmpDZmdqSjU1eVZO
	ZkRJVVdRSXBwVUR3OG13U1kzWlYxb1ZKY3pGWEVYCnJNUnN6LzBwMVVGRWpmRDdCci9w
	QkdGUUxIRVV3cjVxRmw0anM3WUxxUjQ0WVdFSmtoalo3UUF0NXAxWWVsWDIKVS95SERY
	ZWNLUiswdDk3UUFSS1JGTEpRbGZNNnREVW9mUXlhL0o5Y0tqYTNyYncyS3VERVpjS1J6
	cDlHR0wyZgpqWGFjTEt6MDRIdGpmb3VBRWE5OW9uZTdrUTJ4YTFQcGxzTWdMY2VwMVhW
	L0tHaExvL2I0MWNrYm8wTXhkSzVtCm9sOXpBdHRyb2pwRkJUZXFMeGFxbGRUQVVxUjJM
	dVhBRzUrUTIzYXl5MzR0MEJmWS9NRFc4L3BvamlqZmhFRGMKekR4NWtlVmkxZ0NHSHlV
	b1BMa1FvYXh2aHBLdFFJOG5jMGYya1Q5VGtiaENkeTJ2N2dEMXV2U1o3SEw2aEZBVwph
	cFB4UWxKZjlDclh1SHZhZUMxTGZmNlpXQitlSmxVcG1DTzFNV1lnL0xlMGQrMTRpSnU0
	b3pmb3pMWlB1WmJTCkZISkM0c1Vrbk50Vmd4OVFIS2dTdWkzNWh1UFlhSFM3OHV1NExy
	ZVZFZHFjdE42R0I2UW01a0k3UGdZMGlNdUgKcW9HUGhNL3F0Vms2NS83TVNMQTkvck84
	WnRKa2xlWkpiQnNUYmJzS2dFd1NKdU5EaGt5TVVzdWlReGllOEJMMwo0N242UnkvcWJH
	eFJUQ05oY3VIT05nRVlxekUwaVZTQ2FXb0JzN0Q1Tm11Q2ZEVFdMNjNhQzQ4a2FLeFNY
	VXJIClhHd3ZqTC9DOFBENkdDckQzU2dpMDJjMU9CNDhCUHZwWmRKY0pQbXYwSWNRUURU
	OUZ5UzYvSDMzQzlsWm42Y24KY1h1N0tOcXc2ZGRwNFErN0ZnQ0RWY0xucmk5TE4rczVM
	TGszSDJ1d3F6dGw0dkxTV3FkZG9jZkY4SDI1UTc5ZAp2VDNtRmRtOWJwS3B3YUZ3UGZn
	ZCtabVJNWTViQmI2SXp2OTQ5Ymx6enRvd0pRam5DeHhFMVVWU0FoQlhSeG80Ckg3UjNu
	bjU5RjJwTHQ3N0F3d2dheEpJUVNVa3preUg0d05FMDNyMFFma1JKaHBrTUlxQkwzeTBK
	eU5pK0p2TkIKTFhiSlRLWHN0QnZ1RmxnNFhHL3puMityMHJKUmZINHFnT25ib0FXT0lZ
	NDhPNEZ6NjdpNHFHdjRCV1U2SktkSApDRWxQMEJwMklZM0MzVGFzMkc5UmxTNnYwY2Q5
	V3pFRkJ1bFY5WEt6TXdpMjZNOGMvU0xwcTl3aEIwZXdwVmxTClhXS241V09oM2gySGhQ
	SUJpTVBvaE01blBpUUhUaDJyMGFyaXczYXNkMUVoaDA3RTdxanBxUmFuQmhuMnIwUTAK
	UzVFeHJBVldjYnYzVnVYWHVyL2RjWHByNjI3dHNUbi9VanlFZEd6a2NyeFllZUZPTW04
	NTdwSXlhRkc3SG50MQpJdUtmTnM0NlFOQURidHR1QzFGRm5RKzY2UzRWejQ0dTJ3OENE
	b2RoSGF3YWN2VmlTQktTNWVvbER5NWhjb1BECnBoUk1qem5jc2UzdVh6djgwNDNpc2E2
	amZLdEEyNUx2L1lYSzlKMFdkbmZvNUcyK0NDWk5BYUxzUFJHY0g2U1IKYk02Wk5YNlNz
	ZkZJckU3SGMwMDdIcUJxTzJKUXZhbjdpRWJ0N3ordGtHbWJmaUhPCi0tLS0tRU5EIENP
	TlRBSU5FUi0tLS0tCg==
	</data>
	<key>unbrick</key>
	<true/>
</dict>
</plist>' >>./activ
		sleep 3
		sshpass -p 'alpine' scp -p ./activ root@localhost:/./
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) &&  chflags nouchg $GUI/../activation_records/activation_record.plist'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) &&  mv /./activ $GUI/../activation_records/activation_record.plist'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && chmod 00666 $GUI/../activation_records/activation_record.plist'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && chown mobile $GUI/../activation_records/activation_record.plist'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && plutil -binary $GUI/../activation_records/activation_record.plist'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'GUI=$(cat /guid) && chflags uchg $GUI/../activation_records/activation_record.plist'
		sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost 'rm /guid'
		sleep 5;
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /./Library/MobileSubstrate/DynamicLibraries/*';
		sshpass -p 'alpine' scp -p ./iuntethered root@localhost:'/./Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib';
		sshpass -p 'alpine' scp -p ./iuntetheredplist root@localhost:'/./Library/MobileSubstrate/DynamicLibraries/iuntethered.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chmod 00755 /./Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'cd /System/Library && launchctl unload LaunchDaemons*';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chflags nouchg /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'plutil -kPostponementTicket -remove /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'plutil -dict -kPostponementTicket /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'plutil -kPostponementTicket -ActivationState -string Activated /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'plutil -kPostponementTicket -ActivityURL -string https://albert.apple.com/deviceservices/activity /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'plutil -kPostponementTicket -PhoneNumberNotificationURL -string https://albert.apple.com/deviceservices/phoneHome /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'plutil -kPostponementTicket -ActivationTicket -string "MIICogIBATALBgkqhkiG9w0BAQsxaJ8/BCIpOuefQAThUH8An0sU8u7ynkFtjU5iK7LCVPXvf1IsCsqfh20HNWFRCSOYRJ+XPQwAAAAA7u7u7u7u7u+flz4EAAAAAJ+XPwQBAAAAn5dABAEAAACfl0EEAQAAAJ+XTAQAAAAABIIBADqStNCOV64BLCKVls72U5Bwh8qTJHwaQtkPjUj/wh3RbtC45BoDNebydW4RmSefowABaXRYFfGFhuyXHxfQyxre5gDMh6CftLMQdSuE0tLHw+Kki0me5xFxBFHtwQdt/fgd1VRnNUI8zokLGfjm4N8V3A6oMvnDwZLlZMci7jPhDOk7OW2P6XD0RCirK6kaYMQEgJdPr5lCUJRv2ywc0URrGMWNvU759pObUPjHgIvqNXY+7MeLi3vKqRpft7beOwDohoo1e1+GVQVGYP7qYYmNBMJlLFO75h8bDaSMc3a5MfDgwDekbZn7Q0ZiQ2TPHB/FQSsbfphSRWfnmr9b3/mjggEgMAsGCSqGSIb3DQEBAQOCAQ8AMIIBCgKCAQEArJFPRdnc/E7Vgatg/AHbKnGEudR+ug8WZghxMOlPad3fL42hHAXReVRcBE5liQXEyaP0ojy3s3QJhuNEXwLMYOLCKJNAj4SrE6dZqJ9CQamouvEnZjdC/gLBG5jSuAI4zF+hjObe8OZnV6YGcooEbRkA51dj+x5zmY+vT0va/w+EOdAiTWi6xiWdVFQTXCpCTUzA9qcax58XUi04+dcVSEwVO9U3ZeyoIUrJD/FmoDjjZOidCHDgsCGlnLfQP/gLKOMpOfzw4dWFIW1IiDvs9Uy+U3YhyyE4HPDVx2oAf8ojhBMzsdqXGVV148H0mZSkR4+ulZVlR4E/mxB2ZdP7HQIDAQAB" /private/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'cd /System/Library && launchctl load LaunchDaemons*';
		sshpass -p 'alpine' scp -p ./purplebuddy root@localhost:'/./private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chown mobile /./private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chmod 00600 /./private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'uicache --all';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'chflags uchg /./private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'find /./private/var/containers/Data/System -iname "data_ark.plist" >>/guid';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && plutil -key ActivationState -remove $GUI';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && plutil -"-ActivationState" -remove $GUI';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && plutil -"-UCRTOOBForbidden" -remove $GUI';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && plutil -ActivationState -string Activated $GUI';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && plutil -binary $GUI';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'GUI=$(cat /guid) && chflags uchg $GUI';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /usr/libexec/substrate';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm /usr/libexec/substrated';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm /usr/bin/cycc';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm /usr/bin/cynject';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /./Library/Frameworks/*';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /usr/lib/cycript0.9';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm /usr/lib/libsubstrate.dylib';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /./Library/MobileSubstrate';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm /usr/include/substrate.h';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /usr/lib/substrate';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm /guid';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'rm -rf /./private/var/mobile/Library/Logs/mobileactivationd';
		sshpass -p 'alpine' ssh -o StricthostKeyChecking=no root@localhost 'uicache --all && killall backboardd';
		read -p 'CONCLUIDO';
		
		
}
Inicio
