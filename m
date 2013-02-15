Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48140 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750733Ab3BOXlm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Feb 2013 18:41:42 -0500
Message-ID: <511EC7AA.1040606@suse.cz>
Date: Sat, 16 Feb 2013 00:41:30 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] kernel: Replace timeconst.pl with a bc script
References: <1360883635-25268-1-git-send-email-hpa@zytor.com>
In-Reply-To: <1360883635-25268-1-git-send-email-hpa@zytor.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org, mingo@kernel.org, tglx@linutronix.de, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

Dne 15.2.2013 00:13, H. Peter Anvin napsal(a):
> Unfortunately switching to Perl required a really ugly "canning"
> mechanism to support Perl < 5.8 installations lacking the Math::BigInt
> module.

Yes, this was really ugly.


> It was recently pointed out to me that some very old versions of GNU
> make had problems with pipes in subshells, which was indeed the
> construct used in the Makefile rules in that version of the patch;
> Perl didn't need it so switching to Perl fixed the problem for
> unrelated reasons.  With the problem (hopefully) root-caused, we can
> switch back to bc and do the arbitrary-precision arithmetic naturally.

Great.

> 
> Signed-off-by: H. Peter Anvin <hpa@zytor.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  kernel/Makefile     |  16 ++-
>  kernel/timeconst.bc | 108 +++++++++++++++
>  kernel/timeconst.pl | 376 ----------------------------------------------------
>  3 files changed, 120 insertions(+), 380 deletions(-)
>  create mode 100644 kernel/timeconst.bc
>  delete mode 100644 kernel/timeconst.pl
> 
> Comments appreciated; including the preferred way to merge this.

I can merge it into the kbuild tree if wanted. I only have one nipick:

> +/* Division by reciprocal multiplication. */
> +define fmul(b,n,d) {
> +       return (2^b*n+d-1)/d;
> +}

For readability reasons, I suggest to use the same formatting of
expressions and argument lists like in C:

define fmul(b, n, d) {
       return (2^b * n + d - 1) / d;
}

Otherwise, you can add

Acked-by: Michal Marek <mmarek@suse.cz>

Michal
