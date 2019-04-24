Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:40719 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727568AbfDXKKK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Apr 2019 06:10:10 -0400
MIME-Version: 1.0
References: <1555669773-9766-1-git-send-email-alex.popov@linux.com>
In-Reply-To: <1555669773-9766-1-git-send-email-alex.popov@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 24 Apr 2019 19:09:26 +0900
Message-ID: <CAK7LNAQP8ys181hL9EtGVoQppn_-aLn+Ufineebf396rDn-Ezw@mail.gmail.com>
Subject: Re: [PATCH 1/1] kconfig: Terminate menu blocks with a newline in the
 generated config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Apr 20, 2019 at 4:12 AM Alexander Popov <alex.popov@linux.com> wrote:
>
> Currently menu blocks start with a pretty header but end with nothing in
> the generated config. So next config options stick together with the
> options from the menu block.
>
> Let's terminate menu blocks with a newline in the generated config.
>
> Signed-off-by: Alexander Popov <alex.popov@linux.com>


The .config file is a flat list of CONFIG options.
It does not represent menu structures at all.

I tested "make allyesconfig"
and the resulted outcome looks cheesy.



[1] Two blank lines in a row


---------->8-----------------
CONFIG_EFI_EARLYCON=y
CONFIG_IMX_SCU=y
CONFIG_IMX_SCU_PD=y

#
# Tegra firmware driver
#


CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
--------->8------------------------


[2] Some blank lines appended at the end of file

----------->8-------------
CONFIG_CPA_DEBUG=y
CONFIG_OPTIMIZE_INLINING=y
CONFIG_DEBUG_ENTRY=y
CONFIG_DEBUG_NMI_SELFTEST=y
CONFIG_X86_DEBUG_FPU=y
CONFIG_PUNIT_ATOM_DEBUG=y
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set


---------->8-----------------



The readability of the .config could be improved somehow,
but this patch is not the right one.



-- 
Best Regards
Masahiro Yamada
