Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:17469 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfAREPI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 23:15:08 -0500
MIME-Version: 1.0
References: <20190114135144.26096-1-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 18 Jan 2019 13:14:14 +0900
Message-ID: <CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] selftests: Miscellaneous fixes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Shuah Khan <shuah@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On Mon, Jan 14, 2019 at 10:52 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series contains several build fixes and cleanups for issues I
> encountered when trying to cross-build an rtctest binary in a separate
> output directory (like I use for all my kernel builds).

Geert,
Thanks for working on this!


My fundamental question is,
why did tools/ opt out Kbuild?

I think lots of mess comes in
in order to support
  cd tools/gpio; make

instead of

  make tools/gpio/


Lots of files are duplicated in tools/build/
in order to invent a different build system for tools/


Similar, but not exactly the same files. For example,

diff -u scripts/basic/fixdep.c tools/build/fixdep.c




> Most patches are independent. Exceptions are:
>   - Patch 3 depends on patch 2,
>   - Patch 7 depends on patch 6,
>   - Patch 11 depends on patches 2 and 3,
>
> This has been tested with native (amd64):
>   - make kselftest-build
>   - make -C tools/testing/selftests
>   - make O=/tmp/kselftest kselftest-build
>   - make O=/tmp/kselftest -C tools/testing/selftests
> and cross-builds (arm):
>   - make kselftest-build (from a separate output directory).
>
> Known remaining issues (not introduced by this patch series):
>   - tools/lib/bpf fails to build in some cases (cfr.
>     https://lore.kernel.org/lkml/CAMuHMdXRN=mSKTjZNBSxQi-pkgSrKqeANxD-GB+hqC8pDjx7nQ@mail.gmail.com/),
>   - tools/gpio is not always built correctly,
>   - When building in a separate output directory, there are still files
>     created in the source directory under:
>         - arch/x86/include/generated/,
>         - arch/x86/tools/,
>         - include/generated/uapi/linux,
>         - scripts (fixdep and unifdef),
>   - Some tests may fail to find the installed header files,
>   - There may be^H^H^H^H^H^Hare more.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (12):
>   selftests: gpio-mockup-chardev: Check asprintf() for error
>   selftests: Fix output directory with O=
>   selftests: Fix header install directory with O=
>   selftests: android: ion: Fix ionmap_test dependencies
>   selftests: seccomp: Fix test dependencies and rules
>   selftests: lib.mk: Add rule to build object file from C source file
>   selftests: memfd: Fix build with O=
>   selftests: timestamping: Remove superfluous rules
>   selftests: sparc64: Remove superfluous rules
>   selftests: intel_pstate: Remove unused header dependency rule
>   selftests: Add kselftest-build target
>   [RFC] selftests: gpio: Fix building tools/gpio from kselftests
>
>  Documentation/dev-tools/kselftest.rst             |  4 ++++
>  Makefile                                          |  9 +++++++--
>  tools/testing/selftests/android/ion/Makefile      |  6 +-----
>  tools/testing/selftests/gpio/Makefile             | 12 +++++++-----
>  .../testing/selftests/gpio/gpio-mockup-chardev.c  |  9 ++++++---
>  tools/testing/selftests/intel_pstate/Makefile     |  2 --
>  tools/testing/selftests/lib.mk                    |  4 ++++
>  tools/testing/selftests/memfd/Makefile            |  8 +++-----
>  .../selftests/networking/timestamping/Makefile    |  5 -----
>  tools/testing/selftests/seccomp/Makefile          | 15 +++------------
>  tools/testing/selftests/sparc64/drivers/Makefile  |  4 ----
>  11 files changed, 35 insertions(+), 43 deletions(-)
>
> --
> 2.17.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds



-- 
Best Regards
Masahiro Yamada
