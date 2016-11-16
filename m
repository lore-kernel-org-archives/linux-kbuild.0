Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34648 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752097AbcKPQbm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Nov 2016 11:31:42 -0500
MIME-Version: 1.0
In-Reply-To: <20161114024749.25488-2-andrew.donnellan@au1.ibm.com>
References: <20161114024749.25488-1-andrew.donnellan@au1.ibm.com> <20161114024749.25488-2-andrew.donnellan@au1.ibm.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 16 Nov 2016 09:31:41 -0700
Message-ID: <CA+r1ZhhB+vThR0io8NMGvB42Gyu+fp7QjwhR=una__C8hZ=bnA@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] builddeb: allow building without
 headers/firmware packages
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, Nov 13, 2016 at 7:47 PM, Andrew Donnellan
<andrew.donnellan@au1.ibm.com> wrote:
> Currently, the deb-pkg and bindeb-pkg targets create multiple packages for
> the kernel binaries, headers, userspace headers and firmware.
>
> For developers who generate Debian packages as part of their development
> workflows, it's often not necessary to generate all these packages.
>
> Allow the creation of the linux-headers, linux-libc-dev and linux-firmware
> packages to be disabled if the environment variables KDEB_NO_HEADERS,
> KDEB_NO_LIBC_HEADERS or KDEB_NO_FIRMWARE are non-empty.
>
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> ---
>  Documentation/kbuild/kbuild.txt |  7 +++++
>  scripts/package/builddeb        | 67 ++++++++++++++++++++++++-----------------
>  2 files changed, 46 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
> index 0ff6a46..cef4f7f 100644
> --- a/Documentation/kbuild/kbuild.txt
> +++ b/Documentation/kbuild/kbuild.txt
> @@ -238,3 +238,10 @@ KBUILD_VMLINUX_MAIN
>  All object files for the main part of vmlinux.
>  KBUILD_VMLINUX_INIT and KBUILD_VMLINUX_MAIN together specify
>  all the object files used to link vmlinux.
> +
> +KDEB_NO_HEADERS, KDEB_NO_LIBC_HEADERS, KDEB_NO_FIRMWARE
> +-------------------------------------------------------
> +If these variables are set, the deb-pkg and bindeb-pkg targets won't create
> +linux-headers, linux-libc-dev and linux-firmware packages respectively. This
> +may be useful for developers who use the deb-pkg targets in their workflow
> +but don't need the full set of packages.
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index d600fd0..da595da 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -187,7 +187,9 @@ fi
>
>  if [ "$ARCH" != "um" ]; then
>         $MAKE headers_check KBUILD_SRC=
> -       $MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
> +       if [ -z "$KDEB_NO_LIBC_HEADERS" ]; then
> +               $MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
> +       fi
>  fi
>
>  # Install the maintainer scripts
> @@ -324,26 +326,27 @@ EOF
>  fi
>
>  # Build kernel header package
> -(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
> -(cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
> -(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
> -(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
> -if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
> -       (cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
> -fi
> -(cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
> -if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
> -       (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> -fi
> -destdir=$kernel_headers_dir/usr/src/linux-headers-$version
> -mkdir -p "$destdir"
> -(cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd $destdir; tar -xf -)
> -(cd $objtree; tar -c -f - -T -) < "$objtree/debian/hdrobjfiles" | (cd $destdir; tar -xf -)
> -(cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
> -ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
> -rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
> +if [ -z "$KDEB_NO_HEADERS" ]; then
> +       (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
> +       (cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
> +       (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
> +       (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
> +       if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
> +               (cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
> +       fi
> +       (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
> +       if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
> +               (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> +       fi
> +       destdir=$kernel_headers_dir/usr/src/linux-headers-$version
> +       mkdir -p "$destdir"
> +       (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd $destdir; tar -xf -)
> +       (cd $objtree; tar -c -f - -T -) < "$objtree/debian/hdrobjfiles" | (cd $destdir; tar -xf -)
> +       (cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
> +       ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
> +       rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
>
> -cat <<EOF >> debian/control
> +       cat <<EOF >> debian/control
>
>  Package: $kernel_headers_packagename
>  Provides: linux-headers, linux-headers-2.6
> @@ -353,13 +356,13 @@ Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
>   .
>   This is useful for people who need to build external modules
>  EOF
> +fi
>
>  # Do we have firmware? Move it out of the way and build it into a package.
>  if [ -e "$tmpdir/lib/firmware" ]; then
> -       mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
> -       rmdir "$tmpdir/lib/firmware"
> -
> -       cat <<EOF >> debian/control
> +       if [ -z "$KDEB_NO_FIRMWARE" ]; then
> +               mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
> +               cat <<EOF >> debian/control
>
>  Package: $fwpackagename
>  Architecture: all
> @@ -367,10 +370,13 @@ Description: Linux kernel firmware, version $version
>   This package contains firmware from the Linux kernel, version $version.
>  EOF
>
> -       create_package "$fwpackagename" "$fwdir"
> +               create_package "$fwpackagename" "$fwdir"
> +       fi
> +       rm -r "$tmpdir/lib/firmware"
>  fi
>
> -cat <<EOF >> debian/control
> +if [ -z "$KDEB_NO_LIBC_HEADERS" ]; then
> +       cat <<EOF >> debian/control
>
>  Package: $libc_headers_packagename
>  Section: devel
> @@ -380,10 +386,15 @@ Description: Linux support headers for userspace development
>   This package provides userspaces headers from the Linux kernel.  These headers
>   are used by the installed headers for GNU glibc and other system libraries.
>  EOF
> +fi
>
>  if [ "$ARCH" != "um" ]; then
> -       create_package "$kernel_headers_packagename" "$kernel_headers_dir"
> -       create_package "$libc_headers_packagename" "$libc_headers_dir"
> +       if [ -z "$KDEB_NO_HEADERS" ]; then
> +               create_package "$kernel_headers_packagename" "$kernel_headers_dir"
> +       fi
> +       if [ -z "$KDEB_NO_LIBC_HEADERS" ]; then
> +               create_package "$libc_headers_packagename" "$libc_headers_dir"
> +       fi
>  fi
>
>  create_package "$packagename" "$tmpdir"
> --
> Andrew Donnellan              OzLabs, ADL Canberra
> andrew.donnellan@au1.ibm.com  IBM Australia Limited
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Worked fine with Ubuntu 16.04, and it's nice speedup.

Tested-by: Jim Davis <jim.epost@gmail.com>

-- 
Jim
