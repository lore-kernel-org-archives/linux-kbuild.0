Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43235 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfBTRgF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Feb 2019 12:36:05 -0500
MIME-Version: 1.0
References: <20190219214940.391081-1-arnd@arndb.de> <CAAeHK+xSpsu0tNmeq0wKXfT=0HuORnvU+XzLswDzhbtfZVa4Hw@mail.gmail.com>
 <CAK8P3a1NfHohd1xT7iHK85L2PGnD95RJvwFi-2cWrFpipQzqwg@mail.gmail.com> <b109ad0d-6995-8ca2-5426-7e2627d2032c@virtuozzo.com>
In-Reply-To: <b109ad0d-6995-8ca2-5426-7e2627d2032c@virtuozzo.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Feb 2019 18:35:46 +0100
Message-ID: <CAK8P3a0tg1WRLK=fs9S+X4TPB7sR55ZsjMbBVX07AtAfguXCsw@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>

On Wed, Feb 20, 2019 at 6:00 PM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
> On 2/20/19 5:51 PM, Arnd Bergmann wrote:
> > On Wed, Feb 20, 2019 at 3:45 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > I would have to some more research, but I expect several hundred
> > patches before we get to a clean randconfig build with a broken
> > compiler.
>
> Manually maintaining asan-stack parameter for the sake of one broken compiler isn't a great idea either.
>
> Couple alternative suggestions:
>
> 1) If we can't fix the problem or the cost of fixing is too high, maybe just hide it? Disable -Wframe-larger-then on pre clang-9 compilers.
>
> 2) Fallback cflags. The idea is to try to compile every the file with "-mllvm -asan-stack=1 -Wframe-larger-than=2048 -Werror" at first,
>  and fallback to "-mllvm -asan-stack=0" if failed. So it would be something similar to $(call cc-option, -mllvm -asan-stack=1 -Wframe-larger-than=2048 -Werror, -mllvm -asan-stack=0)
>  except that "cc-option" tries options only once on some code example while  we need to try options on every file that we actually compile.
>  Honestly, I'm not sure that it's worthy to hack Kbuild engine for that particular use-case.

My original plan was to put this under CONFIG_KASAN_EXTRA to allow you
to still enable it in older compilers, but you just removed that option ;-)

Maybe bringing it back would be a compromise? That way it's hidden from
all the build testing bots (because of the !CONFIG_COMPILE_TEST dependency),
but anyone who really wants it can still have the option, and set
CONFIG_FRAME_WARN
to whichever value they like.

     Arnd
