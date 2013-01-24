Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:34999 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751902Ab3AXRlv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2013 12:41:51 -0500
Date: Thu, 24 Jan 2013 18:41:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Add Intel Ivy bridge CPU flags
Message-ID: <20130124174148.GA15499@merkur.ravnborg.org>
References: <51002135.2060302@theangrymob.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51002135.2060302@theangrymob.co.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alec Bickerton <alec@theangrymob.co.uk>
Cc: linux-kbuild@vger.kernel.org

On Wed, Jan 23, 2013 at 06:43:17PM +0100, Alec Bickerton wrote:
> Hi,
> 
> I'd like to submit the attached patch to add Ivy Bridge processor support to the
> processor type menu in menuconfig. Setting this configures the appropriate
> CFLAGS (core-avx-i) for ivy bridge.
> 
> As this is my first kbuild patch, could somebody review it and let me know what
> I've done wrong. ;-)

Like Michal I do not know about x86 - but a few things I noticed.

> 
> Thanks
> Alec.

> >From 2eaf7717da5b7f753c66e2158d29744aafbc2a0c Mon Sep 17 00:00:00 2001
> From: Alec Bickerton <alec.bickerton@gmail.com>
> Date: Mon, 1 Oct 2012 21:12:55 +0200
> Subject: [PATCH] Added Ivy bridge to menu
> 
Signed-off-by: ... missing.
See Documentation/SubmittingPatches (somethign like that)

> +config MIVYBRIDGE
> +    bool "Intel Ivy Bridge"
> +    --help--
> +    
> +      Select this foe Intel 3770K family processors.
Use "  help" - in new stuff we try to avoid --help--
Drop empty line between help and help text.
Fix your spelling foe => for


> --- a/arch/x86/Makefile_32.cpu
> +++ b/arch/x86/Makefile_32.cpu
> @@ -33,6 +33,7 @@ cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)-f
>  cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
>  cflags-$(CONFIG_MVIAC7)		+= -march=i686
>  cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)
> +cflags-$(CONFIG_MIVYBRIDGE)		+= -march=i686 $(call tune,core-avx-i)
>  cflags-$(CONFIG_MATOM)		+= $(call cc-option,-march=atom,$(call cc-option,-march=core2,-march=i686)) \
>  	$(call cc-option,-mtune=atom,$(call cc-option,-mtune=generic))

Not a fault in your patch - but the x86 guys should learn to use the
X86_ prefix on x86 specific config symbols :-(
For consistency do not add it.

	Sam

