Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25840 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbeJaA4A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 20:56:00 -0400
MIME-Version: 1.0
References: <1540829034-17725-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1540829034-17725-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 31 Oct 2018 01:00:55 +0900
Message-ID: <CAK7LNASEogAqYTZHdtPWk4xZPXKkJPuWX9BF3o_Cy5s0jCB2cg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unused cc-fullversion variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

On Tue, Oct 30, 2018 at 1:05 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The last user of cc-fullversion was removed by commit f2910f0e6835
> ("powerpc: remove old GCC version checks").
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.




>  Documentation/kbuild/makefiles.txt | 15 ---------------
>  scripts/Kbuild.include             |  4 ----
>  2 files changed, 19 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 7b6a2b2..8da26c6 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -537,21 +537,6 @@ more details, with real examples.
>         The third parameter may be a text as in this example, but it may also
>         be an expanded variable or a macro.
>
> -    cc-fullversion
> -       cc-fullversion is useful when the exact version of gcc is needed.
> -       One typical use-case is when a specific GCC version is broken.
> -       cc-fullversion points out a more specific version than cc-version does.
> -
> -       Example:
> -               #arch/powerpc/Makefile
> -               $(Q)if test "$(cc-fullversion)" = "040200" ; then \
> -                       echo -n '*** GCC-4.2.0 cannot compile the 64-bit powerpc ' ; \
> -                       false ; \
> -               fi
> -
> -       In this example for a specific GCC version the build will error out
> -       explaining to the user why it stops.
> -
>      cc-cross-prefix
>         cc-cross-prefix is used to check if there exists a $(CC) in path with
>         one of the listed prefixes. The first prefix where there exist a
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index ca21a35..19a63db 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -147,10 +147,6 @@ cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo
>  # cc-version
>  cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
>
> -# cc-fullversion
> -cc-fullversion = $(shell $(CONFIG_SHELL) \
> -       $(srctree)/scripts/gcc-version.sh -p $(CC))
> -
>  # cc-ifversion
>  # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
>  cc-ifversion = $(shell [ $(cc-version) $(1) $(2) ] && echo $(3) || echo $(4))
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
