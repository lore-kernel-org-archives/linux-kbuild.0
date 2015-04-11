Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53340 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755342AbbDKTeo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 15:34:44 -0400
Date: Sat, 11 Apr 2015 21:34:41 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Makefile: Fix detection of clang when cross-compiling
Message-ID: <20150411193441.GA12172@sepie.suse.cz>
References: <1428590094-6995-1-git-send-email-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1428590094-6995-1-git-send-email-paul@crapouillou.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 09, 2015 at 04:34:54PM +0200, Paul Cercueil wrote:
> When the host's C compiler is clang, and when attempting to
> cross-compile Linux e.g. to MIPS with mipsel-linux-gcc, the Makefile
> would incorrectly detect the use of clang, which resulted in
> clang-specific flags being passed to mipsel-linux-gcc.
> 
> This can be verified under Debian by installing the "clang" package,
> and then using it as the default compiler with:
> sudo update-alternatives --config cc
> 
> This patch moves the detection of clang after the $(CC) variable is
> initialized to the name of the cross-compiler, so that the check applies
> to the cross-compiler and not the host's C compiler.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Makefile | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 54430f9..5fff1b2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -335,15 +335,6 @@ endif
>  export KBUILD_MODULES KBUILD_BUILTIN
>  export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
>  
> -ifneq ($(CC),)
> -ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
> -COMPILER := clang
> -else
> -COMPILER := gcc
> -endif
> -export COMPILER
> -endif
> -
>  # Look for make include files relative to root of kernel src
>  MAKEFLAGS += --include-dir=$(srctree)
>  
> @@ -369,6 +360,13 @@ PERL		= perl
>  PYTHON		= python
>  CHECK		= sparse
>  
> +ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
> +COMPILER := clang
> +else
> +COMPILER := gcc
> +endif
> +export COMPILER

It should be moved even deeper, after the inclusion of arch/*/Makefile.
There are architectures which set $(CROSS_COMPILE) by default, as a
convenience.

Michal
