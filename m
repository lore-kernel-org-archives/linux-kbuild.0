Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38447 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829AbcGIQ7T (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Jul 2016 12:59:19 -0400
Received: by mail-wm0-f41.google.com with SMTP id o80so794635wme.1
        for <linux-kbuild@vger.kernel.org>; Sat, 09 Jul 2016 09:59:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160709120302.GB26253@gmail.com>
References: <20160618180800.GA1006@www.outflux.net> <20160709120302.GB26253@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Sat, 9 Jul 2016 09:59:16 -0700
Message-ID: <CAGXu5jLJt3P0-VYqn6K3-1mpTS4n3JRwMzkJwR3+x4Azqk3eUw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Abort build on bad stack protector flag
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, "x86@kernel.org" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, Jul 9, 2016 at 5:03 AM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Kees Cook <keescook@chromium.org> wrote:
>
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
>> ---
>>  Makefile          | 69 +++++++++++++++++++++++++++++++++----------------------
>>  arch/x86/Makefile |  8 -------
>>  2 files changed, 42 insertions(+), 35 deletions(-)
>
> What's the status of this patch? I can merge it if Michal acks the main Makefile
> bits.

There's been no feedback yet, but I'd really like to see it landed: it
removes a lot of ambiguity for this option (and creates a place for
future similar options).

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
