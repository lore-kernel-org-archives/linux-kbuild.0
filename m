Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f170.google.com ([209.85.208.170]:41071 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbeL2VBK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Dec 2018 16:01:10 -0500
Received: by mail-lj1-f170.google.com with SMTP id k15-v6so21236683ljc.8
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Dec 2018 13:01:07 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id f20-v6sm9235078ljk.33.2018.12.29.13.01.05
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Dec 2018 13:01:05 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id p86so16464782lfg.5
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Dec 2018 13:01:05 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNARQggM3aKEPRKJqa4tunFAfmfErMZuS-rrnRv6UB1VpPQ@mail.gmail.com>
In-Reply-To: <CAK7LNARQggM3aKEPRKJqa4tunFAfmfErMZuS-rrnRv6UB1VpPQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 29 Dec 2018 13:00:48 -0800
Message-ID: <CAHk-=wiLt3rgeyM3BWAd5VJrKcnxxuHybwoQiDGMgyspo6oXDg@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] Kbuild updates for v4.21 part2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Fri, Dec 28, 2018 at 8:00 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Introduce a new option CONFIG_NO_AUTO_INLINE as well. With this option,
> only functions explicitly marked with "inline" will be inlined. This
> will allow the function tracer to trace more functions.

Ugh. This causes new and bogus warnings, because gcc doesn't see some
of the checks.

For example, the x86 emulate_vsyscall() function now warns that

    warning: =E2=80=98syscall_nr=E2=80=99 may be used uninitialized in this=
 function

because addr_to_vsyscall_nr() isn't inlined any more, so gcc doesn't
see that the return value is always smaller than three (and then it
doesn't see that we handle all the cases in the switch statement
later).

So honestly, these "debugging improvements" have a rather nasty side
effect. I'm not at all convinced that we should do this.  It is *not*
worth causing extra development pain with a totally pointless option
that changes code generation radically like this. It's going to cause
lots of extra churn.

This branch already added a couple of extra inline markers just to
make code work reasonably. How many tens (or hundreds) got missed just
because the build still works, but the lack of inlining means that we
generate completely garbage code?

I'm going to skip this pull request.

We have basically always required a certain level of competence from
the compiler, and this basically says that the compiler can do stupid
things and we'd have to fix those stupidities by hand.

             Linus
