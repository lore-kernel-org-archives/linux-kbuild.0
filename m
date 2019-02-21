Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41506 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfBUJVj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Feb 2019 04:21:39 -0500
MIME-Version: 1.0
References: <1550722418-9189-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550722418-9189-1-git-send-email-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Feb 2019 10:21:20 +0100
Message-ID: <CAK8P3a2V+AYbXZC6zG6iJzOM3HugcB3Odx74jzVzSK4mfQ1Ftw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: compute false-positive -Wmaybe-uninitialized
 cases in Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@redhat.com>

On Thu, Feb 21, 2019 at 5:14 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Since -Wmaybe-uninitialized was introduced by GCC 4.7, we have patched
> various false positives:
>
>  - commit e74fc973b6e5 ("Turn off -Wmaybe-uninitialized when building
>    with -Os") turned off this option for -Os.
>
>  - commit 815eb71e7149 ("Kbuild: disable 'maybe-uninitialized' warning
>    for CONFIG_PROFILE_ALL_BRANCHES") turned off this option for
>    CONFIG_PROFILE_ALL_BRANCHES
>
>  - commit a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized warning
>    for "make W=1"") turned off this option for GCC < 4.9
>    Arnd provided more explanation in https://lkml.org/lkml/2017/3/14/903
>
> I think this looks better by shifting the logic from Makefile to Kconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I like how this cleans up the logic and documents it better.
I've had my own plans to move this (and most other conditional warning
options) into a header file using the KBUILD_WARN() infrastructure, but
never got around to doing that. I still think that's what we want eventually,
but in the meantime your patch seems fine as well.

Also, I see that your patch keeps the existing logic, which is good,
but we may want to refine this a little afterwards:

- we may want to turn off -Wuninitialized for gcc-4.6 and gcc-4.7
  instead of turning off -Wmaybe-uninitialized as we do in the later
  compilers.

- the proposed CC_OPTIMIZE_FOR_DEBUGGING may need the
  same workaround as CC_OPTIMZE_FOR_SIZE.

- For clang, we may want to /not/ turn off -Wmaybe-uninitialized
  in all cases. I haven't tried build with with 'clang -Oz
  -Wmaybe-uninitialized', but if the number of false positives is small
  enough, we could decide to just leave that on.

      Arnd
