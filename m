Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:44961 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965386AbeCGULo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Mar 2018 15:11:44 -0500
Subject: Re: [PATCH] kbuild: Handle builtin dtb files containing hyphens
References: <20180307140633.26182-1-jhogan@kernel.org>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <7ecea7ca-2931-16bc-a110-1ecdaf17f0f2@gmail.com>
Date: Wed, 7 Mar 2018 12:11:41 -0800
MIME-Version: 1.0
In-Reply-To: <20180307140633.26182-1-jhogan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <jhogan@kernel.org>, linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org, stable@vger.kernel.org

I initially misread the patch description (and imagined an entirely
different problem).


On 03/07/18 06:06, James Hogan wrote:
> On dtb files which contain hyphens, the dt_S_dtb command to build the> dtb.S files (which allow DTB files to be built into the kernel) results> in errors like the following:> > bcm3368-netgear-cvg834g.dtb.S: Assembler messages:> bcm3368-netgear-cvg834g.dtb.S:5: Error: : no such section> bcm3368-netgear-cvg834g.dtb.S:5: Error: junk at end of line, first unrecognized character is `-'> bcm3368-netgear-cvg834g.dtb.S:6: Error: unrecognized opcode `__dtb_bcm3368-netgear-cvg834g_begin:'> bcm3368-netgear-cvg834g.dtb.S:8: Error: unrecognized opcode `__dtb_bcm3368-netgear-cvg834g_end:'> bcm3368-netgear-cvg834g.dtb.S:9: Error: : no such section> bcm3368-netgear-cvg834g.dtb.S:9: Error: junk at end of line, first unrecognized character is `-'
Please replace the following section:

> This is due to the hyphen being used in symbol names. Replace all
> hyphens 
> with underscores in the dt_S_dtb command to avoid this problem.
> 
> Quite a lot of dts files have hyphens, but its only a problem on MIPS
> where such files can be built into the kernel. For example when
> CONFIG_DT_NETGEAR_CVG834G=y, or on BMIPS kernels when the dtbs target is
> used (in the latter case it admitedly shouldn't really build all the
> dtb.o files, but thats a separate issue).

with:

   cmd_dt_S_dtb constructs the assembly source to incorporate a devicetree
   FDT (that is, the .dtb file) as binary data in the kernel image.
   This assembly source contains labels before and after the binary data.
   The label names incorporate the file name of the corresponding .dtb
   file.  Hyphens are not legal characters in labels, so transform all
   hyphens from the file name to underscores when constructing the labels.

> 
> Fixes: 695835511f96 ("MIPS: BMIPS: rename bcm96358nb4ser to bcm6358-neufbox4-sercom")
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Kevin Cernekee <cernekee@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: <stable@vger.kernel.org> # 4.9+
> ---
>  scripts/Makefile.lib | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 5589bae34af6..a6f538b31ad6 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -297,11 +297,11 @@ cmd_dt_S_dtb=						\
>  	echo '\#include <asm-generic/vmlinux.lds.h>'; 	\
>  	echo '.section .dtb.init.rodata,"a"';		\
>  	echo '.balign STRUCT_ALIGNMENT';		\
> -	echo '.global __dtb_$(*F)_begin';		\
> -	echo '__dtb_$(*F)_begin:';			\
> +	echo '.global __dtb_$(subst -,_,$(*F))_begin';	\
> +	echo '__dtb_$(subst -,_,$(*F))_begin:';		\
>  	echo '.incbin "$<" ';				\
> -	echo '__dtb_$(*F)_end:';			\
> -	echo '.global __dtb_$(*F)_end';			\
> +	echo '__dtb_$(subst -,_,$(*F))_end:';		\
> +	echo '.global __dtb_$(subst -,_,$(*F))_end';	\
>  	echo '.balign STRUCT_ALIGNMENT'; 		\
>  ) > $@
>  
> 

Reviewed-by: Frank Rowand <frowand.list@gmail.com>
