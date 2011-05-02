Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:46313 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755345Ab1EBUdW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 May 2011 16:33:22 -0400
Message-ID: <4DBF1509.2000702@suse.cz>
Date: Mon, 02 May 2011 22:33:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: linux-next: Tree for May 2 (uml builds fail)
References: <20110502150150.d932642f.sfr@canb.auug.org.au> <20110502081948.1ccb9aef.rdunlap@xenotime.net> <20110502160405.GE15769@sepie.suse.cz> <20110502165208.GA18740@merkur.ravnborg.org>
In-Reply-To: <20110502165208.GA18740@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 2.5.2011 18:52, Sam Ravnborg wrote:
> On Mon, May 02, 2011 at 06:04:05PM +0200, Michal Marek wrote:
>> On Mon, May 02, 2011 at 08:19:48AM -0700, Randy Dunlap wrote:
>>> On Mon, 2 May 2011 15:01:50 +1000 Stephen Rothwell wrote:
>>>
>>>> Hi all,
>>>>
>>>> Changes since 20110429:
>>>
>>>
>>> uml builds on i386 or x86_64 fail with: (I'm using O=outputdir if it matters)
>>>
>>>   GEN     /lnx/src/NEXT/linux-next-20110502/UM64/Makefile
>>> scripts/kconfig/conf --silentoldconfig arch/um/Kconfig.x86
>>>   GEN     /lnx/src/NEXT/linux-next-20110502/UM64/Makefile
>>> /lnx/src/NEXT/linux-next-20110502/scripts/Makefile.asm-generic:9: /lnx/src/NEXT/linux-next-20110502/arch/um/include/asm/Kbuild: No such file or directory
>>> make[2]: *** No rule to make target `/lnx/src/NEXT/linux-next-20110502/arch/um/include/asm/Kbuild'.  Stop.
>>
>> This patch should fix it.
>>
>> Michal
>>
>> Subject: [PATCH] kbuild: Fix Makefile.asm-generic for um
>>
>> Do nothing if arch/$(SRCARCH)/include/asm/Kbuild does not exist, which
>> is the case of um.
>>
>> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
> 
> Makes sense - sorry for not catchign the um case!
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, pushed to kbuild-2.6.git#kbuild.

Michal
