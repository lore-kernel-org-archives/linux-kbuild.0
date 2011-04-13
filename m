Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:33559 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964779Ab1DMWr5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Apr 2011 18:47:57 -0400
Date: Wed, 13 Apr 2011 22:47:56 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
Message-ID: <20110413224756.GJ13777@vostochny.stro.at>
References: <4DA613A3.7070600@greenroomsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DA613A3.7070600@greenroomsoftware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert <robert@greenroomsoftware.com>
Cc: linux-kbuild@vger.kernel.org, robertcnelson@gmail.com

On Wed, Apr 13, 2011 at 05:20:35PM -0400, Robert wrote:
> This is my first patch, so hopefully I've done it correctly.  Details follow.

looks mostly good at a quick check,
please just fix 2 small critics and resubmit.
 
 
> scripts/package/builddeb script was setting the host machine
> $arch in the KERNEL/debian/control prior to an invocation of
> dpkg-gencontrol.  The patch modifies the script to guarantee the correct
> debian arch for the target is written to the control file instead.
> 
> Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>
> ---
>  scripts/package/builddeb |   70 +++++++++++++++++++++++----------------------
>  1 files changed, 36 insertions(+), 34 deletions(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f6cbc3d..2a15fda 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -26,37 +26,7 @@ create_package() {
>  	chmod -R go-w "$pdir"
>  
>  	# Attempt to find the correct Debian architecture
> -	local forcearch="" debarch=""
> -	case "$UTS_MACHINE" in
> -	i386|ia64|alpha)
> -		debarch="$UTS_MACHINE" ;;
> -	x86_64)
> -		debarch=amd64 ;;
> -	sparc*)
> -		debarch=sparc ;;
> -	s390*)
> -		debarch=s390 ;;
> -	ppc*)
> -		debarch=powerpc ;;
> -	parisc*)
> -		debarch=hppa ;;
> -	mips*)
> -		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
> -	arm*)
> -		debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
> -	*)
> -		echo "" >&2
> -		echo "** ** **  WARNING  ** ** **" >&2
> -		echo "" >&2
> -		echo "Your architecture doesn't have it's equivalent" >&2
> -		echo "Debian userspace architecture defined!" >&2
> -		echo "Falling back to using your current userspace instead!" >&2
> -		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
> -		echo "" >&2
> -	esac
> -	if [ -n "$KBUILD_DEBARCH" ] ; then
> -		debarch="$KBUILD_DEBARCH"
> -	fi
> +	local forcearch=""
>  	if [ -n "$debarch" ] ; then
>  		forcearch="-DArchitecture=$debarch"
>  	fi
> @@ -66,6 +36,38 @@ create_package() {
>  	dpkg --build "$pdir" ..
>  }
>  
> +#Set the correct debian arch
> +case "$UTS_MACHINE" in
> +i386|ia64|alpha)
> +    debarch="$UTS_MACHINE" ;;
> +x86_64)
> +    debarch=amd64 ;;
> +sparc*)
> +    debarch=sparc ;;
> +s390*)
> +    debarch=s390 ;;
> +ppc*)
> +    debarch=powerpc ;;
> +parisc*)
> +    debarch=hppa ;;
> +mips*)
> +    debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
> +arm*)
> +    debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
> +*)
> +    echo "" >&2
> +    echo "** ** **  WARNING  ** ** **" >&2
> +    echo "" >&2
> +    echo "Your architecture doesn't have it's equivalent" >&2
> +    echo "Debian userspace architecture defined!" >&2
> +    echo "Falling back to using your current userspace instead!" >&2
> +    echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
> +    echo "" >&2
> +esac
> +if [ -n "$KBUILD_DEBARCH" ] ; then
> +    debarch="$KBUILD_DEBARCH"
> +fi
> +

aboves is now all "whispace damaged", please use a tab for indentation.
every project has it's indendation rules and linux-2.6 enforces tab not
4 spaces like python.

>  # Some variables and settings used throughout the script
>  version=$KERNELRELEASE
>  revision=$(cat .version)
> @@ -252,9 +254,9 @@ cat <<EOF >> debian/control
>  
>  Package: $kernel_headers_packagename
>  Provides: linux-headers, linux-headers-2.6
> -Architecture: $arch
> -Description: Linux kernel headers for $KERNELRELEASE on $arch
> - This package provides kernel header files for $KERNELRELEASE on $arch
> +Architecture: $debarch
> +Description: Linux kernel headers for $KERNELRELEASE on $debarch
> + This package provides kernel header files for $KERNELRELEASE on $debarch
>   .
>   This is useful for people who need to build external modules
>  EOF
> -- 

Haven't applied the patch yet, but I remember a stupid dpkg arch call.
From a quick look aboves codeflow should make it unnecessary, speaking of:

arch=$(dpkg --print-architecture)

so please also remove it.

thank you.

-- 
maks
