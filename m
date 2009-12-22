Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lixom.net ([66.141.50.11]:48337 "EHLO mail.lixom.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750752AbZLVDnj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Dec 2009 22:43:39 -0500
Date: Mon, 21 Dec 2009 21:48:19 -0600
From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 2/3] powerpc: Add support for creating FIT uImages
Message-ID: <20091222034819.GA24012@lixom.net>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com> <1261446643-21714-3-git-send-email-ptyser@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1261446643-21714-3-git-send-email-ptyser@xes-inc.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Tyser <ptyser@xes-inc.com>
Cc: linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

Hi,

On Mon, Dec 21, 2009 at 07:50:42PM -0600, Peter Tyser wrote:
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index bb2465b..e56ec21 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -310,6 +310,9 @@ $(obj)/zImage.iseries: vmlinux
>  $(obj)/uImage: vmlinux $(wrapperbits)
>  	$(call if_changed,wrap,uboot)
>  
> +$(obj)/uImage.fit.%: vmlinux $(obj)/%.dtb $(wrapperbits)
> +	$(call if_changed,wrap,uboot.fit,,$(obj)/$*.dtb)
> +
>  $(obj)/cuImage.initrd.%: vmlinux $(obj)/%.dtb $(wrapperbits)
>  	$(call if_changed,wrap,cuboot-$*,,$(obj)/$*.dtb,$(obj)/ramdisk.image.gz)
>  
> @@ -349,7 +352,7 @@ install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
>  
>  # anything not in $(targets)
>  clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
> -	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
> +	uImage.* zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \

Please no. It's not entirely uncommon that I will save a "known good"
binary in the build tree for a while, by copying it aside with a different
suffix. That'd give me one very big surprise in this case.


-Olof
