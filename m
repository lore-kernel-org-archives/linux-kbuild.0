Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49269 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750921AbdJYFll (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Oct 2017 01:41:41 -0400
MIME-Version: 1.0
In-Reply-To: <20171009150523.GT20805@n2100.armlinux.org.uk>
References: <1507091240-12756-1-git-send-email-yamada.masahiro@socionext.com> <20171009150523.GT20805@n2100.armlinux.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 25 Oct 2017 14:40:48 +0900
Message-ID: <CAK7LNASCQqaBvERg6NXPym62Dyza00TuZVOWtj0YqLDKPT2D5g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix dependency of dtbs targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will.deacon@arm.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi.


2017-10-10 0:05 GMT+09:00 Russell King - ARM Linux <linux@armlinux.org.uk>:
> On Wed, Oct 04, 2017 at 01:27:20PM +0900, Masahiro Yamada wrote:
>> The target "dtbs" should depend on "scripts" because it needs to
>> build dtc.  The "prepare" target is unneeded here.
>
> Looks fine for ARM, as the only thing the dtbs should depend on is
> the kernel configuration (to decide which to build) and DT tooling.
>
> Acked-by: Russell King <rmk+kernel@armlinux.org.uk>
>
> --


I found a potential issue on this
because the default DTB install path depends on $(KERNELRELEASE).


In top-level Makefile:
export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)


The include/config/kernel.release is created by "prepare3" target.

If the dependency on "parepare" is removed,
it is possible to run "make dtbs" and "make dtbs_install"
without creating include/config/kernel.release.

So, the $(KERNELRELEASE) could be empty when installing DTB.


Maybe, drop this patch, or reduce the dependency to "parepare3"?







-- 
Best Regards
Masahiro Yamada
