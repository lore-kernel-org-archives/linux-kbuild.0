Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59071 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754459AbcKIV30 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Nov 2016 16:29:26 -0500
Subject: Re: [PATCH 1/3] kbuild: add -fno-PIE
References: <20161104183940.30692-1-bigeasy@linutronix.de>
 <20161104183940.30692-2-bigeasy@linutronix.de>
 <20161108221437.GA9197@sepie.suse.cz> <20161109061041.GA19246@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <3cfab3f0-aef9-08a5-894c-06ea381f287b@suse.com>
Date: Wed, 9 Nov 2016 22:29:21 +0100
MIME-Version: 1.0
In-Reply-To: <20161109061041.GA19246@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>

Dne 9.11.2016 v 07:10 Ingo Molnar napsal(a):
> 
> * Michal Marek <mmarek@suse.com> wrote:
> 
>> On Fri, Nov 04, 2016 at 07:39:38PM +0100, Sebastian Andrzej Siewior wrote:
>>> Debian started to build the gcc with -fPIE by default so the kernel
>>> build ends before it starts properly with:
>>> |kernel/bounds.c:1:0: error: code model kernel does not support PIC mode
>>>
>>> Also add to KBUILD_AFLAGS due to:
>>>
>>> |gcc -Wp,-MD,arch/x86/entry/vdso/vdso32/.note.o.d … -mfentry -DCC_USING_FENTRY … vdso/vdso32/note.S
>>> |arch/x86/entry/vdso/vdso32/note.S:1:0: sorry, unimplemented: -mfentry isn’t supported for 32-bit in combination with -fpic
>>>
>>> Tagging it stable so it is possible to compile recent stable kernels as
>>> well.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>> ---
>>>  Makefile | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index a2650f9c6a25..d61145ebf498 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -622,6 +622,8 @@ include arch/$(SRCARCH)/Makefile
>>>  KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
>>>  KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
>>>  KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
>>> +KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
>>> +KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
>>
>> Bad compiler. No pie for you.
>>
>> I applied this one to kbuild.git. How about 2/3 and 3/3. Will these be
>> merged via tip.git or shall I apply them as well?
> 
> I'd suggest applying them to the kbuild tree, as they are related.

OK, done.

Michal


