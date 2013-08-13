Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38378 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759037Ab3HMUVB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Aug 2013 16:21:01 -0400
Message-ID: <520A9528.4000309@suse.cz>
Date: Tue, 13 Aug 2013 22:20:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Provide version number for Debian firmware package
References: <1376250919-13886-1-git-send-email-xypron.glpk@gmx.de>
In-Reply-To: <1376250919-13886-1-git-send-email-xypron.glpk@gmx.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Ben Hutchings <ben@decadent.org.uk>

Dne 11.8.2013 21:55, Heinrich Schuchardt napsal(a):
> scripts/package/builddeb is used to create Debian packages.
> Currently the firmware package always gets the same version number
> irrespective of the Kernel version.
> The paths inside the firmware package depend on the Kernel
> version.
> 
> With the patch supplied the Kernel version becomes part of the
> Debian firmware package number.

Ben, Max, is this how the official linux-firmware-image package is built
in Debian? The change makes sense to me.

Michal


> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  scripts/package/builddeb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index acb8650..4ca6111 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -79,7 +79,7 @@ fwdir="$objtree/debian/fwtmp"
>  kernel_headers_dir="$objtree/debian/hdrtmp"
>  libc_headers_dir="$objtree/debian/headertmp"
>  packagename=linux-image-$version
> -fwpackagename=linux-firmware-image
> +fwpackagename=linux-firmware-image-$version
>  kernel_headers_packagename=linux-headers-$version
>  libc_headers_packagename=linux-libc-dev
>  
> 

