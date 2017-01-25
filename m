Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34247 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752436AbdAYTDx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Jan 2017 14:03:53 -0500
Received: by mail-io0-f193.google.com with SMTP id c80so2888507iod.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jan 2017 11:03:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170123114011.4189-4-riku.voipio@linaro.org>
References: <20170123114011.4189-1-riku.voipio@linaro.org> <20170123114011.4189-4-riku.voipio@linaro.org>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 25 Jan 2017 12:03:52 -0700
Message-ID: <CA+r1ZhgYussiiLqOdK=BxzW-xE3JLd6JkHXsetevV=-umdrGOw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] builddeb: add make fastdeb-pkg target
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, debian-kernel@lists.debian.org

On Mon, Jan 23, 2017 at 4:40 AM,  <riku.voipio@linaro.org> wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Currently, the deb-pkg and bindeb-pkg targets create multiple packages
> for the kernel binaries, headers, userspace headers and firmware.
>
> For developers who generate Debian packages as part of their development
> workflows, it's often not necessary to generate all these packages.
>
> Introduce new target, fastdeb-pkg, which only generates kernel packages.
> Re-order package build order so that kernel binary package is created
> first and we can exit cleanly unless generating rest packages with the
> old bindeb-pkg and deb-pkg targets.
>
> Cc: Jim Davis <jim.epost@gmail.com>
> Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
> v2: Update comments as suggested by Andrew
> ---
>  scripts/package/Makefile |  7 ++++++-
>  scripts/package/builddeb | 49 +++++++++++++++++++++++++-----------------------
>  2 files changed, 32 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 71b4a8af9d4d..fc86cc3ae222 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -97,6 +97,10 @@ bindeb-pkg: FORCE
>         $(MAKE) KBUILD_SRC=
>         +$(call cmd,builddeb)
>
> +fastdeb-pkg: FORCE
> +       $(MAKE) KBUILD_SRC=
> +       +$(call cmd,builddeb)
> +
>  clean-dirs += $(objtree)/debian/
>
>
> @@ -142,7 +146,8 @@ help: FORCE
>         @echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
>         @echo '  binrpm-pkg          - Build only the binary kernel RPM package'
>         @echo '  deb-pkg             - Build both source and binary deb kernel packages'
> -       @echo '  bindeb-pkg          - Build only the binary kernel deb package'
> +       @echo '  bindeb-pkg          - Build all binary kernel deb packages'
> +       @echo '  fastdeb-pkg         - Build only the binary kernel image deb package'
>         @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
>         @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
>         @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 15e69e45cada..c5dc455272ee 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -185,11 +185,6 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>         fi
>  fi
>
> -if [ "$ARCH" != "um" ]; then
> -       $MAKE headers_check KBUILD_SRC=
> -       $MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
> -fi
> -
>  # Install the maintainer scripts
>  # Note: hook scripts under /etc/kernel are also executed by official Debian
>  # kernel packages, as well as kernel packages built using make-kpkg.
> @@ -321,6 +316,32 @@ EOF
>
>  fi
>
> +# Move firmware out of kernel image package.
> +if [ -e "$tmpdir/lib/firmware" ]; then
> +       mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
> +       rmdir "$tmpdir/lib/firmware"
> +fi
> +
> +create_package "$packagename" "$tmpdir"
> +[ "x$1" = "xfastdeb-pkg" ] && exit 0
> +
> +if [ -e "$fwdir/lib/firmware/$version" ]; then
> +       cat <<EOF >> debian/control
> +
> +Package: $fwpackagename
> +Architecture: all
> +Description: Linux kernel firmware, version $version
> + This package contains firmware from the Linux kernel, version $version.
> +EOF
> +
> +       create_package "$fwpackagename" "$fwdir"
> +fi
> +
> +if [ "$ARCH" != "um" ]; then
> +       $MAKE headers_check KBUILD_SRC=
> +       $MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
> +fi
> +
>  # Build kernel header package
>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
> @@ -351,22 +372,6 @@ Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
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
> @@ -383,8 +388,6 @@ if [ "$ARCH" != "um" ]; then
>         create_package "$libc_headers_packagename" "$libc_headers_dir"
>  fi
>
> -create_package "$packagename" "$tmpdir"
> -
>  if [ -n "$BUILD_DEBUG" ] ; then
>         # Build debug package
>         # Different tools want the image in different locations
> --
> 2.11.0
>

Tested-by: Jim Davis <jim.epost@gmail.com>

-- 
Jim
