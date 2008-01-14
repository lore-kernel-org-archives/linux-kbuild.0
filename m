Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ag-out-0708.google.com ([72.14.246.246]:24135 "EHLO
	ag-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356AbYANG1c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Jan 2008 01:27:32 -0500
Received: by ag-out-0708.google.com with SMTP id 23so1377453agd.10
        for <linux-kbuild@vger.kernel.org>; Sun, 13 Jan 2008 22:27:29 -0800 (PST)
Date: Mon, 14 Jan 2008 14:26:34 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: (Try #3) [Patch 2/8] MIPS: Remove 'TOPDIR' from Makefiles
Message-ID: <20080114062634.GB2537@hacking>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
References: <20080101071311.GA2496@hacking> <20080101072238.GC2496@hacking> <20080101101540.GB28913@uranus.ravnborg.org> <jefxxhlkxb.fsf@sykes.suse.de> <20080101175754.GC31575@uranus.ravnborg.org> <20080102062135.GE2493@hacking> <20080111141754.GC19900@linux-mips.org> <20080111170204.GA28299@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080111170204.GA28299@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, WANG Cong <xiyou.wangcong@gmail.com>, Andreas Schwab <schwab@suse.de>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@osdl.org>, linux-mips@linux-mips.org

On Fri, Jan 11, 2008 at 06:02:04PM +0100, Sam Ravnborg wrote:
>On Fri, Jan 11, 2008 at 02:17:54PM +0000, Ralf Baechle wrote:
>> On Wed, Jan 02, 2008 at 02:21:36PM +0800, WANG Cong wrote:
>> 
>> > >> Shouldn't that use $(LINUXINCLUDE), or $(KBUILD_CPPFLAGS)?
>> > >It would be better to use $(LINUXINCLUDE) as we then pull in all config
>> > >symbols too and do not have to hardcode kbuild internal names (include2).
>> > 
>> > OK. Refine this patch.
>> 
>> LDSCRIPT also needed fixing to get builds in a separate object directory
>> working again.
>> 
>> I've applied below fix.
>
>Great - I will drop it from my tree. 
>
>See small comment below.
>
>	Sam
>
>
>>   Ralf
>> 
>> From 8babf06e1265214116fb8ffc634c04df85597c52 Mon Sep 17 00:00:00 2001
>> From: WANG Cong <xiyou.wangcong@gmail.com>
>> Date: Wed, 2 Jan 2008 14:21:36 +0800
>> Subject: [PATCH] [MIPS] Lasat: Fix built in separate object directory.
>> 
>> Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
>> 
>> [Ralf: The LDSCRIPT script needed fixing, too]
>> 
>> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
>> 
>> diff --git a/arch/mips/lasat/image/Makefile b/arch/mips/lasat/image/Makefile
>> index 5332449..7ccd40d 100644
>> --- a/arch/mips/lasat/image/Makefile
>> +++ b/arch/mips/lasat/image/Makefile
>> @@ -12,11 +12,11 @@ endif
>>  
>>  MKLASATIMG = mklasatimg
>>  MKLASATIMG_ARCH = mq2,mqpro,sp100,sp200
>> -KERNEL_IMAGE = $(TOPDIR)/vmlinux
>> +KERNEL_IMAGE = vmlinux
>>  KERNEL_START = $(shell $(NM) $(KERNEL_IMAGE) | grep " _text" | cut -f1 -d\ )
>>  KERNEL_ENTRY = $(shell $(NM) $(KERNEL_IMAGE) | grep kernel_entry | cut -f1 -d\ )
>>  
>> -LDSCRIPT= -L$(obj) -Tromscript.normal
>> +LDSCRIPT= -L$(srctree)/$(obj) -Tromscript.normal
>
>This needs to read:
>> +LDSCRIPT= -L$(srctree)/$(src) -Tromscript.normal
>
>
>(There is no difference between src and obj in normal cases but to be consistent
>it shuld be like above).

Agreed. Thank you!

