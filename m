Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-02.nifty.com ([202.248.20.67]:57118 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfDIGEX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Apr 2019 02:04:23 -0400
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-02.nifty.com with ESMTP id x395ouCY013145
        for <linux-kbuild@vger.kernel.org>; Tue, 9 Apr 2019 14:50:56 +0900
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x395ofYY021762
        for <linux-kbuild@vger.kernel.org>; Tue, 9 Apr 2019 14:50:41 +0900
Received: by mail-vs1-f43.google.com with SMTP id a190so2109499vsd.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Apr 2019 22:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi1sSjZ8pw7tJpgvZyLfdJwT5judfjj7F3X5fLcAK3xvsw@mail.gmail.com>
 <CAK7LNARvfpkO8D=xJ+GQMWuxX5a3RVkUsBg8XUgFz+4m=knK3Q@mail.gmail.com>
 <CABWYdi1H9TnB32RCPL2axRvAf3sqf2K2BaoMs+0f-1CibfZ_Tg@mail.gmail.com> <CAK7LNASjMrSrL+LhTuSq4T3juUbYSZUUtevUz=hwS+qFQiDuTg@mail.gmail.com>
In-Reply-To: <CAK7LNASjMrSrL+LhTuSq4T3juUbYSZUUtevUz=hwS+qFQiDuTg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Apr 2019 14:50:04 +0900
Message-ID: <CAK7LNAQtbuWOw5yGiCeodg0Kf+JGaJj6s6FSyDysxCLxtMBLeg@mail.gmail.com>
Subject: Re: syncconfig changes in 4.19.34 break builds
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ivan Babrou <ivan@cloudflare.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

Greg, Sasha,


Sorry, the commit ID was wrong.


The following commit for 4.19.x:

commit 02826a6ba301b72461c3706e1cc66d5571cd327e
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Nov 5 16:52:34 2018 +0900

    kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used





Thanks.
Masahiro Yamada


On Tue, Apr 9, 2019 at 2:39 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> (+ Greg, Sasha)
>
>
> On Tue, Apr 9, 2019 at 12:48 PM Ivan Babrou <ivan@cloudflare.com> wrote:
> >
> > We have a multiple step Makefile that builds packages for two
> > architectures from the same source.
> >
> > Here are the top level make invocations from the log, hopefully these
> > can help you reproduce:
>
> OK, confirmed.  The cause of the error seems that
> commit 288885067b52 is missing in 4.19.x branch.
>
>
>
> Greg, Sasha,
> We also have a regression in 4.19.34
> (but the reason is different from v5.0.7)
>
>
> Could you backport the following commit to 4.19.x ?
>
> commit 288885067b52c2495436fbd59aaa77d4df62234e (HEAD -> test3)
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Mon Nov 5 16:52:34 2018 +0900
>
>     kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used
>
>
>
> Thanks.
> Masahiro Yamada
>
>
>
> > $ fgrep 'make[1]: Entering' -B1 Downloads/Linux_Stretch_901.log
> > [16:59:06] : [build] yes "" | make -C
> > /cfsetup_build/build/linux-4.19.34 ARCH=x86_64
> > O=/cfsetup_build/build/amd64 oldconfig
> > [16:59:06] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34'
> > --
> > [16:59:09] : [build] yes "" | make -C
> > /cfsetup_build/build/linux-4.19.34 ARCH=arm64
> > CROSS_COMPILE=aarch64-linux-gnu- O=/cfsetup_build/build/arm64
> > oldconfig
> > [16:59:09] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34'
> > --
> > [16:59:14] : [build] make -C
> > /cfsetup_build/build/linux-4.19.34/tools/perf
> > KBUILD_BUILD_TIMESTAMP="Mon Sep 27 00:00:00 UTC 2010" ARCH=x86_64
> > O=/cfsetup_build/build/amd64/perf
> > DESTDIR=/cfsetup_build/build/amd64/debian/perftmp/usr install
> > LOCALVERSION=-cloudflare-2019.4.0-2-g4cdcca8 LIBBABELTRACE=1
> > [16:59:14] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34/tools/perf'
> > --
> > [16:59:54] : [build] make -C
> > /cfsetup_build/build/linux-4.19.34/tools/lib/bpf
> > KBUILD_BUILD_TIMESTAMP="Mon Sep 27 00:00:00 UTC 2010" ARCH=x86_64
> > O=/cfsetup_build/build/amd64/libbpf
> > DESTDIR=/cfsetup_build/build/amd64/debian/libbpftmp install
> > LOCALVERSION=-cloudflare-2019.4.0-2-g4cdcca8
> > [16:59:54] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34/tools/lib/bpf'
> > --
> > [16:59:55] : [build] make -C
> > /cfsetup_build/build/linux-4.19.34/tools/bpf/bpftool
> > KBUILD_BUILD_TIMESTAMP="Mon Sep 27 00:00:00 UTC 2010" ARCH=x86_64
> > O=/cfsetup_build/build/amd64/bpftool
> > DESTDIR=/cfsetup_build/build/amd64/debian/bpftooltmp install
> > LOCALVERSION=-cloudflare-2019.4.0-2-g4cdcca8
> > [16:59:55] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34/tools/bpf/bpftool'
> > --
> > [17:00:00] : [build] make -C /cfsetup_build/build/linux-4.19.34
> > DB_CRT="/cfsetup_build/dev/DB.crt" ECHO_DB="cat
> > /cfsetup_build/dev/DB.key" KBUILD_BUILD_TIMESTAMP="Mon Sep 27 00:00:00
> > UTC 2010" ARCH=x86_64  O=/cfsetup_build/build/amd64 -j 4
> > LOCALVERSION=-cloudflare-2019.4.0-2-g4cdcca8
> > KDEB_PKGVERSION=2019.4.0-2-g4cdcca8
> > [17:00:00] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34'
> > --
> > [17:16:00] : [build] make: Entering directory
> > '/cfsetup_build/build/linux-4.19.34'
> > [17:16:00] : [build] make[1]: Entering directory '/cfsetup_build/build/amd64'
> > --
> > [17:16:05] : [build] Build tree made for linux as
> > x86_64_linux-4.19.34-cloudflare-2019.4.0-2-g4cdcca8
> > [17:16:05] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/openonload/build/x86_64_linux-4.19.34-cloudflare-2019.4.0-2-g4cdcca8'
> > --
> > [17:17:42] : [build] make -C /cfsetup_build/build/linux-4.19.34
> > ARCH=x86_64  O=/cfsetup_build/build/amd64
> > M=/cfsetup_build/build/glb-director/src/glb-redirect modules
> > [17:17:42] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34'
> > --
> > [17:17:44] : [build] make -C /cfsetup_build/build/linux-4.19.34
> > DB_CRT="/cfsetup_build/dev/DB.crt" ECHO_DB="cat
> > /cfsetup_build/dev/DB.key" ARCH=x86_64  O=/cfsetup_build/build/amd64
> > LOCALVERSION=-cloudflare-2019.4.0-2-g4cdcca8
> > KDEB_PKGVERSION=2019.4.0-2-g4cdcca8 bindeb-pkg
> > [17:17:44] : [build] make[1]: Entering directory
> > '/cfsetup_build/build/linux-4.19.34'
> >
> > On Mon, Apr 8, 2019 at 7:02 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > On Tue, Apr 9, 2019 at 2:35 AM Ivan Babrou <ivan@cloudflare.com> wrote:
> > > >
> > > > Hey,
> > > >
> > > > We've tried upgrading 4.19.31 to 4.19.34 and got the following error
> > > > during build:
> > >
> > > I think you ran 'make deb-pkg' or 'make bindeb-pkg'.
> > > I tested 4.19.34, but I could not reproduce the error.
> > >
> > > Could you provide the command to reproduce the error?
> > >
> > > Thanks.
> > >
> > >
> > > > [17:19:47] make KERNELRELEASE=4.19.34-cloudflare-2019.4.0-2-g4cdcca8
> > > > ARCH=x86_64 KBUILD_BUILD_VERSION=g4cdcca8 KBUILD_SRC= intdeb-pkg
> > > > [17:19:48] /bin/bash /cfsetup_build/build/linux-4.19.34/scripts/package/builddeb
> > > > [17:19:52] ***
> > > > [17:19:52] *** Configuration file ".config" not found!
> > > > [17:19:52] ***
> > > > [17:19:52] *** Please run some configurator (e.g. "make oldconfig" or
> > > > [17:19:52] *** "make menuconfig" or "make xconfig").
> > > > [17:19:52] ***
> > > > [17:19:52] make[12]: *** [syncconfig] Error 1
> > > > [17:19:52] make[11]: *** [syncconfig] Error 2
> > > > [17:19:52] make[10]: ***
> > > > [/cfsetup_build/build/amd64/include/config/auto.conf.cmd] Deleting
> > > > file '/cfsetup_build/build/amd64/include/config/tristate.conf'
> > > > [17:19:52] make[10]: Failed to remake makefile
> > > > '/cfsetup_build/build/amd64/include/config/auto.conf'.
> > > > [17:19:52] make[9]: *** [__sub-make] Error 2
> > > > [17:19:52] cp: cannot stat
> > > > '/cfsetup_build/build/linux-4.19.34/scripts/kconfig/Makefile:69:
> > > > recipe for target '\''syncconfig'\''
> > > > failed'$'\n''/cfsetup_build/build/linux-4.19.34/Makefile:539: recipe
> > > > for target '\''syncconfig'\''
> > > > failed'$'\n''arch/x86/boot/bzImage'$'\n''Makefile:24: recipe for
> > > > target '\''__sub-make'\'' failed': No such file or directory
> > > > [17:19:52] make[8]: *** [intdeb-pkg] Error 1
> > > > [17:19:52] make[7]: *** [intdeb-pkg] Error 2
> > > > [17:19:52] make[6]: *** [sub-make] Error 2
> > > > [17:19:52] make[5]: *** [__sub-make] Error 2
> > > > [17:19:52] /cfsetup_build/build/linux-4.19.34/scripts/package/Makefile:83:
> > > > recipe for target 'intdeb-pkg' failed
> > > > [17:19:52] make[4]: *** [binary-arch] Error 2
> > > > [17:19:52] /cfsetup_build/build/linux-4.19.34/Makefile:1365: recipe
> > > > for target 'intdeb-pkg' failed
> > > > [17:19:52] dpkg-buildpackage: error: fakeroot -u debian/rules binary
> > > > gave error exit status 2
> > > > [17:19:52] Makefile:146: recipe for target 'sub-make' failed
> > > > [17:19:52] make[3]: *** [bindeb-pkg] Error 2
> > > > [17:19:52] Makefile:24: recipe for target '__sub-make' failed
> > > > [17:19:52] make[2]: *** [bindeb-pkg] Error 2
> > > > [17:19:52] debian/rules:7: recipe for target 'binary-arch' failed
> > > > [17:19:52] make[1]: *** [sub-make] Error 2
> > > > [17:19:52] make: *** [core-packages-amd64] Error 2
> > > > [17:19:52] /cfsetup_build/build/linux-4.19.34/scripts/package/Makefile:79:
> > > > recipe for target 'bindeb-pkg' failed
> > > > [17:19:52] /cfsetup_build/build/linux-4.19.34/Makefile:1365: recipe
> > > > for target 'bindeb-pkg' failed
> > > > [17:19:52] make[2]: Leaving directory '/cfsetup_build/build/amd64'
> > > > [17:19:52] Makefile:146: recipe for target 'sub-make' failed
> > > > [17:19:52] make[1]: Leaving directory '/cfsetup_build/build/linux-4.19.34'
> > > > [17:19:52] Makefile:192: recipe for target 'core-packages-amd64' failed
> > > > [17:19:54] Failure: 2
> > > >
> > > > We have kernel sources in /cfsetup_build/build/linux-4.19.34, while
> > > > build is happening in /cfsetup_build/build/amd64.
> > > >
> > > > From a quick look at the changelog it seems that the following commit
> > > > is the reason:
> > > >
> > > > * https://github.com/torvalds/linux/commit/638ecaf5836979ad1c6f6c3fdd738ee9e71c0b07
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
