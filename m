Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58560 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753553AbbCQKd4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Mar 2015 06:33:56 -0400
Date: Tue, 17 Mar 2015 10:33:51 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] kbuild: Create directory for target DTB
Message-ID: <20150317103351.GC1839@arm.com>
References: <eeaee5ea1dc1082db84c91567a9fe6260138512e.1425562715.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeaee5ea1dc1082db84c91567a9fe6260138512e.1425562715.git.michal.simek@xilinx.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Zach Pfeffer <zachp@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <Catalin.Marinas@arm.com>, Nathan Rossi <nathan.rossi@xilinx.com>, Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Thu, Mar 05, 2015 at 01:38:41PM +0000, Michal Simek wrote:
> From: Nathan Rossi <nathan.rossi@xilinx.com>
> 
> When building specific DTBs out of the kernel tree the vendor subdirs
> (boot/dts/<vendor>) are not created, ensure that they are before
> building the DTB.
> 
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> Problem is visible with arm64 for out of tree builds.
> make O=/tmp/kkk/ defconfig
> make O=/tmp/kkk/ cavium/thunder-88xx.dtb
> 
>   DTC     arch/arm64/boot/dts/cavium/thunder-88xx.dtb
> cc1: fatal error: opening output file
> arch/arm64/boot/dts/cavium/.thunder-88xx.dtb.dts.tmp: No such file or
> directory
> compilation terminated.
> make[2]: *** [arch/arm64/boot/dts/cavium/thunder-88xx.dtb] Error 1
> make[1]: *** [cavium/thunder-88xx.dtb] Error 2
> 
> Building specific dtb target on arm32 is working fine
> make O=/tmp/kkk4/ multi_v7_defconfig
> make O=/tmp/kkk4/ zynq-zc702.dtb
> 
> This is the way how Yocto is building dtb for specific target.
> ---
>  scripts/Makefile.lib | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 044eb4f89a91..6e3356005ec4 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -282,7 +282,8 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
>  	$(call cmd,dt_S_dtb)
>  
>  quiet_cmd_dtc = DTC     $@
> -cmd_dtc = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +cmd_dtc = mkdir -p `dirname ${dtc-tmp}` ; \

The backticks are fairly gross here, can you use something like $(dir
${dtc-tmp}) instead?

Will
