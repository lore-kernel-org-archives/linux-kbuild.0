Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:44025 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751363Ab3FNOFB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 10:05:01 -0400
Date: Fri, 14 Jun 2013 13:55:59 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH v5 2/4] deb-pkg: split debug symbols in their own
 package
Message-ID: <20130614135559.GL23955@vostochny.stro.at>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
 <1371203217-19572-3-git-send-email-anisse@astier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371203217-19572-3-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

On Fri, Jun 14, 2013 at 11:46:55AM +0200, Anisse Astier wrote:
> This can reduce almost 3 times the size of the linux-image package,
> while keeping the debug symbols available for this particular build, in
> their own package.
> 
> This mimics the way kernels are built in debian, ubuntu, or with
> make-kpkg, and comes at the price of a small slowdown in the building of
> packages.
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> Cc: Ben Hutchings <ben@decadent.org.uk>
Acked-by: maximilian attems <max@stro.at>
> ---
>  scripts/package/builddeb | 50 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 6f21ad8..7c5703a 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -78,17 +78,21 @@ tmpdir="$objtree/debian/tmp"
>  fwdir="$objtree/debian/fwtmp"
>  kernel_headers_dir="$objtree/debian/hdrtmp"
>  libc_headers_dir="$objtree/debian/headertmp"
> +dbg_dir="$objtree/debian/dbgtmp"
>  packagename=linux-image-$version
>  fwpackagename=linux-firmware-image
>  kernel_headers_packagename=linux-headers-$version
>  libc_headers_packagename=linux-libc-dev
> +dbg_packagename=$packagename-dbg
>  
>  if [ "$ARCH" = "um" ] ; then
>  	packagename=user-mode-linux-$version
>  fi
>  
> +BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
> +
>  # Setup the directory structure
> -rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir"
> +rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir"
>  mkdir -m 755 -p "$tmpdir/DEBIAN"
>  mkdir -p  "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
>  mkdir -m 755 -p "$fwdir/DEBIAN"
> @@ -101,6 +105,10 @@ mkdir -p "$kernel_headers_dir/lib/modules/$version/"
>  if [ "$ARCH" = "um" ] ; then
>  	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
>  fi
> +if [ -n "$BUILD_DEBUG" ] ; then
> +	mkdir -p "$dbg_dir/usr/share/doc/$dbg_packagename"
> +	mkdir -m 755 -p "$dbg_dir/DEBIAN"
> +fi
>  
>  # Build and install the kernel
>  if [ "$ARCH" = "um" ] ; then
> @@ -128,6 +136,20 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>  		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$version/"
>  		rmdir "$tmpdir/lib/modules/$version"
>  	fi
> +	if [ -n "$BUILD_DEBUG" ] ; then
> +		(
> +			cd $tmpdir
> +			for module in $(find lib/modules/ -name *.ko); do
> +				mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
> +				# only keep debug symbols in the debug file
> +				objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
> +				# strip original module from debug symbols
> +				objcopy --strip-debug $module
> +				# then add a link to those
> +				objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
> +			done
> +		)
> +	fi
>  fi
>  
>  if [ "$ARCH" != "um" ]; then
> @@ -299,4 +321,30 @@ fi
>  
>  create_package "$packagename" "$tmpdir"
>  
> +if [ -n "$BUILD_DEBUG" ] ; then
> +	# Build debug package
> +	# Different tools want the image in different locations
> +	# perf
> +	mkdir -p $dbg_dir/usr/lib/debug/lib/modules/$version/
> +	cp vmlinux $dbg_dir/usr/lib/debug/lib/modules/$version/
> +	# systemtap
> +	mkdir -p $dbg_dir/usr/lib/debug/boot/
> +	ln -s ../lib/modules/$version/vmlinux $dbg_dir/usr/lib/debug/boot/vmlinux-$version
> +	# kdump-tools
> +	ln -s lib/modules/$version/vmlinux $dbg_dir/usr/lib/debug/vmlinux-$version
> +
> +	cat <<EOF >> debian/control
> +
> +Package: $dbg_packagename
> +Section: debug
> +Provides: linux-debug, linux-debug-$version
> +Architecture: any
> +Description: Linux kernel debugging symbols for $version
> + This package will come in handy if you need to debug the kernel. It provides
> + all the necessary debug symbols for the kernel and its modules.
> +EOF
> +
> +	create_package "$dbg_packagename" "$dbg_dir"
> +fi
> +
>  exit 0
> -- 
> 1.8.3.rc1
> 
