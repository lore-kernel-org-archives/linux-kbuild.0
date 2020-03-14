Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:40396 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgCNBaE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Mar 2020 21:30:04 -0400
MIME-Version: 1.0
References: <20200311225044.29502-1-masahiroy@kernel.org>
In-Reply-To: <20200311225044.29502-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Mar 2020 10:29:21 +0900
Message-ID: <CAK7LNAQ=AVRwXxErOvs=2iK2vKYU3GrF_am7JUUFBiVGPchWXw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix references to other documents
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

On Thu, Mar 12, 2020 at 7:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> All the files in Documentation/kbuild/ were converted to reST.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>
>  Documentation/kbuild/kbuild.rst                 | 2 +-
>  Documentation/kbuild/kconfig-macro-language.rst | 2 +-
>  Documentation/kbuild/makefiles.rst              | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index f1e5dce86af7..510f38d7e78a 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -237,7 +237,7 @@ This is solely useful to speed up test compiles.
>  KBUILD_EXTRA_SYMBOLS
>  --------------------
>  For modules that use symbols from other modules.
> -See more details in modules.txt.
> +See more details in modules.rst.
>
>  ALLSOURCE_ARCHS
>  ---------------
> diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
> index 35b3263b7e40..8b413ef9603d 100644
> --- a/Documentation/kbuild/kconfig-macro-language.rst
> +++ b/Documentation/kbuild/kconfig-macro-language.rst
> @@ -44,7 +44,7 @@ intermediate::
>              def_bool y
>
>  Then, Kconfig moves onto the evaluation stage to resolve inter-symbol
> -dependency as explained in kconfig-language.txt.
> +dependency as explained in kconfig-language.rst.
>
>
>  Variables
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 6bc126a14b3d..04d5c01a2e99 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -924,7 +924,7 @@ When kbuild executes, the following steps are followed (roughly):
>         $(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
>         are used for assembler.
>
> -       From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
> +       From commandline AFLAGS_MODULE shall be used (see kbuild.rst).
>
>      KBUILD_CFLAGS_KERNEL
>         $(CC) options specific for built-in
> @@ -937,7 +937,7 @@ When kbuild executes, the following steps are followed (roughly):
>
>         $(KBUILD_CFLAGS_MODULE) is used to add arch-specific options that
>         are used for $(CC).
> -       From commandline CFLAGS_MODULE shall be used (see kbuild.txt).
> +       From commandline CFLAGS_MODULE shall be used (see kbuild.rst).
>
>      KBUILD_LDFLAGS_MODULE
>         Options for $(LD) when linking modules
> @@ -945,7 +945,7 @@ When kbuild executes, the following steps are followed (roughly):
>         $(KBUILD_LDFLAGS_MODULE) is used to add arch-specific options
>         used when linking modules. This is often a linker script.
>
> -       From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).
> +       From commandline LDFLAGS_MODULE shall be used (see kbuild.rst).
>
>      KBUILD_LDS
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
