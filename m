Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f211.google.com ([209.85.217.211]:60548 "EHLO
	mail-gx0-f211.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbZL3XCw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Dec 2009 18:02:52 -0500
Received: by gxk3 with SMTP id 3so227338gxk.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Dec 2009 15:02:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1261446643-21714-4-git-send-email-ptyser@xes-inc.com>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-4-git-send-email-ptyser@xes-inc.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 30 Dec 2009 16:02:32 -0700
Message-ID: <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT
	uImages
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Tyser <ptyser@xes-inc.com>
Cc: linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

On Mon, Dec 21, 2009 at 6:50 PM, Peter Tyser <ptyser@xes-inc.com> wrote:
> The PowerPC architecture has the ability to embed the ramdisk located
> at arch/powerpc/boot/ramdisk.image.gz into a bootable kernel image.  If
> the bootable kernel is in the Flattened Image Tree (FIT) format, the
> ramdisk should be a node in the tree instead of being embedded directly
> in the kernel executable.
>
> A FIT uImage with a ram filesystem can be generated using the command:
> "make uImage.fit.initrd.<boardname>" where <boardname> is one of
> arch/powerpc/boot/dts/<boardname>.dts.  The command will generate a FIT
> uImage at arch/powerpc/boot/uImage.fit.initrd.<boardname> that contains
> a kernel image, device tree blob, and a ram filesystem.
>
> The ramdisk at arch/powerpc/boot/ramdisk.image.gz can either be an older
> style "ramdisk" or a newer "ramfs" gzipped cpio archive.
>
> Signed-off-by: Peter Tyser <ptyser@xes-inc.com>
> ---
> Changes since v1:
> - Don't strip leading 0x from dts ramdisk address
>
>  arch/powerpc/boot/Makefile |    3 +++
>  arch/powerpc/boot/wrapper  |   20 ++++++++++++++++----
>  scripts/mkits.sh           |   34 ++++++++++++++++++++++++++++++++--
>  3 files changed, 51 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index e56ec21..c2a6591 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -313,6 +313,9 @@ $(obj)/uImage: vmlinux $(wrapperbits)
>  $(obj)/uImage.fit.%: vmlinux $(obj)/%.dtb $(wrapperbits)
>        $(call if_changed,wrap,uboot.fit,,$(obj)/$*.dtb)
>
> +$(obj)/uImage.fit.initrd.%: vmlinux $(obj)/%.dtb $(wrapperbits)
> +       $(call if_changed,wrap,uboot.fit,,$(obj)/$*.dtb,$(obj)/ramdisk.image.gz)
> +

IIRC, uImage.fit.initrd.% should appear before uImage.fit.% in the
Makefile so that make behaves more consistently.  Speaking of which,
the number of '.' in the name is getting rather large.  Would you
consider using 'fitImage' instead of 'uImage.fit'?

g.
