Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33379 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfBTOvd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Feb 2019 09:51:33 -0500
MIME-Version: 1.0
References: <20190219214940.391081-1-arnd@arndb.de> <CAAeHK+xSpsu0tNmeq0wKXfT=0HuORnvU+XzLswDzhbtfZVa4Hw@mail.gmail.com>
In-Reply-To: <CAAeHK+xSpsu0tNmeq0wKXfT=0HuORnvU+XzLswDzhbtfZVa4Hw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Feb 2019 15:51:14 +0100
Message-ID: <CAK8P3a1NfHohd1xT7iHK85L2PGnD95RJvwFi-2cWrFpipQzqwg@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>

On Wed, Feb 20, 2019 at 3:45 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Tue, Feb 19, 2019 at 10:49 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > Building an arm64 allmodconfig kernel with clang results in over 140 warnings
> > about overly large stack frames, the worst ones being:
> >
> > drivers/gpu/drm/panel/panel-sitronix-st7789v.c:196:12: error: stack frame size of 20224 bytes in function 'st7789v_prepare'
> > drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:196:12: error: stack frame size of 13120 bytes in function 'td028ttec1_panel_enable'
> > drivers/usb/host/max3421-hcd.c:1395:1: error: stack frame size of 10048 bytes in function 'max3421_spi_thread'
> > drivers/net/wan/slic_ds26522.c:209:12: error: stack frame size of 9664 bytes in function 'slic_ds26522_probe'
> > drivers/crypto/ccp/ccp-ops.c:2434:5: error: stack frame size of 8832 bytes in function 'ccp_run_cmd'
> > drivers/media/dvb-frontends/stv0367.c:1005:12: error: stack frame size of 7840 bytes in function 'stv0367ter_algo'
> >
> > None of these happen with gcc today, and almost all of these are the result
> > of a single known bug in llvm.  Hopefully it will eventually get fixed with the
> > clang-9 release.
> >
> > In the meantime, the best idea I have is to turn off asan-stack for clang-8
> > and earlier, so we can produce a kernel that is safe to run.
>
> Hi Arnd,
>
> I don't think it's good to disable KASAN stack instrumentation for the
> whole kernel by default with clang. It makes more sense to disable
> stack instrumentation only for these few drivers.

Do you mean just the 114 files that we get warnings for in allmodconfig,
or also those that run into the same bug but stay below the warning limit,
and the ones that don't warn in allmodconfig but do warn in other
configurations?

I would have to some more research, but I expect several hundred
patches before we get to a clean randconfig build with a broken
compiler.

     Arnd
