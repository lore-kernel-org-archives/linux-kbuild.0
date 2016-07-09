Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36619 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756620AbcGIMDH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Jul 2016 08:03:07 -0400
Date: Sat, 9 Jul 2016 14:03:02 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] kbuild: Abort build on bad stack protector flag
Message-ID: <20160709120302.GB26253@gmail.com>
References: <20160618180800.GA1006@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160618180800.GA1006@www.outflux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org


* Kees Cook <keescook@chromium.org> wrote:

> Before, the stack protector flag was sanity checked before .config had
> been reprocessed. This meant the build couldn't be aborted early, and
> only a warning could be emitted followed later by the compiler blowing
> up with an unknown flag. This has caused a lot of confusion over time,
> so this splits the flag selection from sanity checking and performs the
> sanity checking after the make has been restarted from a reprocessed
> .config, so builds can be aborted as early as possible now.
> 
> Additionally moves the x86-specific sanity check to the same location,
> since it suffered from the same warn-then-wait-for-compiler-failure
> problem.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Makefile          | 69 +++++++++++++++++++++++++++++++++----------------------
>  arch/x86/Makefile |  8 -------
>  2 files changed, 42 insertions(+), 35 deletions(-)

What's the status of this patch? I can merge it if Michal acks the main Makefile 
bits.

Thanks,

	Ingo
