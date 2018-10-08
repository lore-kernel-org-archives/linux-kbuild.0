Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17761 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbeJHVpG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Oct 2018 17:45:06 -0400
MIME-Version: 1.0
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
 <20181005083313.2088252-1-arnd@arndb.de> <CANiq72mHDxe9-+pFf+dDuYXRz5YeyRYi6RW65tyo9-ENNngsCw@mail.gmail.com>
 <CAK7LNAT5h+Rku7DbD+kHGv7Kgk8FfuX4wwL_pwNOLSJbqw99MA@mail.gmail.com>
 <CAK7LNATycNLxzB=FtrBy9M4E6m9wx4Uhk=DQ7gcCMD2J_vfmfQ@mail.gmail.com> <5cbb504c-0506-cec8-d51b-00928cdb27fe@ideasonboard.com>
In-Reply-To: <5cbb504c-0506-cec8-d51b-00928cdb27fe@ideasonboard.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 8 Oct 2018 23:32:06 +0900
Message-ID: <CAK7LNAQNhMhoCXSRDQVrNkTLUyLO0_xYJm1o_dyao0-rSbpwzA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kieran.bingham+renesas@ideasonboard.com
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, stable <stable@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Oct 8, 2018 at 7:01 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> On 06/10/18 23:06, Masahiro Yamada wrote:
> > On Sun, Oct 7, 2018 at 6:58 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >>
> >> Hi Miguel,
> >>
> >>
> >> On Sun, Oct 7, 2018 at 6:18 AM Miguel Ojeda
> >> <miguel.ojeda.sandonis@gmail.com> wrote:
> >>>
> >>> On Fri, Oct 5, 2018 at 10:35 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>
> >>>> Building any configuration with 'make W=3D1' produces a warning:
> >>>>
> >>>> kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmi=
ssing-prototypes]
> >>>>
> >>>> When also passing -Werror, this prevents us from building any
> >>>> other files. Nobody ever calls the function, but we can't make
> >>>> it 'static' either since we want the compiler output.
> >>>>
> >>>> Calling it 'main' instead however avoids the warning, because gcc
> >>>> does not insist on having a declaration for main.
> >>>
> >>> I think marking the function as static __used should do the trick and
> >>> would be less confusing.
> >>
> >>
> >>
> >>
> >> I tried __used, but I still see the warning.
> >>
> >>
> >> masahiro@grover:~/ref/linux$ git diff
> >> diff --git a/kernel/bounds.c b/kernel/bounds.c
> >> index c373e88..aee0101 100644
> >> --- a/kernel/bounds.c
> >> +++ b/kernel/bounds.c
> >> @@ -13,7 +13,7 @@
> >>  #include <linux/log2.h>
> >>  #include <linux/spinlock_types.h>
> >>
> >> -void foo(void)
> >> +void __used foo(void)
> >>  {
> >>         /* The enum constants to put into include/generated/bounds.h *=
/
> >>         DEFINE(NR_PAGEFLAGS, __NR_PAGEFLAGS);
> >> masahiro@grover:~/ref/linux$ make W=3D1  prepare
> >>   CC      kernel/bounds.s
> >> kernel/bounds.c:16:13: warning: no previous prototype for =E2=80=98foo=
=E2=80=99
> >> [-Wmissing-prototypes]
> >>  void __used foo(void)
> >>              ^
> >>   CC      arch/x86/kernel/asm-offsets.s
> >
> >
> >
> > Sorry, I forgot to add 'static'.
> >
> > Adding both static and __used worked for me,
> > and I like the idea.
> >
>
> Aha - I'd also tried converting to static in my earlier attempts, but
> didn't realise we had __used!
>
> updating as "static __used" causes the following diff:
>
> diff -Nurp bounds.s.foo bounds.s.static-used
> --- bounds.s.foo        2018-10-05 10:20:53.269941404 +0100
> +++ bounds.s.static-used        2018-10-08 10:51:18.079309049 +0100
> @@ -110,7 +110,6 @@
>  #NO_APP
>         .align  2
>         .p2align 3,,7
> -       .global foo
>         .type   foo, %function
>  foo:
>         stp     x29, x30, [sp, -16]!    //,,,
>
>
> I'd say this is a pretty good alternative fix - however I see Arnd's
> version is already on it's way though akpm's tree...
>
> https://ozlabs.org/~akpm/mmots/broken-out/kbuild-fix-kernel-boundsc-w%3D1=
-warning.patch
>
> Anyway, as long as one of the variants gets there I'll be happy :)


I will leave it to Arnd.


When we fix arch/{mips,sparc}/kernel/asm-offsets.c,
'static __used' is just additions.

The 'main(void)' solution would require a little bit restructuring.



FWIW, with my quick analysis, the following should be fixed as well:

arch/alpha/kernel/asm-offsets.c
arch/c6x/kernel/asm-offsets.c
arch/ia64/kernel/asm-offsets.c
arch/ia64/kernel/nr-irqs.c
arch/mips/kernel/asm-offsets.c
arch/riscv/kernel/asm-offsets.c
arch/sparc/kernel/asm-offsets.c
arch/x86/kernel/asm-offsets.c
arch/x86/um/shared/sysdep/kernel-offsets.h
samples/bpf/syscall_nrs.c






--=20
Best Regards
Masahiro Yamada
