Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38703 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfHSPMC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 11:12:02 -0400
MIME-Version: 1.0
References: <20190814160623.24802-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190814160623.24802-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Aug 2019 00:11:04 +0900
Message-ID: <CAK7LNATrP29_WBCUqH1FddoO3j_FrbO=8obzEGj6FDn8ukUTgg@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: move KBUILD_LDS, KBUILD_VMLINUX_{OBJS,LIBS}
 to makefiles.rst
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Aug 15, 2019 at 1:06 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> These three variables are not intended to be tweaked by users.
> Move them from kbuild.rst to makefiles.rst.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild.


> I will apply to linux-kbuild this
> to avoid conflicts.
>
>
>  Documentation/kbuild/kbuild.rst    | 14 --------------
>  Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 61b2181ed3ea..62f9d86c082c 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -258,17 +258,3 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
>  These two variables allow to override the user@host string displayed during
>  boot and in /proc/version. The default value is the output of the commands
>  whoami and host, respectively.
> -
> -KBUILD_LDS
> -----------
> -The linker script with full path. Assigned by the top-level Makefile.
> -
> -KBUILD_VMLINUX_OBJS
> --------------------
> -All object files for vmlinux. They are linked to vmlinux in the same
> -order as listed in KBUILD_VMLINUX_OBJS.
> -
> -KBUILD_VMLINUX_LIBS
> --------------------
> -All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS
> -together specify all the object files used to link vmlinux.
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index f4f0f7ffde2b..d3448d2c8017 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -995,6 +995,20 @@ When kbuild executes, the following steps are followed (roughly):
>         top-level Makefile has set any other flags. This provides a
>         means for an architecture to override the defaults.
>
> +    KBUILD_LDS
> +
> +       The linker script with full path. Assigned by the top-level Makefile.
> +
> +    KBUILD_VMLINUX_OBJS
> +
> +       All object files for vmlinux. They are linked to vmlinux in the same
> +       order as listed in KBUILD_VMLINUX_OBJS.
> +
> +    KBUILD_VMLINUX_LIBS
> +
> +       All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and
> +       KBUILD_VMLINUX_LIBS together specify all the object files used to
> +       link vmlinux.
>
>  6.2 Add prerequisites to archheaders
>  ------------------------------------
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
