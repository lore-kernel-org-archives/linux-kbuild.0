Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:54003 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932370AbcCRJwt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 05:52:49 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
Date: Fri, 18 Mar 2016 10:52:12 +0100
Message-ID: <23667289.mNa1Q2STbY@wuerfel>
In-Reply-To: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>, Michal Marek <mmarek@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 18 March 2016 14:16:23 Vineet Gupta wrote:
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index fed12f39d8ce..aeb101e8e674 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -48,9 +48,14 @@ endif
>  upto_gcc44    :=  $(call cc-ifversion, -le, 0404, y)
>  atleast_gcc44 :=  $(call cc-ifversion, -ge, 0404, y)
>  atleast_gcc48 :=  $(call cc-ifversion, -ge, 0408, y)
> +is_gcc48      :=  $(call cc-ifversion, -eq, 0408, y)
>  
>  cflags-$(atleast_gcc44)                        += -fsection-anchors
>  
> +# gcc 4.8 spits out false positives for default -O3
> +# disable these for 4.8 and revisit when we upgrade to newer ver
> +cflags-$(is_gcc48)                     += $(call cc-disable-warning,maybe-uninitialized,)
> +
>  cflags-$(CONFIG_ARC_HAS_LLSC)          += -mlock
>  cflags-$(CONFIG_ARC_HAS_SWAPE)         += -mswape

Is this any better with gcc-4.9 or gcc-5? Maybe it's better to add the flag to
the line that adds -O3 for consistency. We do the same thing for -Os in the
global Makefile, as that triggers a similar load of warnings.

	Arnd
