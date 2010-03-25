Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 27.mail-out.ovh.net ([91.121.30.210]:51389 "HELO
	27.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754477Ab0CYLiK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Mar 2010 07:38:10 -0400
Message-ID: <4BAB4B1E.3080703@example.com>
Date: Thu, 25 Mar 2010 12:38:06 +0100
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net> <20100318084012.0cca4b6a.rdunlap@xenotime.net> <4BA6E49F.3070008@example.com> <4BA6E87D.2030405@xenotime.net> <4BA765B8.5010808@example.com> <4BA76852.8000506@example.com> <4BA966FF.2080903@example.com> <4BAA8769.3080907@xenotime.net>
In-Reply-To: <4BAA8769.3080907@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:
> On 03/23/10 18:12, Piotr Hosowicz wrote:
>> Piotr Hosowicz wrote:
>>
>>> But it seems that it works, but I do not understand why. Needs rewrite,
>>> better config template line parsing.
>> I made it with Python, the scripts follow:
> 
> Thanks for sharing them.

Sorry to say but they are crap, the python script corrupts the config 
file, I do not know why. I'll try to solve it and post again.

>> --- main try-build.sh
>>
>> #!/bin/bash
>>
>> RCPT=phz@localhost
>>
>> function tidy(){
>>   rm ../results/.config 2>/dev/null
>>   rm ../results/build.log 2>/dev/null
>>   rm ../BUILDING-NOW 2>/dev/null
>> }
>>
>> cd ~/kernel/linux
>> if test -f ../BUILDING-NOW ; then
>>   exit 0
>> else
>>   touch ../BUILDING-NOW
>>   make mrproper
>>   cat ../config.all | ../randomize-conf.py > ./.config
>>   make prepare
>>   cp .config ../results/
>>   make -j 10 2>&1 > ../results/build.log
> 
> 'make' with no target also builds modules, so the 'make modules'
> below isn't needed (it's extra work).

Yes, but I wanted to have it separate to know when the build fails.

Regards,

Piotr Hosowicz

-- 
Miss World 2006: Jestem szczê¶liwa, ¿e mogê wspaniale uczestniczyæ w
prze¿yciu najpiêkniejszych kobiet tutaj w Warszawie, gdzie Jan Pawe³ II,
papie¿, w Polsce, sk±d pochodzi. Spotka³am siê z Ko¶cio³em Mariackim
w Krakowie, który ciep³o ludzi i wielka przyja¼ñ. Po³owa mojego serca
zostanie w Polsce, a druga po³owa pojedzie ze mn± do mojego kraju.
NP: Mark Knopfler - Piper To The End
NB: 2.6.34-rc2-nx-20100324-next-20100324+
