Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40340 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752836Ab2HaNpa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Aug 2012 09:45:30 -0400
Message-ID: <5040BFF3.6050705@suse.cz>
Date: Fri, 31 Aug 2012 15:45:23 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Add mach-specific includes
References: <1344764843-2179-1-git-send-email-tzafrir.cohen@xorcom.com>
In-Reply-To: <1344764843-2179-1-git-send-email-tzafrir.cohen@xorcom.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tzafrir Cohen <tzafrir.cohen@xorcom.com>
Cc: Linux Kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, maximilian attems <max@stro.at>

Adding Max.

On 12.8.2012 11:47, Tzafrir Cohen wrote:
> When building a deb package, the linux-headers package should also
> add arch/$ARCH/mach-*/include Required for arm and probably some
> other architectures: avr32 and blackfin.
> 
> This is needed to allow building modules using the headers package.
> 
> Signed-off-by: Tzafrir Cohen <tzafrir.cohen@xorcom.com>
> ---
>  scripts/package/builddeb |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index acb8650..16f8c1a 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -245,6 +245,9 @@ fi
>  # Build header package
>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
>  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
> +if echo arch/$SRCARCH/mach-*/include | grep q -v '*'; then

This should probably be grep -q, but it's quite ugly anyway. You can
simply run the find command and redirect it's stderr to /dev/null.

Michal

> +	(cd $srctree; find arch/$SRCARCH/mach-*/include -type f >> "$objtree/debian/hdrsrcfiles")
> +fi
>  (cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
> 


