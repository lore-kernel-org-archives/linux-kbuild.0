Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35184 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgDWOmu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 10:42:50 -0400
MIME-Version: 1.0
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419202128.20571-1-natechancellor@gmail.com> <20200419202128.20571-2-natechancellor@gmail.com>
 <CA+icZUVaLW+38WEJhqnfO7B_unHvrbSr0moKnfJ6zXGGA06CWQ@mail.gmail.com> <20200421024256.GA42179@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200421024256.GA42179@ubuntu-s3-xlarge-x86>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Apr 2020 23:41:56 +0900
Message-ID: <CAK7LNAT-rcfbri48rA8yNYN6ySvRUWg=DoppvrU9eerY5ckBVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: VDSO: Move disabling the VDSO logic to Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>

On Tue, Apr 21, 2020 at 11:43 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Apr 20, 2020 at 11:53:55AM +0200, Sedat Dilek wrote:
> > On Sun, Apr 19, 2020 at 10:21 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > After commit 9553d16fa671 ("init/kconfig: Add LD_VERSION Kconfig"), we
> > > have access to GNU ld's version at configuration time. As a result, we
> > > can make it clearer under what configuration circumstances the MIPS VDSO
> > > needs to be disabled.
> > >
> > > This is a prerequisite for getting rid of the MIPS VDSO binutils
> > > warning and linking the VDSO when LD is ld.lld. Wrapping the call to
> > > ld-ifversion with CONFIG_LD_IS_LLD does not work because the config
> > > values are wiped away during 'make clean'.
> > >
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > >
> > > v1 -> v2:
> > >
> > > * New patch.
> > >
> > >  arch/mips/Kconfig         |  2 ++
> > >  arch/mips/vdso/Kconfig    | 18 ++++++++++++++++++
> > >  arch/mips/vdso/Makefile   | 30 ++----------------------------
> > >  arch/mips/vdso/vdso.lds.S |  2 +-
> > >  4 files changed, 23 insertions(+), 29 deletions(-)
> > >  create mode 100644 arch/mips/vdso/Kconfig
> > >
> > > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > > index 690718b3701a..45220e4b8a65 100644
> > > --- a/arch/mips/Kconfig
> > > +++ b/arch/mips/Kconfig
> > > @@ -3275,3 +3275,5 @@ endmenu
> > >  source "drivers/firmware/Kconfig"
> > >
> > >  source "arch/mips/kvm/Kconfig"
> > > +
> > > +source "arch/mips/vdso/Kconfig"
> > > diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
> > ...
> > > --- /dev/null
> > > +++ b/arch/mips/vdso/Kconfig
> > ...
> > > +config MIPS_DISABLE_VDSO
> > > +       def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
> > ...
> > > diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> > ...
> > > --- a/arch/mips/vdso/vdso.lds.S
> > > +++ b/arch/mips/vdso/vdso.lds.S
> > ...
> > > -#ifndef DISABLE_MIPS_VDSO
> > > +#ifndef CONFIG_DISABLE_MIPS_VDSO
> >
> > Should be s/CONFIG_DISABLE_MIPS_VDSO/CONFIG_MIPS_DISABLE_VDSO ?
> >
> > - Sedat -
>
> Ugh yes, thank you much for pointing it out.
>
> I'll send a v3 once I get further feedback on the series.


I just wondered if we could raise the minimal binutils
version from 2.23 to 2.25, but it might be too aggressive...
I do not know.

Other than what Sedat pointed out, this looks good me.

-- 
Best Regards
Masahiro Yamada
