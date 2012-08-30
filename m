Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36302 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751590Ab2H3Na5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Aug 2012 09:30:57 -0400
Message-ID: <503F6B08.3000007@suse.cz>
Date: Thu, 30 Aug 2012 15:30:48 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [Patch] scripts: fix "make install" when a directory or file
 named install exists
References: <CA+Y=x3k4eMMamEANrSFGcopAesMqrbQP-gcxvyXpV7SEee4hOw@mail.gmail.com>
In-Reply-To: <CA+Y=x3k4eMMamEANrSFGcopAesMqrbQP-gcxvyXpV7SEee4hOw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Worsley <amworsley@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 7.8.2012 11:08, Andrew Worsley wrote:
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index ff1720d..cf4b970 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -434,6 +434,7 @@ $(multi-used-m) : %.o: $(multi-objs-m) FORCE
> 
>  targets += $(multi-used-y) $(multi-used-m)
> 
> +PHONY += install
> 
>  # Descending
>  # ---------------------------------------------------------------------------

I don't think this is the right place to fix it (at least, it should be
near the .PHONY target with an explanation why it is needed). First, the
PHONY variable is usually assigned right before the target is defined.
Second, the are usually two 'install' targets: One is in
arch/$arch/Makefile, which usually invokes scripts/Makefile.build in
arch/$arch/boot, where the actual install target is defined. So this
patch only covers the arch/$arch/boot/Makefile case. It works on x86,
because arch/x86/Makefile already has the PHONY assignment and only
arch/x86/boot/Makefile is missing it. Also, not all architectures have
install, while some have more *install variants. So I'm for fixing the
Makefiles that do not yet have the PHONY += install or such.

Michal
