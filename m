Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:52991 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755134AbdIRJ2s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2017 05:28:48 -0400
Received: by mail-lf0-f47.google.com with SMTP id b127so7265866lfe.9
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Sep 2017 02:28:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1505726539-30725-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505726539-30725-1-git-send-email-yamada.masahiro@socionext.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Mon, 18 Sep 2017 12:28:45 +0300
Message-ID: <CAAqcGH=3xcyw3pDxHBV0fvDsjHzu=zZb74C0ywgm7MC0vqyKsg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: remove firmware package support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Trippelsdorf <markus@trippelsdorf.de>, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>

On 18 September 2017 at 12:22, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Commit 5620a0d1aacd ("firmware: delete in-kernel firmware") deleted
> in-kernel firmware support, including the firmware install command.
>
> So, the firmware package does not make sense any more.  Remove it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Riku Voipio <riku.voipio@linaro.org>

> ---
>
>  scripts/package/builddeb | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index aad6700..0bc8747 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -92,12 +92,10 @@ else
>  fi
>  sourcename=$KDEB_SOURCENAME
>  tmpdir="$objtree/debian/tmp"
> -fwdir="$objtree/debian/fwtmp"
>  kernel_headers_dir="$objtree/debian/hdrtmp"
>  libc_headers_dir="$objtree/debian/headertmp"
>  dbg_dir="$objtree/debian/dbgtmp"
>  packagename=linux-image-$version
> -fwpackagename=linux-firmware-image-$version
>  kernel_headers_packagename=linux-headers-$version
>  libc_headers_packagename=linux-libc-dev
>  dbg_packagename=$packagename-dbg
> @@ -126,10 +124,9 @@ esac
>  BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
>
>  # Setup the directory structure
> -rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" $objtree/debian/files
> +rm -rf "$tmpdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" $objtree/debian/files
>  mkdir -m 755 -p "$tmpdir/DEBIAN"
>  mkdir -p "$tmpdir/lib" "$tmpdir/boot"
> -mkdir -p "$fwdir/lib/firmware/$version/"
>  mkdir -p "$kernel_headers_dir/lib/modules/$version/"
>
>  # Build and install the kernel
> @@ -306,7 +303,6 @@ else
>         cat <<EOF >> debian/control
>
>  Package: $packagename
> -Suggests: $fwpackagename
>  Architecture: any
>  Description: Linux kernel, version $version
>   This package contains the Linux kernel, modules and corresponding other
> @@ -345,22 +341,6 @@ Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
>   This is useful for people who need to build external modules
>  EOF
>
> -# Do we have firmware? Move it out of the way and build it into a package.
> -if [ -e "$tmpdir/lib/firmware" ]; then
> -       mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
> -       rmdir "$tmpdir/lib/firmware"
> -
> -       cat <<EOF >> debian/control
> -
> -Package: $fwpackagename
> -Architecture: all
> -Description: Linux kernel firmware, version $version
> - This package contains firmware from the Linux kernel, version $version.
> -EOF
> -
> -       create_package "$fwpackagename" "$fwdir"
> -fi
> -
>  cat <<EOF >> debian/control
>
>  Package: $libc_headers_packagename
> --
> 2.7.4
>
