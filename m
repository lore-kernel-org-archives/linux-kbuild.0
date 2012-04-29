Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:36617 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752658Ab2D2Jo2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Apr 2012 05:44:28 -0400
Date: Sun, 29 Apr 2012 11:44:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: jobserver disabled for make tar*-pkg
Message-ID: <20120429094426.GA7859@merkur.ravnborg.org>
References: <20120429082542.GM27374@one.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120429082542.GM27374@one.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org

On Sun, Apr 29, 2012 at 10:25:42AM +0200, Andi Kleen wrote:
> 
> When I do make -jX tar*-pkg make complains that the job server 
> disabled and I should add + to the target rule. I tried this patch,
> but the message still happens. Anyone knows where the real target
> rule is and can fix it please?
> 
> -Andi
> 
> (cut'n'pasted, just for illustration)
> 
> iff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 87bf080..212ee19 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -105,8 +105,8 @@ clean-dirs += $(objtree)/debian/
>  # tarball targets
>  # ---------------------------------------------------------------------------
>  tar%pkg: FORCE
> -       $(MAKE) KBUILD_SRC=
> -       $(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
> +       +$(MAKE) KBUILD_SRC=
> +       +$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
>  
>  clean-dirs += $(objtree)/tar-install/

For the following comamnd:

    make O=o -j8 tar-pkg

your patch fixed the annoying warning?!?
So it seems to work for me.

	Sam
