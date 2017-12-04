Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from goliath.siemens.de ([192.35.17.28]:40377 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751286AbdLDQtm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 11:49:42 -0500
Date: Mon, 4 Dec 2017 17:50:08 +0100
From: Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v2] scripts: builddeb: allow customization of "Depends:"
 fields
Message-ID: <20171204175008.5e7c4acd@md1em3qc>
In-Reply-To: <20171204164808.25492-1-henning.schild@siemens.com>
References: <20171127161345.17880-1-henning.schild@siemens.com>
        <20171204164808.25492-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jim Davis <jim.epost@gmail.com>

Hi,

this is a simpler version that allows just the customization of
"Depends:", as requested by Ben.

It addresses the security issues Jim mentioned by not using eval
anymore.

Henning

Am Mon, 4 Dec 2017 17:48:08 +0100
schrieb Henning Schild <henning.schild@siemens.com>:

> The debian packages coming out of "make *deb-pkg" lack the "Depends:"
> field. If one tries to install a fresh system with such a
> "linux-image" debootstrap or multistrap might try to install the
> kernel before its deps and the package hooks will fail.
> 
> Different debian-based distros use different values for the missing
> fields. And the values differ between distro versions as well. So
> hardcoding is not possible.
> 
> This patch introduces an option variable for every debian package
> built by builddeb. That allows advanced users to specify additional
> dependencies for all packages. All the new variables are optional.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  scripts/package/builddeb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b4f0f2b3f8d2..079bd4c4aea9 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -288,6 +288,7 @@ if [ "$ARCH" = "um" ]; then
>  
>  Package: $packagename
>  Architecture: any
> +Depends: $KDEB_DEP_IMAGE
>  Description: User Mode Linux kernel, version $version
>   User-mode Linux is a port of the Linux kernel to its own system call
>   interface.  It provides a kind of virtual machine, which runs Linux
> @@ -304,6 +305,7 @@ else
>  
>  Package: $packagename
>  Architecture: any
> +Depends: $KDEB_DEP_IMAGE
>  Description: Linux kernel, version $version
>   This package contains the Linux kernel, modules and corresponding
> other files, version: $version.
> @@ -335,6 +337,7 @@ cat <<EOF >> debian/control
>  
>  Package: $kernel_headers_packagename
>  Architecture: any
> +Depends: $KDEB_DEP_IMAGE_HEADERS
>  Description: Linux kernel headers for $KERNELRELEASE on
> \${kernel:debarch} This package provides kernel header files for
> $KERNELRELEASE on \${kernel:debarch} .
> @@ -347,6 +350,7 @@ Package: $libc_headers_packagename
>  Section: devel
>  Provides: linux-kernel-headers
>  Architecture: any
> +Depends: $KDEB_DEP_LIBC_HEADERS
>  Description: Linux support headers for userspace development
>   This package provides userspaces headers from the Linux kernel.
> These headers are used by the installed headers for GNU glibc and
> other system libraries. @@ -375,6 +379,7 @@ if [ -n "$BUILD_DEBUG"
> ] ; then 
>  Package: $dbg_packagename
>  Section: debug
> +Depends: $KDEB_DEP_IMAGE_DBG
>  Architecture: any
>  Description: Linux kernel debugging symbols for $version
>   This package will come in handy if you need to debug the kernel. It
> provides

