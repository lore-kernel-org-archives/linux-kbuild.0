Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:46319 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754369AbeGHWNY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 18:13:24 -0400
MIME-Version: 1.0
In-Reply-To: <20180706004940.32587-1-labbott@redhat.com>
References: <20180706004940.32587-1-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 9 Jul 2018 07:12:37 +0900
Message-ID: <CAK7LNASo7pnL32dFqdxmKqCLkBsJwGOaTHXX=rVjpi2-Y=t0Aw@mail.gmail.com>
Subject: Re: [PATCHv6 0/4] Salted build ids via ELF notes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, Mark Wielaard <mjw@fedoraproject.org>, "H . J . Lu" <hjl.tools@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

2018-07-06 9:49 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> Hi,
>
> This is v6 of the series to allow unique build ids. v6 is mostly minor
> fixups and Acks for this to go through the kbuild tree.


Applied to linux-kbuild. Thanks!


> Thanks,
> Laura
>
> Laura Abbott (4):
>   kbuild: Add build salt to the kernel and modules
>   x86: Add build salt to the vDSO
>   powerpc: Add build salt to the vDSO
>   arm64: Add build salt to the vDSO
>
>  arch/arm64/kernel/vdso/note.S     |  3 +++
>  arch/powerpc/kernel/vdso32/note.S |  3 +++
>  arch/x86/entry/vdso/vdso-note.S   |  3 +++
>  arch/x86/entry/vdso/vdso32/note.S |  3 +++
>  include/linux/build-salt.h        | 20 ++++++++++++++++++++
>  init/Kconfig                      |  9 +++++++++
>  init/version.c                    |  3 +++
>  scripts/mod/modpost.c             |  3 +++
>  8 files changed, 47 insertions(+)
>  create mode 100644 include/linux/build-salt.h
>
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
