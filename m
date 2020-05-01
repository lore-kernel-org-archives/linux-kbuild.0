Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26606 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFn2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:43:28 -0400
MIME-Version: 1.0
References: <20200427003019.2401592-1-masahiroy@kernel.org> <20200427080600.GC11787@willie-the-truck>
In-Reply-To: <20200427080600.GC11787@willie-the-truck>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 14:42:36 +0900
Message-ID: <CAK7LNAT-O6C0WO3d0bx+sWCzJF5YmOVcnPYMFMX0wTz6y+C0pA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unused AS assignment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, Nathan Huckleberry <nhuck15@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 27, 2020 at 5:06 PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Apr 27, 2020 at 09:30:19AM +0900, Masahiro Yamada wrote:
> > $(AS) is not used anywhere, hence commit aa824e0c962b ("kbuild: remove
> > AS variable") killed it.
> >
> > Remove the left-over code in arch/{arm,arm64}/Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/arm/Makefile   | 2 --
> >  arch/arm64/Makefile | 2 --
> >  2 files changed, 4 deletions(-)
>
> Acked-by: Will Deacon <will@kernel.org>
>
> (If you post the arm64 part as a separate patch, I can pick it up)


This is just a trivial cleanup patch.
So, I do not split it per-arch.


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
