Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:46782 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751463AbdLFTf4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Dec 2017 14:35:56 -0500
MIME-Version: 1.0
In-Reply-To: <1512556378-13310-1-git-send-email-yamada.masahiro@socionext.com>
References: <1512556378-13310-1-git-send-email-yamada.masahiro@socionext.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 6 Dec 2017 12:35:55 -0700
Message-ID: <CA+r1ZhihMooXqeqwFH=DV8-CxFWqr0d2wE4H-YySJnkotVmssg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: pkg: make out-of-tree rpm/deb-pkg build
 immediately fail
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Dec 6, 2017 at 3:32 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
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
> ---
>
>  scripts/package/Makefile | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 61e29da..9fbcf5e 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -32,10 +32,14 @@ MKSPEC     := $(srctree)/scripts/package/mkspec
>
>  quiet_cmd_src_tar = TAR     $(2).tar.gz
>        cmd_src_tar = \
> +set -e; \
>  if test "$(objtree)" != "$(srctree)"; then \
> -       echo "Building source tarball is not possible outside the"; \
> -       echo "kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
> -       echo "binrpm-pkg or bindeb-pkg target instead."; \
> +       echo >&2; \
> +       echo >&2 "  ERROR:"; \
> +       echo >&2 "  Building source tarball is not possible outside the"; \
> +       echo >&2 "  kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
> +       echo >&2 "  binrpm-pkg or bindeb-pkg target instead."; \
> +       echo >&2; \
>         false; \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
> --
> 2.7.4
>

Tested-by: Jim Davis <jim.epost@gmail.com>

-- 
Jim
