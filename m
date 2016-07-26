Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50096 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932136AbcGZVGQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 17:06:16 -0400
Date: Tue, 26 Jul 2016 23:06:13 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [RESEND][PATCH] kbuild: Abort build on bad stack protector flag
Message-ID: <20160726210613.GA26777@sepie.suse.cz>
References: <20160712223043.GA11664@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160712223043.GA11664@www.outflux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 12, 2016 at 03:30:43PM -0700, Kees Cook wrote:
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

Hi Kees,

sorry for the late review.


> +# Find arch-specific stack protector compiler sanity-checking script.
> +ifdef CONFIG_CC_STACKPROTECTOR
> +  stackp-path := $(srctree)/scripts/gcc-$(ARCH)_$(BITS)-has-stack-protector.sh

You need to use SRCARCH here if you want "x86" on x86.


> +  ifneq ($(wildcard $(stackp-path)),)
> +    stackp-check := $(stackp-path)
> +  endif

stackp-check := $(wildcard $(stackp-path))

is more straightforward. But the long version is correct as well.

Michal
