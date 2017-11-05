Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:59083 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751518AbdKEItQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Nov 2017 03:49:16 -0500
Date: Sun, 5 Nov 2017 09:39:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively
 in Makefile.lib
Message-ID: <20171105083928.GA28930@ravnborg.org>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

Hi Masahiro

Nice cleanup - looks good.

> --- a/arch/mips/boot/dts/brcm/Makefile
> +++ b/arch/mips/boot/dts/brcm/Makefile
> @@ -37,5 +37,3 @@ obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
>  
>  # Force kbuild to make empty built-in.o if necessary
>  obj-				+= dummy.o

I noticed a few of these dummy.o in the patched files.
Looks like another candidate for cleaning up - in a separate patch.

	Sam
