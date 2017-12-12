Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33894 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbdLLPJ2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Dec 2017 10:09:28 -0500
MIME-Version: 1.0
In-Reply-To: <1512556378-13310-1-git-send-email-yamada.masahiro@socionext.com>
References: <1512556378-13310-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 13 Dec 2017 00:08:43 +0900
Message-ID: <CAK7LNATL+K=z3Bx4L2oc=HvmQB+QsSN_W4YKn9TZ1GWKM=YY_A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: pkg: make out-of-tree rpm/deb-pkg build
 immediately fail
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-12-06 19:32 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> We do not support out-of-tree building of rpm-pkg / deb-pkg.  If O=
> is given, the build should be terminated, but the "false" command is
> not effective because it is not the last command in the cmd_src_tar.
> Then, rpm-pkg / deb-pkg tries to continue building, and fails for a
> different reason.
>
> Set -e option so that the "false" terminates the building immediately.
>
> I also put the error messages to stderr, and made it stand out more.
>
> For example, "make O=foo rpm-pkg" will fail as follows:
>
>   /bin/bash ../scripts/package/mkspec >./kernel.spec
>     TAR     kernel-4.15.0_rc2+.tar.gz
>
>     ERROR:
>     Building source tarball is not possible outside the
>     kernel source tree. Don't set KBUILD_OUTPUT, or use the
>     binrpm-pkg or bindeb-pkg target instead.
>
>   ../scripts/package/Makefile:53: recipe for target 'rpm-pkg' failed
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild/misc.

-- 
Best Regards
Masahiro Yamada
