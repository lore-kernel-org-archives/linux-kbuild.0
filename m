Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:38658 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751588AbbFVGEo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Jun 2015 02:04:44 -0400
Received: by wibdq8 with SMTP id dq8so64346397wib.1
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jun 2015 23:04:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434811689-6923-1-git-send-email-merker@debian.org>
References: <1434811689-6923-1-git-send-email-merker@debian.org>
Date: Mon, 22 Jun 2015 09:04:43 +0300
Message-ID: <CAAqcGH=+NFPLifxXy58QytE2ndpQC2sj3_xkHe8405oZLkk3WQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: builddeb: Include dtbs in the Debian package
 built by "make deb-pkg"
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Karsten Merker <merker@debian.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On 20 June 2015 at 17:48, Karsten Merker <merker@debian.org> wrote:
> Native Debian kernel packages include any dtbs that were generated
> during the kernel build process in /usr/lib/${packagename}.
> Do the same for Debian packages built by scripts/package/builddeb
> (executed by the "deb-pkg" target).

This change has already been submitted in a few variations and is now
headed to next kernel version:

https://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/commit/?h=misc&id=ca2a9d2cf6cf3dd852c3926ac7e30ee774da4638

> Signed-off-by: Karsten Merker <merker@debian.org>
> ---
>  scripts/package/builddeb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 88dbf23..944b560 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -143,6 +143,11 @@ else
>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>  fi
>
> +# If dtbs have been built for this arch, include them in the package
> +if [ -d "arch/$ARCH/boot/dts" ]; then
> +  find "arch/$ARCH/boot/dts" -iname '*.dtb' -exec sh -c "mkdir -p '$tmpdir/usr/lib/$packagename'; cp '{}' '$tmpdir/usr/lib/$packagename/'" \;
> +fi
> +
>  if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>         INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install
>         rm -f "$tmpdir/lib/modules/$version/build"
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
