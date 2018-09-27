Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34886 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbeI0OJu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Sep 2018 10:09:50 -0400
Received: by mail-lf1-f68.google.com with SMTP id r191-v6so1375265lff.2
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Sep 2018 00:52:53 -0700 (PDT)
Subject: Re: [PATCH v8 02/10] Makefile: Prepare for using macros for inline
 asm
References: <20180918212847.199085-1-namit@vmware.com>
 <20180918212847.199085-3-namit@vmware.com>
 <1aa5a1f3-ef3d-5cd3-831c-2202d73d3c9e@rasmusvillemoes.dk>
 <307823F9-DCCF-4384-9FBE-28642FAD6B4E@vmware.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <4d3684d6-f415-09b3-0a4f-6eca173bfd37@rasmusvillemoes.dk>
Date: Thu, 27 Sep 2018 09:52:50 +0200
MIME-Version: 1.0
In-Reply-To: <307823F9-DCCF-4384-9FBE-28642FAD6B4E@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On 2018-09-26 19:56, Nadav Amit wrote:
> at 1:58 AM, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
> 
>>> +ASM_MACRO_FLAGS = -Wa,arch/x86/kernel/macros.s
>>> +export ASM_MACRO_FLAGS
>>> +KBUILD_CFLAGS += $(ASM_MACRO_FLAGS)
>> How does this affect what gets rebuilt when one of the asm/foo.h files
>> going into macros.s changes? Does that cause a global rebuild because
>> everything depends on macros.s, or do we still only rebuild the files
>> that actually include asm/foo.h?
> 
> There will not be a global rebuild. Any source file that uses the header
> files that are included in macros.S will be rebuilt.
> 
> But your question actually raises two issues:
> 
> 1. If macros.S changes, there *should* be a global rebuild, and currently
> there wouldn’t be one. Do you happen to know what would be the appropriate
> way to trigger one?

Hm, that's a question for Kbuild folks, I think. Maybe one could just
ensure macros.s gets written into the dependency file for each
translation unit (maybe fixdep already has support for that). But if we
do that, we probably want macros.s to be generated with some if_changed
makefile magic, so that changes in one of the asm/ headers that do not
actually change macros.s does not cause a global rebuild (it would still
rebuild the files that actually inclue that asm/ header, of course).

> 2. Someone might mistakenly use the macros through inline assembly without
> including the header file.

That's rather unlikely, I think. An open-coded asm("SOME_MACRO ...")
would hopefully be caught in review. But yeah...

> It would be better to detect such cases and fail
> the build. I may be able to create another asm macro in the C part of the
> header that would cause the build to fail. But let me know if you any
> better idea.

The best I can think of (and I'm not suggesting to do this, or that it
would actually work): In asm/foo.h, inside its cpp include guard, and
inside a guard that excludes this piece when building macros.s itself,
have a 'asm("___asm_foo_included__ = 1\n")'. Then inside each asm macro
defined in asm/foo.h, have a ".ifndef ___asm_foo_included___\n.error
...\n.endif". That latter part might be macrofied itself so that it's
just one line, "CHECK_INCLUDE ___asm_foo_included___\n", with
CHECK_INCLUDE being defined in macros.S.

Rasmus
