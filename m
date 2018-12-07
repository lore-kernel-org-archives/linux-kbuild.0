Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr720088.outbound.protection.outlook.com ([40.107.72.88]:4992
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726008AbeLGN3k (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Dec 2018 08:29:40 -0500
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <19c7bdab-8df8-f7c6-7921-9a4d43dbca64@monstr.eu>
 <CAK7LNATWSNqZ8uE+teMW+uvDCLXfq6zMTqh_7=ssrPquCLJz8A@mail.gmail.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <938f1368-5e07-0178-5b99-d8331ce216f8@xilinx.com>
Date: Fri, 7 Dec 2018 14:29:14 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNATWSNqZ8uE+teMW+uvDCLXfq6zMTqh_7=ssrPquCLJz8A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Simek <monstr@monstr.eu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>

On 07. 12. 18 12:29, Masahiro Yamada wrote:
> On Thu, Dec 6, 2018 at 11:55 PM Michal Simek <monstr@monstr.eu> wrote:
>>
>> On 03. 12. 18 8:50, Masahiro Yamada wrote:
>>> This patch set fixes various issues in microblaze Makefiles.
>>>
>>> BTW, "simpleImage.<dt>" works like a phony target to generate the
>>> following four images, where the first three are just aliases.
>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>:
>>>          identical to arch/microblaze/boot/linux.bin
>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>.unstrip:
>>>          identical to vmlinux
>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>.ub:
>>>          identical to arch/microblaze/boot/linux.bin.ub
>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>.strip:
>>>          stripped vmlinux
>>>
>>> I am not sure how much useful those copies are,
>>> but, I tried my best to keep the same behavior.
>>>
>>> IMHO, I guess DTB=<dt> would be more sensible,
>>> but it is up to Michal.
>>>
>>>
>>>
>>> Masahiro Yamada (7):
>>>   microblaze: fix cleaning of boot images
>>>   microblaze: adjust the help to the real behavior
>>>   microblaze: move "... is ready" message to arch/microblaze/Makefile
>>>   microblaze: fix multiple bugs in arch/microblaze/boot/Makefile
>>>   microblaze: add linux.bin* and simpleImage.* to PHONY
>>>   microblaze: fix race condition in building boot images
>>>   microblaze: remove the unneeded code just in case file copy fails
>>>
>>>  arch/microblaze/Makefile          | 14 +++++++++-----
>>>  arch/microblaze/boot/Makefile     | 33 +++++++++++++++++----------------
>>>  arch/microblaze/boot/dts/Makefile |  5 +----
>>>  3 files changed, 27 insertions(+), 25 deletions(-)
>>>
>>
>> One more thing I have in my mind for a while is that will be good to
>> configure kernel build flags from DT and completely get rid of these
>> symbols.
>>
>> XILINX_MICROBLAZE0_USE_MSR_INSTR
>> XILINX_MICROBLAZE0_USE_PCMP_INSTR
>> XILINX_MICROBLAZE0_USE_BARREL
>> XILINX_MICROBLAZE0_USE_DIV
>> XILINX_MICROBLAZE0_USE_HW_MUL
>> XILINX_MICROBLAZE0_USE_FPU
>>
>> It means setup CPUFLAGS based on extracting that values from DT that it
>> all the time match the hardware.
>> It will also simplify all the CPUFLAGS logic which is in
>> arch/microblaze/Makefile.
>>
>> Do you have any idea how this can be done?
> 
> 
> I have no idea.
> 
> Parsing DTS with sed or something would be possible, but ugly.
> 
> In my opinion, the kernel should be multi platform image,
> in other words, it is the least common denominator
> of supported platforms.
> 
> So, the kernel should enable all features that may or may not be used
> depending on platform.
> 
> I do not know if this works for MB.

Microblaze is soft core CPU where you can select if you want to have it
with multiplier, divider, barrel shifter, etc.
You can of course say that you don't have them and you have "universal"
kernel but very slow.
That's why user has to setup these configs which are converted to cflags
to say GCC what can be used.
And these configs can be simply parsed from dt.

For example like this based on dtb (quick hack)

for i in `echo use-msr-instr use-pcmp-instr use-barrel use-div
use-hw-mul use-fpu`; do
	UPPER=`echo $i | tr '-' '_' | tr '[a-z]' '[A-Z}'`
	echo $i $UPPER;

	VAR=`fdtget -t i $FILE/arch/microblaze/boot/dts/system.dtb /cpus/cpu@0/
xlnx,$i`
	FLAGS+="CONFIG_XILINX_MICROBLAZE0_${UPPER}=${VAR} "
done

make $FLAGS


When simpleImage is requested dt could be parsed to setup proper build
flags.

Thanks,
Michal
