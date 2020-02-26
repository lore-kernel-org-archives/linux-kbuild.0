Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40978 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgBZU4R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 15:56:17 -0500
Date: Wed, 26 Feb 2020 14:56:14 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 4/4] script: make automatic dtb build info
 generation
Message-ID: <20200226205614.GA15331@bogus>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-5-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221161418.20225-5-alexandre.torgue@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

On Fri, Feb 21, 2020 at 05:14:18PM +0100, Alexandre Torgue wrote:
> Append each "xxx.dtb.dts.tmp" file with "build-info" entry during dtb
> build. It allows to get build information (date, source version, ...)
> for each device tree without modify them manually.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index a5af84ef4ffc..f084e78267b2 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -289,6 +289,7 @@ quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>  	$(DTB_GEN_INFO) $(src) ; \

We regenerate this for every dtb?

>  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +	$(DTB_GEN_INFO) $(src) $(dtc-tmp) ; \
>  	$(DTC) -O $(2) -o $@ -b 0 \
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
> index 0cd8bd98e410..72f31e386787 100755
> --- a/scripts/gen_dtb_build_info.sh
> +++ b/scripts/gen_dtb_build_info.sh
> @@ -6,5 +6,7 @@ set -o nounset
>  DTB_DIR=$1
>  DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')

Use LINUX_COMPILE_BY #define

>  DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"

I'd use UTS_RELEASE and UTS_VERSION defines here.

> +DTS_FILE=$2
>  
> -printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> +printf "$DTB_INFO" > "arch/arm/boot/dts/dtb-build.txt"

Obviously, hardcoding this is not right. You probably need to prepend 
with $(obj) so this works for out of tree builds too.

> +echo "&{/} {build-info = /incbin/(\"dtb-build.txt\");};" >> $DTS_FILE

You could commit the .dtsi file using the above defines and then just 
add a #include of it here. Then we'd get dependency tracking for free.

Rob
