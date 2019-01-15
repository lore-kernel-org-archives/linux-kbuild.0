Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23066 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729474AbfAOPBw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jan 2019 10:01:52 -0500
MIME-Version: 1.0
References: <1547536740-1572-1-git-send-email-yamada.masahiro@socionext.com> <54f84ad6-279f-aa64-8c2c-59becd64a6ad@ozlabs.ru>
In-Reply-To: <54f84ad6-279f-aa64-8c2c-59becd64a6ad@ozlabs.ru>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 16 Jan 2019 00:01:08 +0900
Message-ID: <CAK7LNAS8xkZCK5keS9SEdNTUsVRb+_hac4yvBG=1HebrkheAqw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mark prepare0 as PHONY to fix external module build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Samuel Holland <samuel@sholland.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, "linux-stable # v4 . 20" <stable@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jan 15, 2019 at 7:45 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 15/01/2019 18:19, Masahiro Yamada wrote:
> > Commit c3ff2a5193fa ("powerpc/32: add stack protector support")
> > caused kernel panic on PowerPC if an external module is used with
> > CONFIG_STACKPROTECTOR because the 'prepare' target was not executed
> > for the external module build.
> >
> > Commit e07db28eea38 ("kbuild: fix single target build for external
> > module") turned it into a build error because the 'prepare' target is
> > now executed but the 'prepare0' target is missing for the external
> > module build.
> >
> > External module on arm/arm64 with CONFIG_STACKPROTECTOR_PER_TASK is
> > also broken in the same way.
> >
> > Move 'PHONY += prepare0' to the common place. Make is fine with missing
> > rule for phony targets.
> >
> > I minimize the change so it can be easily backported to 4.20.x
> >
> > To fix v4.20 for external modules of PowerPC, please backport
> > e07db28eea38 ("kbuild: fix single target build for external module"),
> > and then this commit.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=201891
> > Fixes: e07db28eea38 ("kbuild: fix single target build for external module")
> > Fixes: c3ff2a5193fa ("powerpc/32: add stack protector support")
> > Fixes: 189af4657186 ("ARM: smp: add support for per-task stack canaries")
> > Fixes: 0a1213fa7432 ("arm64: enable per-task stack canaries")
> > Cc: linux-stable <stable@vger.kernel.org> # v4.20
> > Reported-by: Samuel Holland <samuel@sholland.org>
> > Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
>
> Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> Thanks for fixing this! Out of curiosity - how does this work?
> arch/powerpc/Makefile's stack_protector_prepare still depends on
> prepare0 which is still defined only if KBUILD_EXTMOD=="" but somehow it
> does not bother ./Makefile? Thanks,


Missing phony targets are ignored.


I do not know if it is officially documented,
but GNU Make works like that.

Is the following test code helpful?


[Test Makefile]

prepare: prepare0
        @echo hello world

.PHONY: prepare prepare0


[Result]
$ make
hello world



-- 
Best Regards
Masahiro Yamada
