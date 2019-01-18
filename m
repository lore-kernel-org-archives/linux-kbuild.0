Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43603 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfARCvH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 21:51:07 -0500
MIME-Version: 1.0
References: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 18 Jan 2019 11:50:04 +0900
Message-ID: <CAK7LNATkYYaZ68dmYACfadp+sPVbxWJ3r2KdX-7wJdzaCsKD+A@mail.gmail.com>
Subject: Re: [PATCH 0/3] powerpc: some header search path cleanups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Michael,


On Fri, Jan 11, 2019 at 2:20 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I am trying to get rid of crappy magic from Kbuild core makefiles.
>
> Before that, I want to drop as many useless paths as possible.
> Actually, many Makefiles are adding around pointless options.
>
> This series cleans some powerpc Makefiles.
> (only compile-tested by 0day bot)


Could you apply this series to ppc tree if you are fine with it?





> Masahiro Yamada (3):
>   KVM: powerpc: remove -I. header search paths
>   powerpc: remove redundant header search path additions
>   powerpc: math-emu: remove unneeded header search paths
>
>  arch/powerpc/Makefile          | 4 ++--
>  arch/powerpc/kvm/Makefile      | 5 -----
>  arch/powerpc/math-emu/Makefile | 2 +-
>  3 files changed, 3 insertions(+), 8 deletions(-)
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
