Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:42431 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbeJGFMR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Oct 2018 01:12:17 -0400
MIME-Version: 1.0
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
 <20181005083313.2088252-1-arnd@arndb.de> <CANiq72mHDxe9-+pFf+dDuYXRz5YeyRYi6RW65tyo9-ENNngsCw@mail.gmail.com>
 <CAK7LNAT5h+Rku7DbD+kHGv7Kgk8FfuX4wwL_pwNOLSJbqw99MA@mail.gmail.com>
In-Reply-To: <CAK7LNAT5h+Rku7DbD+kHGv7Kgk8FfuX4wwL_pwNOLSJbqw99MA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 7 Oct 2018 07:06:26 +0900
Message-ID: <CAK7LNATycNLxzB=FtrBy9M4E6m9wx4Uhk=DQ7gcCMD2J_vfmfQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kieran.bingham+renesas@ideasonboard.com, stable <stable@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, Oct 7, 2018 at 6:58 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Miguel,
>
>
> On Sun, Oct 7, 2018 at 6:18 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Fri, Oct 5, 2018 at 10:35 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > Building any configuration with 'make W=3D1' produces a warning:
> > >
> > > kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmis=
sing-prototypes]
> > >
> > > When also passing -Werror, this prevents us from building any
> > > other files. Nobody ever calls the function, but we can't make
> > > it 'static' either since we want the compiler output.
> > >
> > > Calling it 'main' instead however avoids the warning, because gcc
> > > does not insist on having a declaration for main.
> >
> > I think marking the function as static __used should do the trick and
> > would be less confusing.
>
>
>
>
> I tried __used, but I still see the warning.
>
>
> masahiro@grover:~/ref/linux$ git diff
> diff --git a/kernel/bounds.c b/kernel/bounds.c
> index c373e88..aee0101 100644
> --- a/kernel/bounds.c
> +++ b/kernel/bounds.c
> @@ -13,7 +13,7 @@
>  #include <linux/log2.h>
>  #include <linux/spinlock_types.h>
>
> -void foo(void)
> +void __used foo(void)
>  {
>         /* The enum constants to put into include/generated/bounds.h */
>         DEFINE(NR_PAGEFLAGS, __NR_PAGEFLAGS);
> masahiro@grover:~/ref/linux$ make W=3D1  prepare
>   CC      kernel/bounds.s
> kernel/bounds.c:16:13: warning: no previous prototype for =E2=80=98foo=E2=
=80=99
> [-Wmissing-prototypes]
>  void __used foo(void)
>              ^
>   CC      arch/x86/kernel/asm-offsets.s



Sorry, I forgot to add 'static'.

Adding both static and __used worked for me,
and I like the idea.



--=20
Best Regards
Masahiro Yamada
