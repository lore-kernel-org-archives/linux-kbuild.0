Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f187.google.com ([209.85.210.187]:37403 "EHLO
	mail-yx0-f187.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752003AbZL3WZt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Dec 2009 17:25:49 -0500
Received: by yxe17 with SMTP id 17so11165838yxe.33
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Dec 2009 14:25:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1261446643-21714-2-git-send-email-ptyser@xes-inc.com>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-2-git-send-email-ptyser@xes-inc.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 30 Dec 2009 15:25:28 -0700
Message-ID: <fa686aa40912301425s47b0363cq723e8bff1ab995c6@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc: Use scripts/mkuboot.sh instead of
	'mkimage'
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Tyser <ptyser@xes-inc.com>
Cc: linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

On Mon, Dec 21, 2009 at 6:50 PM, Peter Tyser <ptyser@xes-inc.com> wrote:
> mkuboot.sh provides a basic wrapper for the 'mkimage' utility.  Using
> mkuboot.sh provides clearer error reporting and allows a toolchain to
> use its own 'mkimage' executable specified by ${CROSS_COMPILE}mkimage.
> Additionally, this brings PowerPC in line with other architectures
> which already call mkimage via mkuboot.sh.
>
> Signed-off-by: Peter Tyser <ptyser@xes-inc.com>

Okay by me.  I've picked this one up.

g.

> ---
>  arch/powerpc/boot/wrapper |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 390512a..f4594ed 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -43,6 +43,9 @@ gzip=.gz
>  # cross-compilation prefix
>  CROSS=
>
> +# mkimage wrapper script
> +MKIMAGE=$srctree/scripts/mkuboot.sh
> +
>  # directory for object and other files used by this script
>  object=arch/powerpc/boot
>  objbin=$object
> @@ -267,7 +270,7 @@ membase=`${CROSS}objdump -p "$kernel" | grep -m 1 LOAD | awk '{print $7}'`
>  case "$platform" in
>  uboot)
>     rm -f "$ofile"
> -    mkimage -A ppc -O linux -T kernel -C gzip -a $membase -e $membase \
> +    ${MKIMAGE} -A ppc -O linux -T kernel -C gzip -a $membase -e $membase \
>        $uboot_version -d "$vmz" "$ofile"
>     if [ -z "$cacheit" ]; then
>        rm -f "$vmz"
> @@ -327,7 +330,7 @@ coff)
>     ;;
>  cuboot*)
>     gzip -f -9 "$ofile"
> -    mkimage -A ppc -O linux -T kernel -C gzip -a "$base" -e "$entry" \
> +    ${MKIMAGE} -A ppc -O linux -T kernel -C gzip -a "$base" -e "$entry" \
>             $uboot_version -d "$ofile".gz "$ofile"
>     ;;
>  treeboot*)
> --
> 1.6.2.1
>
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
