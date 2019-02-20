Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f196.google.com ([209.85.166.196]:33696 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbfBTGoP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Feb 2019 01:44:15 -0500
Received: by mail-it1-f196.google.com with SMTP id g137so5372067ita.0
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 22:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20190219214940.391081-1-arnd@arndb.de> <1550614664.6911.45.camel@lca.pw>
 <CAKwvOdn+MJxYc+ykvyf-WhEzzDn0zEusjpQuksknnf8bPb=Q6g@mail.gmail.com> <CAN=P9pgC8EzawtxMzp6d3AsMPkSpTd0Ry6j+Jn+YgC_XP2Fd_w@mail.gmail.com>
In-Reply-To: <CAN=P9pgC8EzawtxMzp6d3AsMPkSpTd0Ry6j+Jn+YgC_XP2Fd_w@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 20 Feb 2019 07:44:02 +0100
Message-ID: <CACT4Y+ZxCs57qkO7n5tYU4v-J6E9MZsT_FLbXwbQ=B5btHTmwQ@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kostya Serebryany <kcc@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Qian Cai <cai@lca.pw>, Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, Andrey Konovalov <andreyknvl@google.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Evgenii Stepanov <eugenis@google.com>

On Wed, Feb 20, 2019 at 1:34 AM Kostya Serebryany <kcc@google.com> wrote:
>
> On Tue, Feb 19, 2019 at 2:43 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > + Evgenii, Kostya for KASAN
> >
> > On Tue, Feb 19, 2019 at 2:17 PM Qian Cai <cai@lca.pw> wrote:
> > >
> > > On Tue, 2019-02-19 at 22:49 +0100, Arnd Bergmann wrote:
> > > > Building an arm64 allmodconfig kernel with clang results in over 14=
0 warnings
> > > > about overly large stack frames, the worst ones being:
> > > >
> > > > drivers/gpu/drm/panel/panel-sitronix-st7789v.c:196:12: error: stack=
 frame size
> > > > of 20224 bytes in function 'st7789v_prepare'
> > > > drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:19=
6:12:
> > > > error: stack frame size of 13120 bytes in function 'td028ttec1_pane=
l_enable'
> > > > drivers/usb/host/max3421-hcd.c:1395:1: error: stack frame size of 1=
0048 bytes
> > > > in function 'max3421_spi_thread'
> > > > drivers/net/wan/slic_ds26522.c:209:12: error: stack frame size of 9=
664 bytes
> > > > in function 'slic_ds26522_probe'
> > > > drivers/crypto/ccp/ccp-ops.c:2434:5: error: stack frame size of 883=
2 bytes in
> > > > function 'ccp_run_cmd'
> > > > drivers/media/dvb-frontends/stv0367.c:1005:12: error: stack frame s=
ize of 7840
> > > > bytes in function 'stv0367ter_algo'
> > > >
> > > > None of these happen with gcc today, and almost all of these are th=
e result
> > > > of a single known bug in llvm.  Hopefully it will eventually get fi=
xed with
> > > > the
> > > > clang-9 release.
>
> I am not confident we can fix this in clang.
> The difference between gcc and clang, AFAICT, is not in the asan
> instrumentation, but in inining.
> Looking at the reproducer from https://bugs.llvm.org/show_bug.cgi?id=3D38=
809#c4,
> if I change ltv350qv_write_reg to always inline, gcc also produces a
> huge 10K stack frame,
> and making it noinline fixes the stack frame for both gcc and clang.

Does your gcc have fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D8=
1715 ?

For me gcc rejects to inline it:

gcc version 7.3.0 (Debian 7.3.0-5)

$ gcc /tmp/test.c -Wframe-larger-than=3D128 -c -fsanitize=3Dkernel-address
-O2 --param asan-stack=3D1
/tmp/test.c:23:13: warning: always_inline function might not be
inlinable [-Wattributes]
 static void ltv350qv_write_reg(void) {
             ^~~~~~~~~~~~~~~~~~
/tmp/test.c: In function =E2=80=98ltv350qv_power_on=E2=80=99:
/tmp/test.c:57:1: warning: the frame size of 416 bytes is larger than
128 bytes [-Wframe-larger-than=3D]
 }
 ^
