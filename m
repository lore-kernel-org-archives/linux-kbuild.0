Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38222 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932530AbcGZVW7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 17:22:59 -0400
Received: by mail-wm0-f49.google.com with SMTP id o80so34650478wme.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jul 2016 14:22:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160726210613.GA26777@sepie.suse.cz>
References: <20160712223043.GA11664@www.outflux.net> <20160726210613.GA26777@sepie.suse.cz>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 26 Jul 2016 14:22:55 -0700
Message-ID: <CAGXu5jJZiC3rW4KJrezWJengX7KMK0pCRfoQ0Qwd=DeivfeMhg@mail.gmail.com>
Subject: Re: [RESEND][PATCH] kbuild: Abort build on bad stack protector flag
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "x86@kernel.org" <x86@kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Jul 26, 2016 at 2:06 PM, Michal Marek <mmarek@suse.com> wrote:
> On Tue, Jul 12, 2016 at 03:30:43PM -0700, Kees Cook wrote:
>> Before, the stack protector flag was sanity checked before .config had
>> been reprocessed. This meant the build couldn't be aborted early, and
>> only a warning could be emitted followed later by the compiler blowing
>> up with an unknown flag. This has caused a lot of confusion over time,
>> so this splits the flag selection from sanity checking and performs the
>> sanity checking after the make has been restarted from a reprocessed
>> .config, so builds can be aborted as early as possible now.
>>
>> Additionally moves the x86-specific sanity check to the same location,
>> since it suffered from the same warn-then-wait-for-compiler-failure
>> problem.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Hi Kees,
>
> sorry for the late review.
>
>
>> +# Find arch-specific stack protector compiler sanity-checking script.
>> +ifdef CONFIG_CC_STACKPROTECTOR
>> +  stackp-path := $(srctree)/scripts/gcc-$(ARCH)_$(BITS)-has-stack-protector.sh
>
> You need to use SRCARCH here if you want "x86" on x86.
>
>
>> +  ifneq ($(wildcard $(stackp-path)),)
>> +    stackp-check := $(stackp-path)
>> +  endif
>
> stackp-check := $(wildcard $(stackp-path))
>
> is more straightforward. But the long version is correct as well.

Ah! Yes, thanks. I was thinking I needed to handle "defined but
empty", but that's not true for Makefiles. I'll send a v2 with this
and SRCARCH fixed.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
