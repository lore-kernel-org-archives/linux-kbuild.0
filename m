Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fieldses.org ([174.143.236.118]:38541 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752928AbaFRP3N (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jun 2014 11:29:13 -0400
Date: Wed, 18 Jun 2014 11:29:12 -0400
From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: [PATCH] kbuild: Fix tar-pkg with relative $(objtree)
Message-ID: <20140618152912.GD17790@fieldses.org>
References: <20140617223854.GC6168@fieldses.org>
 <1403101583-15275-1-git-send-email-mmarek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403101583-15275-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 18, 2014 at 04:26:23PM +0200, Michal Marek wrote:
> Commit 7e1c0477 (kbuild: Use relative path for $(objtree)) assumes that
> the build process does not change its working directory. make tar-pkg
> was a couterexample, fix this by changing directory only for the tar
> command and not for the whole script, which at one point references the
> now relative $(objtree).

Works for me, thanks.--b.

> 
> Reported-by: "J. Bruce Fields" <bfields@fieldses.org>
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  scripts/package/buildtar | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 995c1ea..e046bff 100644
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -125,12 +125,11 @@ esac
>  # Create the tarball
>  #
>  (
> -	cd "${tmpdir}"
>  	opts=
>  	if tar --owner=root --group=root --help >/dev/null 2>&1; then
>  		opts="--owner=root --group=root"
>  	fi
> -	tar cf - boot/* lib/* $opts | ${compress} > "${tarball}${file_ext}"
> +	tar cf - -C "$tmpdir" boot/ lib/ $opts | ${compress} > "${tarball}${file_ext}"
>  )
>  
>  echo "Tarball successfully created in ${tarball}${file_ext}"
> -- 
> 1.9.2
> 
