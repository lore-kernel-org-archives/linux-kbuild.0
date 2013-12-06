Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:48911 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751895Ab3LFBfj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 20:35:39 -0500
Received: by mail-qc0-f175.google.com with SMTP id e9so22693qcy.20
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Dec 2013 17:35:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>
References: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>
Date: Fri, 6 Dec 2013 09:35:38 +0800
Message-ID: <CABsPBHr2geiFPL9QtgBb4c6UnABxdpt=VpEEh_ue8a7_VQdLjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] deb-pkg: Fix cross-building linux-headers package
From: "Niew, Sh." <shniew@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On Thu, Dec 5, 2013 at 10:37 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> builddeb generates a control file that says the linux-headers package
> can only be built for the build system primary architecture.  This
> breaks cross-building configurations.  We should use $debarch for this
> instead.
>
> Since $debarch is not yet set when generating the control file, set
> Architecture: any and use control file variables to fill in the
> description.
>
> Fixes: cd8d60a20a45 ('kbuild: create linux-headers package in deb-pkg')
> Reported-by: "Niew, Sh." <shniew@gmail.com>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  scripts/package/builddeb | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 90e521f..301acdc 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -62,7 +62,7 @@ create_package() {
>         fi
>
>         # Create the package
> -       dpkg-gencontrol -isp $forcearch -p$pname -P"$pdir"
> +       dpkg-gencontrol -isp $forcearch -Vkernel:debarch="${debarch:-$(dpkg --print-architecture)}" -p$pname -P"$pdir"
>         dpkg --build "$pdir" ..
>  }
>
> @@ -288,15 +288,14 @@ mkdir -p "$destdir"
>  (cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
>  ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
>  rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
> -arch=$(dpkg --print-architecture)
>
>  cat <<EOF >> debian/control
>
>  Package: $kernel_headers_packagename
>  Provides: linux-headers, linux-headers-2.6
> -Architecture: $arch
> -Description: Linux kernel headers for $KERNELRELEASE on $arch
> - This package provides kernel header files for $KERNELRELEASE on $arch
> +Architecture: any
> +Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
> + This package provides kernel header files for $KERNELRELEASE on \${kernel:debarch}
>   .
>   This is useful for people who need to build external modules
>  EOF

I can't patch this to my linux-3.2.y tree which i clone from linux-stable
I check that the patches number line are different...
What i missed?


Sh. Niew
