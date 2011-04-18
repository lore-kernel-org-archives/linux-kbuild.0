Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41213 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750991Ab1DRLNN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 07:13:13 -0400
Message-ID: <4DAC1CC8.6080406@suse.cz>
Date: Mon, 18 Apr 2011 13:13:12 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>	<20110417222945.GC14561@stro.at> <BANLkTinP5sUv2-_Y+UZMvgPJFHsdypcLHA@mail.gmail.com>
In-Reply-To: <BANLkTinP5sUv2-_Y+UZMvgPJFHsdypcLHA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: maximilian attems <max@stro.at>, Robert Gordon <robert@greenroomsoftware.com>, linux-kbuild@vger.kernel.org

On 18.4.2011 00:34, Robert Nelson wrote:
> On Sun, Apr 17, 2011 at 5:29 PM, maximilian attems<max@stro.at>  wrote:
>> On Fri, 15 Apr 2011, Robert Gordon wrote:
>>
>>> This patch was prepared using git format-patch and git send-email.  Details follow.
>>> Regards,
>>> Robert Gordon
>>
>> thanks so the patch was now applyable and so testable. (:
>>
>>> scripts/package/builddeb script was setting the host machine $arch in the KERNEL/debian/control prior to an invocation of dpkg-gencontrol.  The patch modifies the script to guarantee the correct debian arch for the target is written to the control file instead.  The issue originally arose in the 2.6.38 series.
>>
>> hmm don't be shy to use line-breaks in the desc for next times..
>>
>>>   Signed-off-by: Robert Gordon<robert@greenroomsoftware.com>
>>
>> rudimentary testing showed, that `make deb-pkg` works,
>> but `make ARCH=i386 deb-pkg` on an amd64 Debian box seems borked:
>> + dpkg-gencontrol -isp -DArchitecture=i386 -plinux-headers-2.6.39-rc3+
>> -P/media/data/mattems/src/linux-2.6/debian/hdrtmp
>> dpkg-gencontrol: error: current host architecture 'amd64' does not appear in package's architecture list (i386)
>
> Weird, as without the patch we get the same error just with (i386)
> swapped for (armel)..
>
> make ARCH=armel deb-pkg (on amd64)
>
> Note, with cross building we always have CROSS_COMPILE=something too..

x86_64 and i386 are just two flavors of x86 in the kernel build and two 
switches in gcc, so unlike genuine cross builds, you don't need 
CROSS_COMPILE=something to build for one if you are running another. I 
didn't follow the thread closely (relying on Maximilian to review 
anything deb-pkg related), I just wanted to point out a potential 
difference that might confuse you when comparing builds for arm and for 
i386.

Michal
