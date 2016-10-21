Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:58356 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933253AbcJUVVl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Oct 2016 17:21:41 -0400
Date: Fri, 21 Oct 2016 23:21:27 +0200
From: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Message-ID: <20161021212127.GA32611@angband.pl>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161021111600.9417-1-bigeasy@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On Fri, Oct 21, 2016 at 01:16:00PM +0200, Sebastian Andrzej Siewior wrote:
> Debian started to build the gcc with --enable-default-pie by default

To be exact: this is since gcc-6 6.2.0-7 dated Tue, 18 Oct 2016 13:53:00 +0200
on amd64 arm64 armel armhf i386 mips mipsel mips64el ppc64el s390x.

> so the kernel build ends before it starts properly with:
> |kernel/bounds.c:1:0: error: code model kernel does not support PIC mode
> 
> Is this okay or do we want some kind of check to see if -fno-PIE is supported?
> It is mentioned in the 4.4.7 gcc manpage is it is not *that* new :)

A naive "git log -Sno-PIE" on gcc sources shows commit 3e7f6cce[1] from Feb
2004, and as gcc automatically supports no-XXX whenever XXX is added, it
appears the option is older than that.

> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index bf6e44a421df..97296d66b586 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -398,7 +398,7 @@ KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>  		   -fno-strict-aliasing -fno-common \
>  		   -Werror-implicit-function-declaration \
> -		   -Wno-format-security \
> +		   -Wno-format-security -fno-PIE \
>  		   -std=gnu89
>  
>  KBUILD_AFLAGS_KERNEL :=
> -- 
> 2.9.3

The patch works for me.  I haven't done any but most trivial testing,
though.


[1]. Using the https://gcc.gnu.org/git/gcc.git git gateway, commit hashes
may be different elsewhere.
-- 
A MAP07 (Dead Simple) raspberry tincture recipe: 0.5l 95% alcohol, 1kg
raspberries, 0.4kg sugar; put into a big jar for 1 month.  Filter out and
throw away the fruits (can dump them into a cake, etc), let the drink age
at least 3-6 months.
