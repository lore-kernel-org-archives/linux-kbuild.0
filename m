Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f66.google.com ([209.85.161.66]:33416 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgATQQH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 11:16:07 -0500
Subject: Re: [RFC PATCH 3/3] scripts: Use -B dtc option to generate dtb build
 information.
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-4-alexandre.torgue@st.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <5b5a40b5-6954-05aa-5c7f-5ae8100aa1ee@gmail.com>
Date: Mon, 20 Jan 2020 10:16:05 -0600
MIME-Version: 1.0
In-Reply-To: <20200113181625.3130-4-alexandre.torgue@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

On 1/13/20 12:16 PM, Alexandre Torgue wrote:
> This commit adds a new script to create a string in tmp file with
> some information (date, linux version, user). This file is then used by
> dtc with -B option to append dts file with a new property.
> During kernel boot it will then be possible to printout DTB build
> information (date, linux version used, user).
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3fa32f83b2d7..6a98eac1e56d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -235,6 +235,7 @@ quiet_cmd_gzip = GZIP    $@
>  # DTC
>  # ---------------------------------------------------------------------------
>  DTC ?= $(objtree)/scripts/dtc/dtc
> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info
>  
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> @@ -275,11 +276,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>  
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
> -	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> -	$(DTC) -O $(2) -o $@ -b 0 \
> +       $(DTB_GEN_INFO) $(@).info ;\
> +       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +       $(DTC) -O $(2) -o $@ -b 0 -B $(@).info\
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> -		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
> -	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> +               -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> +       rm $(@).info ; \
> +       cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)

The indentation should be tabs instead of spaces.

-Frank

>  
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>  	$(call if_changed_dep,dtc,dtb)
> diff --git a/scripts/gen_dtb_build_info b/scripts/gen_dtb_build_info
> new file mode 100755
> index 000000000000..30cf7506b9d5
> --- /dev/null
> +++ b/scripts/gen_dtb_build_info
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +DTB_TARGET=$@
> +COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
> +
> +touch $DTB_TARGET
> +
> +{
> +  echo From Linux $KERNELRELEASE by $COMPILE_BY the $(date).
> +} > $DTB_TARGET
> 
