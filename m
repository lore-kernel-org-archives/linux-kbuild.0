Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57153 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753610AbbIOO0y convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Sep 2015 10:26:54 -0400
Message-ID: <1442327207.29883.13.camel@decadent.org.uk>
Subject: Re: [PATCH] builddeb: remove debian/files before build
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 15 Sep 2015 15:26:47 +0100
In-Reply-To: <1442323587-21086-1-git-send-email-riku.voipio@linaro.org>
References: <1442323587-21086-1-git-send-email-riku.voipio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, dsmythies@telus.net

On Tue, 2015-09-15 at 16:26 +0300, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> As debian/files keeps accumulating entries, the changelog

The changes file, not the changelog.

> will end up growing indefinelty. Remove the file in clean
> rule and before build starts.
> 
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> Reported-by: Doug Smythies <dsmythies@telus.net>
> ---
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 0cd46e1..c9357df 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -115,7 +115,7 @@ esac
>  BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
>  
>  # Setup the directory structure
> -rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir"
> +rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" $objtree/debian/files
>  mkdir -m 755 -p "$tmpdir/DEBIAN"
>  mkdir -p "$tmpdir/lib" "$tmpdir/boot"
>  mkdir -p "$fwdir/lib/firmware/$version/"
> @@ -408,7 +408,7 @@ binary-arch:
>  	\$(MAKE) KDEB_SOURCENAME=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
>  
>  clean:
> -	rm -rf debian/*tmp
> +	rm -rf debian/*tmp files

debian/files, not just files.

Ben.

>  	mv debian/ debian.backup # debian/ might be cleaned away
>  	\$(MAKE) clean
>  	mv debian.backup debian

