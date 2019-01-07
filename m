Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:47223 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfAGEdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Jan 2019 23:33:51 -0500
MIME-Version: 1.0
References: <CAK7LNARQggM3aKEPRKJqa4tunFAfmfErMZuS-rrnRv6UB1VpPQ@mail.gmail.com>
 <CAHk-=wiLt3rgeyM3BWAd5VJrKcnxxuHybwoQiDGMgyspo6oXDg@mail.gmail.com>
In-Reply-To: <CAHk-=wiLt3rgeyM3BWAd5VJrKcnxxuHybwoQiDGMgyspo6oXDg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 7 Jan 2019 13:32:56 +0900
Message-ID: <CAK7LNASpO86yNe4BWBYnfd+r82=d_ofxYybLi_aM+4+dgf46+A@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] Kbuild updates for v4.21 part2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, Arnd Bergmann <arnd@arndb.de>

(+CC Changbin Du, Arnd Bergmann)



On Sun, Dec 30, 2018 at 6:01 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Dec 28, 2018 at 8:00 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Introduce a new option CONFIG_NO_AUTO_INLINE as well. With this option,
> > only functions explicitly marked with "inline" will be inlined. This
> > will allow the function tracer to trace more functions.
>
> Ugh. This causes new and bogus warnings, because gcc doesn't see some
> of the checks.
>
> For example, the x86 emulate_vsyscall() function now warns that
>
>     warning: =E2=80=98syscall_nr=E2=80=99 may be used uninitialized in th=
is function
>
> because addr_to_vsyscall_nr() isn't inlined any more, so gcc doesn't
> see that the return value is always smaller than three (and then it
> doesn't see that we handle all the cases in the switch statement
> later).
>
> So honestly, these "debugging improvements" have a rather nasty side
> effect. I'm not at all convinced that we should do this.  It is *not*
> worth causing extra development pain with a totally pointless option
> that changes code generation radically like this. It's going to cause
> lots of extra churn.



Sorry for late reply.

I know this series was rejected,
but I felt guilty about being completely silent.

So, here is just my two cents.


For addr_to_vsyscall_nr(), we can fix it by marking it as 'inline'
(or __always_inline).


IMHO, it is not so bad to tell the compiler what we want.

In most cases, it is just a matter of 'inline' marker,
although I admit this process is kind of painful...



> This branch already added a couple of extra inline markers just to
> make code work reasonably. How many tens (or hundreds) got missed just
> because the build still works, but the lack of inlining means that we
> generate completely garbage code?


I do not have the exact number, but
my impression was "not so many".

Changbin and Arnd might have better insight.
They were trying to eliminate potential problems beforehand.

For example,
7e17916b
412dd15c
08813e0e




> I'm going to skip this pull request.
>
> We have basically always required a certain level of competence from
> the compiler, and this basically says that the compiler can do stupid
> things and we'd have to fix those stupidities by hand.
>
>              Linus



--=20
Best Regards
Masahiro Yamada
