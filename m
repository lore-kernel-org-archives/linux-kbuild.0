Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33492 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754724AbcKDLhM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 07:37:12 -0400
Subject: Re: [PATCH 2/2] kbuild: add -fno-PIE
References: <20161102172058.13641-1-bigeasy@linutronix.de>
 <20161102172058.13641-2-bigeasy@linutronix.de>
 <1478213455.29107.13.camel@decadent.org.uk>
 <20161104010811.GD19539@ZenIV.linux.org.uk>
From: "Austin S. Hemmelgarn" <ahferroin7@gmail.com>
Message-ID: <adb64e4e-0745-c23c-2b8f-a67372b1d28f@gmail.com>
Date: Fri, 4 Nov 2016 07:37:02 -0400
MIME-Version: 1.0
In-Reply-To: <20161104010811.GD19539@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

On 2016-11-03 21:08, Al Viro wrote:
> On Thu, Nov 03, 2016 at 04:50:55PM -0600, Ben Hutchings wrote:
>> On Wed, 2016-11-02 at 18:20 +0100, Sebastian Andrzej Siewior wrote:
>>> Debian started to build the gcc with -fPIE by default so the kernel
>>> build ends before it starts properly with:
>>> |kernel/bounds.c:1:0: error: code model kernel does not support PIC mode
>>>
>>>
>>> Also add to KBUILD_AFLAGSi due to:
>>>
>>> |gcc -Wp,-MD,arch/x86/entry/vdso/vdso32/.note.o.d … -mfentry -DCC_USING_FENTRY … vdso/vdso32/note.S
>>> |arch/x86/entry/vdso/vdso32/note.S:1:0: sorry, unimplemented: -mfentry isn’t supported for 32-bit in c ombination with -fpic
>> [...]
>>
>> Unfortunately this isn't sufficient:
>>
>> Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong available but compiler is broken
>> /build/linux-4.9~rc3/Makefile:1069: recipe for target 'prepare-compiler-check' failed
>> make[5]: *** [prepare-compiler-check] Error 1
>>
>> scripts/gcc-x86_64-has-stack-protector.sh has its own list of options
>> which will need to include -fno-PIE.
>
> That shit should be fixed in debian; no amount of kbuild changes will help
> on bisect going back to a state prior to those.  IOW, no matter what we
> do kernel-side, that fuckup by doku, balint, et.al. needs to be fixed in
> debian gcc package.
>
> Al, seriously disappointed by that mess - debian gcc packagers are generally
> clued enough to have known better.  Reassigning bug reports in question
> from gcc-6 to linux is beyond stupid; Balint is either being deliberately
> obtuse, or geniunely unable to imagine that somebody might be using the
> compiler _not_ for debian package builds.
>
If it helps, you could point out that Gentoo's hardened profile's GCC 
builds use PIE by default and have absolutely zero issues building the 
Linux kernel without any special kernel patches to turn it off (and has 
been doing so for years).
