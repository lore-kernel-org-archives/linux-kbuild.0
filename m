Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout0.freenet.de ([195.4.92.90]:49477 "EHLO mout0.freenet.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757195AbZLDTrM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2009 14:47:12 -0500
Message-ID: <4B19669D.7070907@freenet.de>
Date: Fri, 04 Dec 2009 20:44:29 +0100
From: Patrick Ringl <patrick_@freenet.de>
MIME-Version: 1.0
Subject: Re: 2.6.32: scripts/kconfig/streamline_config.pl :Malfunction
References: <4B1958FA.1050104@gmx.de> <1259953429.12870.179.camel@gandalf.stny.rr.com>
In-Reply-To: <1259953429.12870.179.camel@gandalf.stny.rr.com>
Content-Type: multipart/mixed;
 boundary="------------050703030105090007040002"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rostedt@goodmis.org
Cc: linux-kbuild@vger.kernel.org, stripconfig@goodmis.org, zippel@linux-m68k.org

This is a multi-part message in MIME format.
--------------050703030105090007040002
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Steven Rostedt wrote:
> On Fri, 2009-12-04 at 19:46 +0100, Patrick Ringl wrote:
>   
>> Hi,
>>
>> I have encountered the following malfunction of the recently added
>> streamline_config script. When running the following occurs:
>>
>> ack:~/linux-2.6.32# scripts/kconfig/streamline_config.pl >config_strip
>>     
>
> Note, I usually use "make localmodconfig", I know you know that, but in
> case anyone else is using this as a reference.
>
>
>   
>> using config: '.config'
>> Use of uninitialized value $ksource in concatenation (.) or string at
>> scripts/kconfig/streamline_config.pl line 117.
>> dock config not found!!
>> module pata_sis did not have configs CONFIG_PATA_SIS
>>
>> As a result: it couldnt map one currently loaded module properly and the
>> other module had been properly mapped, but somehow the
>> dependency/integrity check triggered it, since it wasnt enabled properly.
>>
>> I checked the output of the script and yea as I assumed CONFIG_ACPI_DOCK
>> is not set.
>>
>> 'dock'  refers to:
>>
>> ack:~/linux-2.6.32# modinfo dock
>> filename:       /lib/modules/2.6.26-2-amd64/kernel/drivers/acpi/dock.ko
>>
>> and the belonging Kconfig file says:
>>
>> config ACPI_DOCK
>>         bool "Dock"
>>         depends on EXPERIMENTAL
>>         help
>>           This driver supports ACPI-controlled docking stations and
>> removable
>>           drive bays such as the IBM Ultrabay and the Dell Module Bay.
>>
>> The same with 'pata_sis' (CONFIG_PATA_SIS is also not set) ..
>>
>> ack:~/linux-2.6.32# modinfo pata_sis
>> filename:       /lib/modules/2.6.26-2-amd64/kernel/drivers/ata/pata_sis.ko
>>
>> and the belonging Kconfig file:
>>
>> config SATA_SIS
>>         tristate "SiS 964/965/966/180 SATA support"
>>         depends on PCI
>>         select PATA_SIS
>>         help
>>           This option enables support for SiS Serial ATA on
>>           SiS 964/965/966/180 and Parallel ATA on SiS 180.
>>           The PATA support for SiS 180 requires additionally to
>>           enable the PATA_SIS driver in the config.
>>           If unsure, say N.
>>
>> In the end (if one ignored the two missing modules) a make
>> silentoldconfig didnt even work.
>>     
>
> How did it fail?
>
>   
Well it started the configuration itself all over thus the first 
question that waited was:

Kernel compression mode
 > 1. Gzip (KERNEL_GZIP) (NEW)
  2. Bzip2 (KERNEL_BZIP2) (NEW)
  3. LZMA (KERNEL_LZMA) (NEW)
choice[1-3?]: ^Cmake[1]: *** [silentoldconfig] Interrupt

>> What I did to reproduce this was using the standard kernel config of
>> debian lenny's amd64 branch.
>>     
>
> I don't know where to find that config, could you email it to me, or
> post a url of it. Also send me your lsmod as well.
>
>   
It is located in /boot/config-`uname -r` if you have Debian installed. 
Accessing it from the outside, you have to download the appropriate 
linux-image or rather the patch where Debian stores it's changed:

http://security.debian.org/debian-security/pool/updates/main/l/linux-2.6/linux-2.6_2.6.26-19lenny2.diff.gz

..But just for the record: I copied the kernelconfig to .config in the 
kernel source dir just to be sure ;-)
>> PS: I wrote such software myself, but I am going a totally different
>> approach. Your idea is not that bad actually (I am enabling kernel
>> config options and I am tracking all dependencies properly, while you
>> can just ignore them, since your script only disables stuff).
>>     
>
> Yeah, I toyed with doing the dependency game, but that got quite complex
> and fragile. I found the safest thing is to just turn off modules that
> you don't want. 99% of the time, that's good enough.
>
> -- Steve
>   
Heh, yea the dependency 'game' is quite wodge tho .. but there's other 
methods of fetching them than parsing the Kconfig files .. I didnt 
follow THIS approach after playing a lot with it ..

PS: lsmod is attached

--------------050703030105090007040002
Content-Type: text/plain;
 name="lsmod.extract"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lsmod.extract"

Module                  Size  Used by
ext2                   66576  1 
ipmi_devintf           13200  2 
ipmi_si                43628  1 
ipmi_msghandler        38520  2 ipmi_devintf,ipmi_si
snd_pcsp               14588  0 
snd_pcm                81800  1 snd_pcsp
snd_timer              25744  1 snd_pcm
snd                    63688  3 snd_pcsp,snd_pcm,snd_timer
soundcore              12064  1 snd
snd_page_alloc         13072  1 snd_pcm
rng_core                8968  0 
i2c_i801               13596  0 
i2c_core               27936  1 i2c_i801
serio_raw               9988  0 
psmouse                42268  0 
shpchp                 34208  0 
pci_hotplug            32056  1 shpchp
i5000_edac             12936  0 
edac_core              49560  3 i5000_edac
evdev                  14208  0 
ext3                  125072  1 
jbd                    51240  1 ext3
mbcache                12804  2 ext2,ext3
raid1                  24192  2 
md_mod                 80292  3 raid1
usbhid                 45792  0 
hid                    41792  1 usbhid
ff_memless              9224  1 usbhid
ahci                   33036  6 
ehci_hcd               36108  0 
uhci_hcd               25760  0 
bnx2                   63496  0 
firmware_class         12544  1 bnx2
thermal_sys            17728  0 
tg3                    97156  0 
sd_mod                 29376  8 
sata_nv                28680  0 
sata_sis               10500  0 
pata_sis                7936  1 sata_sis
sata_via               13060  0 
ata_piix               22660  0 
libata                165600  6 ahci,sata_nv,sata_sis,pata_sis,sata_via,ata_piix
dock                   14112  1 libata
piix                   12424  0 [permanent]
ide_core              128284  1 piix
3w_xxxx                28064  0 
scsi_mod              161016  3 sd_mod,libata,3w_xxxx

--------------050703030105090007040002--
