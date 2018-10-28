Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46007 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbeJ2BkK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 21:40:10 -0400
MIME-Version: 1.0
References: <20181017000809.GA21292@WindFlash> <20181017081115.GA22535@zn.tnic>
 <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
 <20181017083126.GB22535@zn.tnic> <CADvQ+rFa=XEuxLb=yPmtJE2QepBNjCVzjEY5urVzCaSF1tJBYw@mail.gmail.com>
 <20181018091606.GA20831@zn.tnic> <CAK7LNAQq7aE_2QYwqei7M9fg8Yen7-ucjz-t2E_hq2xkznKsQw@mail.gmail.com>
 <7b87404e2a0347968013e024e52e4cb2@AcuMS.aculab.com>
In-Reply-To: <7b87404e2a0347968013e024e52e4cb2@AcuMS.aculab.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Oct 2018 01:54:12 +0900
Message-ID: <CAK7LNAS=wj9CW+qN4=yCgLuvsJUbyo-5Wq08BnuCkDH4Y82FwA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David.Laight@aculab.com
Cc: Borislav Petkov <bp@alien8.de>, =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Oct 19, 2018 at 8:28 PM David Laight <David.Laight@aculab.com> wrot=
e:
>
> From: Masahiro Yamada
> > Sent: 18 October 2018 17:39
> >
> > On Thu, Oct 18, 2018 at 6:18 PM Borislav Petkov <bp@alien8.de> wrote:
> > >
> > > On Wed, Oct 17, 2018 at 09:40:53PM -0300, Leonardo Bras wrote:
> > > > The idea was to put it as default and fix all the shadowing warning=
s.
> > > > What do you think?  I am open to suggestions.
> > >
> > > That's Masahiro's call. In the rest of the kernel, those warnings are=
 behind
> > > the W=3D2 switch - i.e., not enabled by default.
> >
> >
> > It is not realistic to enable this warning option by default.
> > Even -Wshadow=3Dlocal emits tons of warnings.
> > (More with -Wshadow)
>
> The question is, how many of them are actual bugs.
> IMHO -Wshadow is a good idea.
>
> > The problem of this flag is,
> > it is false positive in macro expansions.
>
> Right, but macro expansions inside macro definitions could accidentally
> use the same local variable - leading to choas.


I do not think so.

The macro definitions are surrounded by { ... }
so that local variables are properly separated from
the outside world.




> > For example, I think the following is a legitimate case.
> ...
> > arch/arm64/kernel/fpsimd.c:713:2: note: in expansion of macro =E2=80=98=
write_sysreg=E2=80=99
> >   write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1)=
;
> >   ^~~~~~~~~~~~
>
> Easily fixed by using different named temporaries in the two macros.
> There probably aren't that many macro pairs where that happens.
> Especially since many are now inlined functions.

But, theoretically, any arbitrary macros could be used in pairs.

This means a new constraint where a local variable name must be unique,
it means 'local variable' is not literally 'local'.


I'd like to use short names such as 'x', 'tmp', etc. for local variables.



> It might be that a small number of changes get rid of most of the warning=
s.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)


--
Best Regards
Masahiro Yamada
