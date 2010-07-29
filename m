Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay.atmel.no ([80.232.32.139]:51265 "EHLO relay.atmel.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752030Ab0G2Jbj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 05:31:39 -0400
Date: Thu, 29 Jul 2010 11:26:30 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 1/3] kbuild: allow assignment to {A,C,LD}FLAGS_MODULE on
 the command line
Message-ID: <20100729112630.017b2d6d@hskinnemoen-d830>
In-Reply-To: <20100728182714.GA29232@merkur.ravnborg.org>
References: <20100728182523.GA29198@merkur.ravnborg.org>
	<20100728182714.GA29232@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Denys Vlasenko <vda.linux@googlemail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Chen Liqin <liqin.chen@sunplusct.com>, David Howells <dhowells@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Hirokazu Takata <takata@linux-m32r.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Mike Frysinger <vapier@gentoo.org>, Ralf Baechle <ralf@linux-mips.org>, Tony Luck <tony.luck@intel.com>

Sam Ravnborg <sam@ravnborg.org> wrote:
> diff --git a/arch/avr32/Makefile b/arch/avr32/Makefile
> index ead8a75..22fb665 100644
> --- a/arch/avr32/Makefile
> +++ b/arch/avr32/Makefile
> @@ -13,7 +13,7 @@ KBUILD_DEFCONFIG	:= atstk1002_defconfig
>  
>  KBUILD_CFLAGS	+= -pipe -fno-builtin -mno-pic
>  KBUILD_AFLAGS	+= -mrelax -mno-pic
> -CFLAGS_MODULE	+= -mno-relax
> +KBUILD_CFLAGS_MODULE += -mno-relax
>  LDFLAGS_vmlinux	+= --relax
>  
>  cpuflags-$(CONFIG_PLATFORM_AT32AP)	+= -march=ap

Acked-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
