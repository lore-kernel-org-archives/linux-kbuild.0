Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:44392 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753159Ab3FNPhX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 11:37:23 -0400
Date: Fri, 14 Jun 2013 15:37:22 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH v5 4/4] deb-pkg: add a hook argument to match debian
 hooks parameters
Message-ID: <20130614153721.GN23955@vostochny.stro.at>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
 <1371203217-19572-5-git-send-email-anisse@astier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371203217-19572-5-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

On Fri, Jun 14, 2013 at 11:46:57AM +0200, Anisse Astier wrote:
> We now provide the installed image path to the kernel hooks.
> 
> This should allow the package to better integrate with debian hooks, and
> should not be too disruptive of hooks supporting only one parameter.
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
Acked-by: maximilian attems <max@stro.at>
> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 0dbada8..06cd0c7 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -184,7 +184,7 @@ set -e
>  # Pass maintainer script parameters to hook scripts
>  export DEB_MAINT_PARAMS="\$*"
>  
> -test -d $debhookdir/$script.d && run-parts --arg="$version" $debhookdir/$script.d
> +test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
>  exit 0
>  EOF
>  	chmod 755 "$tmpdir/DEBIAN/$script"
> -- 
> 1.8.3.rc1
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-kernel-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
> Archive: http://lists.debian.org/1371203217-19572-5-git-send-email-anisse@astier.eu
> 
