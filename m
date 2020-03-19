Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42387 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgCSPtO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Mar 2020 11:49:14 -0400
MIME-Version: 1.0
References: <20200311223725.27662-2-masahiroy@kernel.org> <202003121230.lys3M8E8%lkp@intel.com>
 <CAK7LNARwR5X2C_VzK_3RZo+30Cu3uPuiw-rFUut1j8azLhbxAA@mail.gmail.com> <20200312083943.GA7278@alpha.franken.de>
In-Reply-To: <20200312083943.GA7278@alpha.franken.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Mar 2020 00:48:20 +0900
Message-ID: <CAK7LNAT8AVh8PawDsUoStjYMsOq-DLJbW30SpX7hDDJHZNCd9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: link lib-y objects to vmlinux forcibly
 when CONFIG_MODULES=y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>, kbuild-all@lists.01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "sparclinux@vger.kernel.org, David S . Miller" <davem@davemloft.net>, clang-built-linux <clang-built-linux@googlegroups.com>, Al Viro <viro@zeniv.linux.org.uk>, Nick Desaulniers <ndesaulniers@google.com>, Ilie Halip <ilie.halip@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, kbuild test robot <lkp@intel.com>

Hi Thomas,

On Thu, Mar 12, 2020 at 5:40 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Mar 12, 2020 at 03:12:28PM +0900, Masahiro Yamada wrote:
> > I got the following report from 0-day bot.
> > Please advise me how to fix it.
> >
> >
> > I am not sure how multi-platform works in MIPS.
> >
> > The cavium-octeon platform has its own implementation
> > of various functions.
> >
> > So, vmlinux links different library routines
> > depending on whether CONFIG_CAVIUM_OCTEON_SOC, correct?
>
> for cavium memcpy is directly linked in via octeon-memcpy.o, while for
> every other platform it's coming from lib/lib.a(memcpy.o).
>
> What have you changed, that this doesn't work anymore ?
>
> Thomas.


I want to change all objects from lib-y
to be linked to vmlinux (exactly like obj-y )
if CONFIG_MODULES is enabled.

https://patchwork.kernel.org/patch/11432969/


EXPORT_SYMBOL in libraries
must be linked to vmlinux all the time,
even if there is no call-site in vmlinux.
I believe this is a good simplification because
EXPORT_SYMBOL is interface to loadable modules.

As it turned out, lib-y is (ab)used to avoid
multiple definition errors.

The 0-day detected a bug of 32-bit sparc:
https://patchwork.kernel.org/patch/11432969/

And, another is this one.

MIPS relies on that
arch/mips/lib/lib.a is weaker than octeon ones.

So, annotating __weak is a good solution
(thanks Nick!).

If I send a patch, is it acceptable?


-- 
Best Regards
Masahiro Yamada
