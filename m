Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 26.mail-out.ovh.net ([91.121.27.225]:33894 "HELO
	26.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753569Ab0C0QjO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Mar 2010 12:39:14 -0400
Message-ID: <4BAE34AE.3080507@example.com>
Date: Sat, 27 Mar 2010 17:39:10 +0100
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net> <20100318084012.0cca4b6a.rdunlap@xenotime.net> <4BAB9D7F.8020506@xenotime.net> <4BAB9F75.3000004@example.com> <4BABA027.6080900@xenotime.net> <4BABA206.9040205@example.com> <4BABA33D.1080903@xenotime.net> <4BABACE9.8000405@example.com> <4BABDDD3.4040803@xenotime.net> <4BABE07E.3060909@example.com> <4BACE4E3.80109@example.com> <4BAE342D.1040306@example.com>
In-Reply-To: <4BAE342D.1040306@example.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org

Piotr Hosowicz wrote:
> Piotr Hosowicz wrote:
>> Piotr Hosowicz wrote:
>>
>>>> It's working for me just be using
>>>>   yes '' | make oldconfig
>>>
>>> Ok, it seems to be working now, but I do not understand why my 
>>> version doesn't.
>>
>> I became so desperate with the fact that I do not understand why my 
>> version does not work as expected and with the fact that I am not a 
>> Python nor perl nor bash hacker I begun to write the randomizer in 
>> plain old php5-cli. Wow, .. how lame you'd say. ;-) It's possible that 
>> I will write all thing in it.
> 
> Ok. That's all, I give up. I do not understand how this fscking thing 
> works. I do make mrproper inside, then either gzip -cd /proc/config.gz > 
> ./.config followed by make oldconfig or make defconfig and then I 
> execute the following script:
> 
> #!/usr/bin/php
> <?
> 
> function yesno(){
>     $x = rand();
>     if ($x<getrandmax()/2){ return true; }else{ return false; }
> }
> 
> function enable_or_not($atoken){
>     if (yesno()){
>         switch ($atoken){
>             case "CONFIG_NET":
>                 $netenabled = true;
>                 print("CONFIG_NET=y\n");
>                 break;
>             case "CONFIG_INET":
>                 if (yesno() and $netenabled){
>                     print("CONFIG_INET=y\n");
>                 }else print("# CONFIG_INET is not set\n");
>                 break;
>             default:
>                 print($atoken."=y\n");
>         }
>     }else{
>         print("# ".$atoken." is not set\n");
>     }
> }
> 
> $stdin = fopen("php://stdin", "r");
> while ($inline = fgets($stdin)){
>     $m = preg_match("/^(CONFIG_\w+)=([y|n])$/", $inline, $matches);
>     if ($m){
>         $option = $matches[1];
>     }else{
>         $m = preg_match("/^# (CONFIG_\w+) is not set$/", $inline, 
> $matches);
>         if ($m) { $option = $matches[1]; }else{ $option = false; };
>     };
>     switch ($option){
>         case "CONFIG_MODULES":
>             print "CONFIG_MODULES=y";
>             break;
>         case "CONFIG_NET":
>             enable_or_not("CONFIG_NET");
>             break;
>         case "CONFIG_INET":
>             enable_or_not("CONFIG_INET");
>             break;
>         case "CONFIG_SMP":
>             enable_or_not("CONFIG_SMP");
>             break;
>         case "CONFIG_SYSFS":
>             enable_or_not("CONFIG_SYSFS");
>             break;
>         case "CONFIG_PROC_FS":
>             enable_or_not("CONFIG_PROC_FS");
>             break;
>         case "CONFIG_PM":
>             enable_or_not("CONFIG_PM");
>             break;
>         case "CONFIG_PCI":
>             enable_or_not("CONFIG_PCI");
>         case "CONFIG_BLOCK":
>             enable_or_not("CONFIG_BLOCK");
>         case "CONFIG_HOTPLUG":
>             enable_or_not("CONFIG_HOTPLUG");

Sorry, 3 * break; should go where appropriate, I noticed it just now.

Regards,

Piotr Hosowicz



-- 
Demokracja to kult szakali wyznawany przez os³y (Henry Louis Mencken)
NP: Lenny Kravitz - Let love rule
NB: 2.6.34-rc2-git3
