Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34565 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750836AbdCNIt6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2017 04:49:58 -0400
Received: by mail-lf0-f51.google.com with SMTP id z15so51433419lfd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Mar 2017 01:49:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1489443666-29808-1-git-send-email-joe.konno@linux.intel.com>
References: <1489443666-29808-1-git-send-email-joe.konno@linux.intel.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Tue, 14 Mar 2017 10:49:55 +0200
Message-ID: <CAAqcGHntEudc=q4au_ewtaQuZLNs-0Z8OVcy5kzHq7OsqPo7Mg@mail.gmail.com>
Subject: Re: [PATCH] scripts: package: KDEB_SOURCENAME in .deb names
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Konno <joe.konno@linux.intel.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On 14 March 2017 at 00:21, Joe Konno <joe.konno@linux.intel.com> wrote:
> From: Joe Konno <joe.konno@intel.com>
>
> Currently, the KDEB_SOURCENAME make variable only controls the name of the
> packaged source tarball, and does not impact the .deb package names output
> by bindeb-pkg and deb-pkg. Presently, these files are more rigidly named,
> as the user may only control the names of .deb outputs by setting
> KDEB_PKGVERSION in their environment.
>
> This patch modifies the builddeb script to use KDEB_SOURCENAME when naming
> the image, firmware-image, headers, and libc-dev .deb output files. This
> would allow folks who build-- for instance-- mainline, stable, and next
> kernel packages more control over how their .deb outputs are named.
>
> This patch also changes the default value of KDEB_SOURCENAME so as not to
> change default .deb output file names. However, this does have the side
> effect of renaming the source tarball generated for .deb source packages.
>
> For example:
>   $ KDEB_SOURCENAME="linux-mainline" make bindeb-pkg
>
> Would output .deb files that begin with
>   ../linux-mainline-{image,firmware-image,headers,libc-dev}

I'm not sure this a really useful. Next, mainline, stable etc are all
different versions of linux, so version seems the correct place to
describe them?

> Signed-off-by: Joe Konno <joe.konno@intel.com>
> ---
>  scripts/package/Makefile | 2 +-
>  scripts/package/builddeb | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 71b4a8af9d4d..e4280da03991 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -23,7 +23,7 @@
>
>  # Remove hyphens since they have special meaning in RPM filenames
>  KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
> -KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
> +KDEB_SOURCENAME ?= linux
>  export KDEB_SOURCENAME
>  # Include only those top-level files that are needed by make, plus the GPL copy
>  TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 3c575cd07888..50caa143fb13 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -96,10 +96,10 @@ fwdir="$objtree/debian/fwtmp"
>  kernel_headers_dir="$objtree/debian/hdrtmp"
>  libc_headers_dir="$objtree/debian/headertmp"
>  dbg_dir="$objtree/debian/dbgtmp"
> -packagename=linux-image-$version
> -fwpackagename=linux-firmware-image-$version
> -kernel_headers_packagename=linux-headers-$version
> -libc_headers_packagename=linux-libc-dev
> +packagename=${sourcename}-image-$version
> +fwpackagename=${sourcename}-firmware-image-$version
> +kernel_headers_packagename=${sourcename}-headers-$version
> +libc_headers_packagename=${sourcename}-libc-dev

The style here is to use variables without curly braces unless really needed.

>  dbg_packagename=$packagename-dbg
>  debarch=
>  forcearch=
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
