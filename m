Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tomts13-srv.bellnexxia.net ([209.226.175.34]:47735 "EHLO
	tomts13-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753724AbYBDNUk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Feb 2008 08:20:40 -0500
Date: Mon, 4 Feb 2008 08:08:36 -0500
From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: Re: [PATCH] kbuild: Fix instrumentation removal breakage on avr32
Message-ID: <20080204130835.GA16379@Krystal>
References: <20080203211042.GF2648@uranus.ravnborg.org> <20080204124448.3633e937@dhcp-252-066.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <20080204124448.3633e937@dhcp-252-066.norway.atmel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

* Haavard Skinnemoen (hskinnemoen@atmel.com) wrote:
> On Sun, 3 Feb 2008 22:10:42 +0100
> Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > Mathieu Desnoyers (5):
> >       Move Kconfig.instrumentation to arch/Kconfig and init/Kconfig
> 
> AVR32 still includes Kconfig.instrumentation, so it won't build after
> this...
> 
> I did point this out when the patch was submitted, I sent the avr32
> pull request early as promised (more than a week ago), but it still
> broke. Please apply the fix below. This fixes 2.6.24-mm1 too.
> 

This one slipped through.

Acked-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

> Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
> ---
>  arch/avr32/Kconfig |    2 --
>  1 file changed, 2 deletions(-)
> 
> Index: linux-2.6.24-mm1/arch/avr32/Kconfig
> ===================================================================
> --- linux-2.6.24-mm1.orig/arch/avr32/Kconfig	2008-02-04 12:28:31.000000000 +0100
> +++ linux-2.6.24-mm1/arch/avr32/Kconfig	2008-02-04 12:28:36.000000000 +0100
> @@ -236,8 +236,6 @@ source "drivers/Kconfig"
>  
>  source "fs/Kconfig"
>  
> -source "kernel/Kconfig.instrumentation"
> -
>  source "arch/avr32/Kconfig.debug"
>  
>  source "security/Kconfig"

-- 
Mathieu Desnoyers
Computer Engineering Ph.D. Student, Ecole Polytechnique de Montreal
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
