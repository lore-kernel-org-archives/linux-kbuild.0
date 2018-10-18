Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62240 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbeJSAlv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 20:41:51 -0400
MIME-Version: 1.0
References: <20181017000809.GA21292@WindFlash> <20181017081115.GA22535@zn.tnic>
 <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
 <20181017083126.GB22535@zn.tnic> <CADvQ+rFa=XEuxLb=yPmtJE2QepBNjCVzjEY5urVzCaSF1tJBYw@mail.gmail.com>
 <20181018091606.GA20831@zn.tnic>
In-Reply-To: <20181018091606.GA20831@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 19 Oct 2018 01:39:21 +0900
Message-ID: <CAK7LNAQq7aE_2QYwqei7M9fg8Yen7-ucjz-t2E_hq2xkznKsQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Oct 18, 2018 at 6:18 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, Oct 17, 2018 at 09:40:53PM -0300, Leonardo Bras wrote:
> > The idea was to put it as default and fix all the shadowing warnings.
> > What do you think?  I am open to suggestions.
>
> That's Masahiro's call. In the rest of the kernel, those warnings are beh=
ind
> the W=3D2 switch - i.e., not enabled by default.


It is not realistic to enable this warning option by default.
Even -Wshadow=3Dlocal emits tons of warnings.
(More with -Wshadow)

The problem of this flag is,
it is false positive in macro expansions.


For example, I think the following is a legitimate case.



In file included from ./arch/arm64/include/asm/cputype.h:126:0,
                 from ./arch/arm64/include/asm/cache.h:19,
                 from ./include/linux/cache.h:6,
                 from ./include/linux/printk.h:9,
                 from ./include/linux/kernel.h:14,
                 from ./include/linux/bitmap.h:10,
                 from arch/arm64/kernel/fpsimd.c:20:
arch/arm64/kernel/fpsimd.c: In function =E2=80=98sve_kernel_enable=E2=80=99=
:
./arch/arm64/include/asm/sysreg.h:707:6: warning: declaration of
=E2=80=98__val=E2=80=99 shadows a previous local [-Wshadow=3Dcompatible-loc=
al]
  u64 __val;      \
      ^
./arch/arm64/include/asm/sysreg.h:717:20: note: in definition of macro
=E2=80=98write_sysreg=E2=80=99
  u64 __val =3D (u64)(v);     \
                    ^
arch/arm64/kernel/fpsimd.c:713:15: note: in expansion of macro =E2=80=98rea=
d_sysreg=E2=80=99
  write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1);
               ^~~~~~~~~~~
./arch/arm64/include/asm/sysreg.h:717:6: note: shadowed declaration is here
  u64 __val =3D (u64)(v);     \
      ^
arch/arm64/kernel/fpsimd.c:713:2: note: in expansion of macro =E2=80=98writ=
e_sysreg=E2=80=99
  write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1);
  ^~~~~~~~~~~~




--
Best Regards
Masahiro Yamada
