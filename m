Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:56877 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754551Ab3JGNsq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Oct 2013 09:48:46 -0400
Date: Mon, 7 Oct 2013 15:38:35 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH 2/2] deb-pkg: Add automatic support for s390x architecture
Message-ID: <20131007133835.GI11166@stro.at>
References: <1381079114.2788.26.camel@deadeye.wl.decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381079114.2788.26.camel@deadeye.wl.decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, debian-s390@lists.debian.org

On Sun, Oct 06, 2013 at 06:05:14PM +0100, Ben Hutchings wrote:
> The Debian s390x architecture has 64-bit userland whereas s390 has
> 32-bit userland.  A 64-bit kernel can be used with either.  Now that
> Debian supports multiarch and officially supports s390x, it makes more
> sense to assign a 64-bit kernel package to s390x.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Acked-by: maximilian attems <max@stro.at>
> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index e14c56e..25c5abd 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -35,7 +35,7 @@ create_package() {
>  	sparc*)
>  		debarch=sparc ;;
>  	s390*)
> -		debarch=s390 ;;
> +		debarch=s390$(grep -q CONFIG_64BIT=y $KCONFIG_CONFIG && echo x) ;;
>  	ppc*)
>  		debarch=powerpc ;;
>  	parisc*)
> 
> -- 
> Ben Hutchings
> Who are all these weirdos? - David Bowie, reading IRC for the first time


