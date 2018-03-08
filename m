Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65120 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933560AbeCHQ0O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Mar 2018 11:26:14 -0500
MIME-Version: 1.0
In-Reply-To: <20180308110246.16639-1-jhogan@kernel.org>
References: <CAK7LNARfTxxb0_RNEPvBzuEqP_g-cajZGpaGSuMJBUwDW66yww@mail.gmail.com>
 <20180308110246.16639-1-jhogan@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 9 Mar 2018 01:25:18 +0900
Message-ID: <CAK7LNASk1wzziCHtNY4jo8GO_aXTwrAh1bY-CyLiOSmBKm=BMg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Handle builtin dtb file names containing hyphens
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <jhogan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, devicetree@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, stable <stable@vger.kernel.org>

2018-03-08 20:02 GMT+09:00 James Hogan <jhogan@kernel.org>:
> cmd_dt_S_dtb constructs the assembly source to incorporate a devicetree
> FDT (that is, the .dtb file) as binary data in the kernel image. This
> assembly source contains labels before and after the binary data. The
> label names incorporate the file name of the corresponding .dtb file.
> Hyphens are not legal characters in labels, so .dtb files built into the
> kernel with hyphens in the file name result in errors like the
> following:
>
> bcm3368-netgear-cvg834g.dtb.S: Assembler messages:
> bcm3368-netgear-cvg834g.dtb.S:5: Error: : no such section
> bcm3368-netgear-cvg834g.dtb.S:5: Error: junk at end of line, first unrecognized character is `-'
> bcm3368-netgear-cvg834g.dtb.S:6: Error: unrecognized opcode `__dtb_bcm3368-netgear-cvg834g_begin:'
> bcm3368-netgear-cvg834g.dtb.S:8: Error: unrecognized opcode `__dtb_bcm3368-netgear-cvg834g_end:'
> bcm3368-netgear-cvg834g.dtb.S:9: Error: : no such section
> bcm3368-netgear-cvg834g.dtb.S:9: Error: junk at end of line, first unrecognized character is `-'
>
> Fix this by updating cmd_dt_S_dtb to transform all hyphens from the file
> name to underscores when constructing the labels.
>
> As of v4.16-rc2, 1139 .dts files across ARM64, ARM, MIPS and PowerPC
> contain hyphens in their names, but the issue only currently manifests
> on Broadcom MIPS platforms, as that is the only place where such files
> are built into the kernel. For example when CONFIG_DT_NETGEAR_CVG834G=y,
> or on BMIPS kernels when the dtbs target is used (in the latter case it
> admittedly shouldn't really build all the dtb.o files, but thats a
> separate issue).
>
> Fixes: 695835511f96 ("MIPS: BMIPS: rename bcm96358nb4ser to bcm6358-neufbox4-sercom")
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Reviewed-by: Frank Rowand <frowand.list@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
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
> Changes in v2:
>  - Rewrite commit message (thanks Frank for some improved wording).
>  - Add Franks' reviewed-by.

Applied to linux-kbuild/fixes.  Thanks!

-- 
Best Regards
Masahiro Yamada
