Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:63276 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCEWu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 00:22:50 -0400
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0534MVnr030768
        for <linux-kbuild@vger.kernel.org>; Wed, 3 Jun 2020 13:22:31 +0900
Received: by mail-vk1-f179.google.com with SMTP id u15so145272vkk.6
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2020 21:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200601055731.3006266-1-masahiroy@kernel.org> <20200601055731.3006266-5-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-5-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 3 Jun 2020 13:21:53 +0900
Message-ID: <CAK7LNATYmRbYH0O=4P3ce26OMNtTk_Zz2YhAUPLGkQib+UpWWA@mail.gmail.com>
Subject: Re: [PATCH 05/37] kbuild: refactor KBUILD_VMLINUX_{OBJS,LIBS} calculation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Jun 1, 2020 at 2:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Do not overwrite core-y or drivers-y. Remove libs-y1 and libs-y2.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

To mend ARCH=arm64 build error,
I will fix up as follows.

diff --git a/Makefile b/Makefile
index 0416760aeb28..24cf37c21cba 100644
--- a/Makefile
+++ b/Makefile
@@ -1070,7 +1070,7 @@ build-dirs        := $(vmlinux-dirs)
 clean-dirs     := $(vmlinux-alldirs)

 # Externally visible symbols (used by link-vmlinux.sh)
-KBUILD_VMLINUX_OBJS := $(head-y) $(addsuffix built-in.a, $(core-y))
+KBUILD_VMLINUX_OBJS := $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
 KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
 ifdef CONFIG_MODULES
 KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
@@ -1078,7 +1078,7 @@ KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 else
 KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
 endif
-KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(drivers-y))
+KBUILD_VMLINUX_OBJS += $(patsubst %/,%/built-in.a, $(drivers-y))

 export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds




>
>  Makefile | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c0c086d06753..0416760aeb28 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1069,19 +1069,18 @@ vmlinux-alldirs := $(sort $(vmlinux-dirs) Documentation \
>  build-dirs     := $(vmlinux-dirs)
>  clean-dirs     := $(vmlinux-alldirs)
>
> -core-y         := $(patsubst %/, %/built-in.a, $(core-y))
> -drivers-y      := $(patsubst %/, %/built-in.a, $(drivers-y))
> -libs-y2                := $(patsubst %/, %/built-in.a, $(filter %/, $(libs-y)))
> +# Externally visible symbols (used by link-vmlinux.sh)
> +KBUILD_VMLINUX_OBJS := $(head-y) $(addsuffix built-in.a, $(core-y))
> +KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
>  ifdef CONFIG_MODULES
> -libs-y1                := $(filter-out %/, $(libs-y))
> -libs-y2                += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
> +KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
> +KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
>  else
> -libs-y1                := $(patsubst %/, %/lib.a, $(libs-y))
> +KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
>  endif
> +KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(drivers-y))
>
> -# Externally visible symbols (used by link-vmlinux.sh)
> -export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) $(drivers-y)
> -export KBUILD_VMLINUX_LIBS := $(libs-y1)
> +export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
>  export LDFLAGS_vmlinux
>  # used by scripts/Makefile.package
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
