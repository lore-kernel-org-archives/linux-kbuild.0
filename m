Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58605 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbgBXRpv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 12:45:51 -0500
MIME-Version: 1.0
References: <20200221161217.20069-1-alexandre.torgue@st.com> <20200221161217.20069-2-alexandre.torgue@st.com>
In-Reply-To: <20200221161217.20069-2-alexandre.torgue@st.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 25 Feb 2020 02:45:05 +0900
Message-ID: <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build information
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Marek <michal.lkml@markovi.net>, David Gibson <david@gibson.dropbear.id.au>, Simon Glass <sjg@chromium.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Ian Lepore <ian@freebsd.org>

Hi.

On Sat, Feb 22, 2020 at 1:12 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> This commit adds a new script to create a file (in dts file directory) with
> some information (date, Linux version, user). This file could then be used
> to populate "build-info" property in every dts file that would use this
> build information:
>
> Example:
>
> / {
>         ...
>         build-info = /incbin/("dtb-build.txt");
>         ...
> };
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index bae62549e3d2..a5af84ef4ffc 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>  # DTC
>  # ---------------------------------------------------------------------------
>  DTC ?= $(objtree)/scripts/dtc/dtc
> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
> +       $(DTB_GEN_INFO) $(src) ; \
>         $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>         $(DTC) -O $(2) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
> new file mode 100755
> index 000000000000..0cd8bd98e410
> --- /dev/null
> +++ b/scripts/gen_dtb_build_info.sh
> @@ -0,0 +1,10 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -o nounset
> +
> +DTB_DIR=$1
> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
> +
> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> --
> 2.17.1
>


There are more than 1000 *.dts files
in arch/arm/boot/dts/.

So, with this patch, the build system will creates
arch/arm/boot/dts/dtb-build.txt 1000 times.


Does it work with parallel build ?

Think about what would happen
with 'make -j32 ARCH=arm  dtbs'


The 32 threads will write to
arch/arm/boot/dts/dtb-build.txt
at the same time.

Then, some of DTB would very likely to
include the broken dtb-build.txt


A list of missing parts in this approach:

 - make it work with parallel build
 - clean it up with 'make clean'
 - add it .gitignore  (and Documentation/dontdiff)



-- 
Best Regards
Masahiro Yamada
