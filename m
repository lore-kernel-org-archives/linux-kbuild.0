Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f196.google.com ([209.85.166.196]:50586 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfBTAeC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 19:34:02 -0500
Received: by mail-it1-f196.google.com with SMTP id m137so11196675ita.0
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 16:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20190219214940.391081-1-arnd@arndb.de> <1550614664.6911.45.camel@lca.pw>
 <CAKwvOdn+MJxYc+ykvyf-WhEzzDn0zEusjpQuksknnf8bPb=Q6g@mail.gmail.com>
In-Reply-To: <CAKwvOdn+MJxYc+ykvyf-WhEzzDn0zEusjpQuksknnf8bPb=Q6g@mail.gmail.com>
From: Kostya Serebryany <kcc@google.com>
Date: Tue, 19 Feb 2019 16:33:49 -0800
Message-ID: <CAN=P9pgC8EzawtxMzp6d3AsMPkSpTd0Ry6j+Jn+YgC_XP2Fd_w@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Qian Cai <cai@lca.pw>, Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Mark Brown <broonie@kernel.org>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, Andrey Konovalov <andreyknvl@google.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Evgenii Stepanov <eugenis@google.com>

On Tue, Feb 19, 2019 at 2:43 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Evgenii, Kostya for KASAN
>
> On Tue, Feb 19, 2019 at 2:17 PM Qian Cai <cai@lca.pw> wrote:
> >
> > On Tue, 2019-02-19 at 22:49 +0100, Arnd Bergmann wrote:
> > > Building an arm64 allmodconfig kernel with clang results in over 140 warnings
> > > about overly large stack frames, the worst ones being:
> > >
> > > drivers/gpu/drm/panel/panel-sitronix-st7789v.c:196:12: error: stack frame size
> > > of 20224 bytes in function 'st7789v_prepare'
> > > drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:196:12:
> > > error: stack frame size of 13120 bytes in function 'td028ttec1_panel_enable'
> > > drivers/usb/host/max3421-hcd.c:1395:1: error: stack frame size of 10048 bytes
> > > in function 'max3421_spi_thread'
> > > drivers/net/wan/slic_ds26522.c:209:12: error: stack frame size of 9664 bytes
> > > in function 'slic_ds26522_probe'
> > > drivers/crypto/ccp/ccp-ops.c:2434:5: error: stack frame size of 8832 bytes in
> > > function 'ccp_run_cmd'
> > > drivers/media/dvb-frontends/stv0367.c:1005:12: error: stack frame size of 7840
> > > bytes in function 'stv0367ter_algo'
> > >
> > > None of these happen with gcc today, and almost all of these are the result
> > > of a single known bug in llvm.  Hopefully it will eventually get fixed with
> > > the
> > > clang-9 release.

I am not confident we can fix this in clang.
The difference between gcc and clang, AFAICT, is not in the asan
instrumentation, but in inining.
Looking at the reproducer from https://bugs.llvm.org/show_bug.cgi?id=38809#c4,
if I change ltv350qv_write_reg to always inline, gcc also produces a
huge 10K stack frame,
and making it noinline fixes the stack frame for both gcc and clang.


>
> Would it be better to disable outright if CC_IS_CLANG, then go back
> and adjust it once we know explicitly which version it lands in?
> (Maybe I'm being too pessimistic about when it may be fixed).
>
> > >
> > > In the meantime, the best idea I have is to turn off asan-stack for clang-8
> > > and earlier, so we can produce a kernel that is safe to run.
> > >
> > > I have posted three patches that address the frame overflow warnings that are
> > > not addressed by turning off asan-stack, so in combination with this change,
> > > we get much closer to a clean allmodconfig build, which in turn is necessary
> > > to do meaningful build regression testing.
> >
> > Well, I am using clang 8.0 on arm64 and running the kernel just fine for a few
> > weeks now and never trigger a single stack overflow (THREAD_SHIFT = 15) because
> > I never use any of those drivers you mentioned above. I don't think it is a good
> > idea to blankly remove the testing coverage here and affect people don't use all
> > those offensive functions at all.
>
> Thanks for the patch, Arnd!  Hopefully we can fix that up in Clang
> soon.  Qian, I guess the alternative would be to add `-mllvm
> -asan-stack=0` on potentially up to 140 Makefiles?
>
> --
> Thanks,
> ~Nick Desaulniers
