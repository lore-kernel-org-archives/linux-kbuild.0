Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:42731 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932371Ab3LaApr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Dec 2013 19:45:47 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so12542939oag.20
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Dec 2013 16:45:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1312301331520.10482@chino.kir.corp.google.com>
References: <1387481759-14535-3-git-send-email-keescook@chromium.org>
	<tip-8779657d29c0ebcc0c94ede4df2f497baf1b563f@git.kernel.org>
	<alpine.DEB.2.02.1312301331520.10482@chino.kir.corp.google.com>
Date: Mon, 30 Dec 2013 16:45:44 -0800
Message-ID: <CAGXu5jJxkD7rS0gFAS3mAhwxP05UMW8KNW00C_e2v=Keqj7k3Q@mail.gmail.com>
Subject: Re: [patch core/stackprotector] stackprotector: Fix build when
 compiler lacks support
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, ralf@linux-mips.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>, Arjan van de Ven <arjan@linux.intel.com>, James Hogan <james.hogan@imgtec.com>, Michal Marek <mmarek@suse.cz>, Paul Mundt <lethal@linux-sh.org>, Shawn Guo <shawn.guo@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>

On Mon, Dec 30, 2013 at 1:37 PM, David Rientjes <rientjes@google.com> wrote:
> 8779657d29c0 ("stackprotector: Introduce CONFIG_CC_STACKPROTECTOR_STRONG")
> causes the build to break when the compiler doesn't support
> -fstack-protector-strong:
>
>         cc1: error: unrecognized command line option ‘-fstack-protector-strong’
>         cc1: error: unrecognized command line option ‘-fstack-protector-strong’
>
> with at least gcc 4.6.3.
>
> Instead of breaking the build, just warn of the failure and disable the
> feature.

NAK. If you have selected CONFIG_CC_STACKPROTECTOR_STRONG, the build
the fail hard. Without this, it means you'll end up with kernels that
build and show a stackprotector option in their config, which is
false.

-Kees

>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -603,10 +603,11 @@ ifdef CONFIG_CC_STACKPROTECTOR_REGULAR
>               -fstack-protector not supported by compiler))
>    endif
>  else ifdef CONFIG_CC_STACKPROTECTOR_STRONG
> -  stackp-flag := -fstack-protector-strong
> -  ifeq ($(call cc-option, $(stackp-flag)),)
> +  ifeq ($(call cc-option, -fstack-protector-strong),)
>      $(warning Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: \
>               -fstack-protector-strong not supported by compiler)
> +  else
> +    stackp-flag := -fstack-protector-strong
>    endif
>  else
>    # Force off for distro compilers that enable stack protector by default.



-- 
Kees Cook
Chrome OS Security
