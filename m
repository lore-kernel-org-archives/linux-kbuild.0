Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:33765 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932205AbcIMIWv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Sep 2016 04:22:51 -0400
Received: by mail-wm0-f45.google.com with SMTP id b187so14814048wme.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Sep 2016 01:22:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473032617-21914-1-git-send-email-public_timo.s@silentcreek.de>
References: <1473032617-21914-1-git-send-email-public_timo.s@silentcreek.de>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Tue, 13 Sep 2016 11:22:48 +0300
Message-ID: <CAAqcGHm-4VOfyLgKnqcrLd2F4=XxQs_NEaq-NvUXZpxv3e_P3g@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Update a few outdated and hardcoded strings
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Timo Sigurdsson <public_timo.s@silentcreek.de>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 5 September 2016 at 02:43, Timo Sigurdsson
<public_timo.s@silentcreek.de> wrote:
> The builddeb script has some hardcoded references to linux version 2.6
> which is ancient. Use a variable instead in order to keep in sync with
> new releases and avoid the need to manually update this. In addition,
> change the copyright notice to include the year 2016.

I think we can just drop all the "Provides" lines, the official debian
packages don't provide
anything, and nothing depends on these provided virtual packages either.

> Signed-off-by: Timo Sigurdsson <public_timo.s@silentcreek.de>
> ---
>  scripts/package/builddeb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 8ea9fd2..d85120c 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -84,6 +84,7 @@ set_debarch() {
>
>  # Some variables and settings used throughout the script
>  version=$KERNELRELEASE
> +majorversion=$VERSION.$PATCHLEVEL
>  revision=$(cat .version)
>  if [ -n "$KDEB_PKGVERSION" ]; then
>         packageversion=$KDEB_PKGVERSION
> @@ -265,7 +266,7 @@ This is a packacked upstream version of the Linux kernel.
>  The sources may be found at most Linux ftp sites, including:
>  ftp://ftp.kernel.org/pub/linux/kernel
>
> -Copyright: 1991 - 2015 Linus Torvalds and others.
> +Copyright: 1991 - 2016 Linus Torvalds and others.
>
>  The git repository for mainline kernel development is at:
>  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> @@ -296,7 +297,7 @@ if [ "$ARCH" = "um" ]; then
>         cat <<EOF >> debian/control
>
>  Package: $packagename
> -Provides: linux-image, linux-image-2.6, linux-modules-$version
> +Provides: linux-image, linux-image-$majorversion, linux-modules-$version
>  Architecture: any
>  Description: User Mode Linux kernel, version $version
>   User-mode Linux is a port of the Linux kernel to its own system call
> @@ -313,7 +314,7 @@ else
>         cat <<EOF >> debian/control
>
>  Package: $packagename
> -Provides: linux-image, linux-image-2.6, linux-modules-$version
> +Provides: linux-image, linux-image-$majorversion, linux-modules-$version
>  Suggests: $fwpackagename
>  Architecture: any
>  Description: Linux kernel, version $version
> @@ -346,7 +347,7 @@ rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
>  cat <<EOF >> debian/control
>
>  Package: $kernel_headers_packagename
> -Provides: linux-headers, linux-headers-2.6
> +Provides: linux-headers, linux-headers-$majorversion
>  Architecture: any
>  Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
>   This package provides kernel header files for $KERNELRELEASE on \${kernel:debarch}
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
