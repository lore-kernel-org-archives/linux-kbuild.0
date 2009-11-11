Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:60087 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751886AbZKKG1t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Nov 2009 01:27:49 -0500
Date: Wed, 11 Nov 2009 07:27:36 +0100
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] x86 VSDO: fix Kconfig help
Message-ID: <20091111062736.GA20546@elte.hu>
References: <4AF9FB6C.70003@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4AF9FB6C.70003@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, x86@kernel.org, linux-kbuild@vger.kernel.org


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> COMPAT_VDSO has 2 help text blocks, but kconfig only uses the
> last one found, so merge the 2 blocks.
> 
> It would be real nice if kconfig would warn about this.
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  arch/x86/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- lnx-2632-rc6.orig/arch/x86/Kconfig
> +++ lnx-2632-rc6/arch/x86/Kconfig
> @@ -1601,12 +1601,12 @@ config COMPAT_VDSO
>  	prompt "Compat VDSO support"
>  	depends on X86_32 || IA32_EMULATION
>  	---help---
> -	  Map the 32-bit VDSO to the predictable old-style address too.
> -	---help---
>  	  Say N here if you are running a sufficiently recent glibc
>  	  version (2.3.3 or later), to remove the high-mapped
>  	  VDSO mapping and to exclusively use the randomized VDSO.
>  
> +	  Map the 32-bit VDSO to the predictable old-style address too.
> +
>  	  If unsure, say Y.

I've applied it with the original ordering of the lines - it makes more 
sense that way. (first short summary of what the option does, then a 
longer paragraph.)

	Ingo
