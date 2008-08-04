Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:24788 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756130AbYHDVIu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Aug 2008 17:08:50 -0400
Date: Mon, 4 Aug 2008 23:09:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: annoying "trying to assign nonexistent symbol" warnings
Message-ID: <20080804210924.GB29902@uranus.ravnborg.org>
References: <20080801192220.GB19682@cs181140183.pp.htv.fi> <20080801193807.GA4441@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080801193807.GA4441@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org

On Fri, Aug 01, 2008 at 09:38:07PM +0200, Sam Ravnborg wrote:
> On Fri, Aug 01, 2008 at 10:22:20PM +0300, Adrian Bunk wrote:
> > Now that defconfig became less chatty the "trying to assign nonexistent symbol"
> > warnings become annoying: They are in practice not avoidable and give a 
> > false impression that something would have gone wrong.
> > 
> > If anyone already knows where to touch the code for disabling these 
> > warnings for defconfigs that would be appreciated, otherwise I'll cook
> > up a patch.
> 
> Last time I posted a patch to remove these warnings the feedback was
> that the warnings was used to say when a defconfig really needed an update.
> And the patch was buried inside another serie so I dropped it again.
> 
> IIRC I added this warning long time ago and Roman was not happy
> with it - and he was right then.
> 
> 	Sam
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 0759761..df6a188 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -222,10 +222,8 @@ load:
>  				continue;
>  			if (def == S_DEF_USER) {
>  				sym = sym_find(line + 9);
> -				if (!sym) {
> -					conf_warning("trying to assign nonexistent symbol %s", line + 9);
> +				if (!sym)
>  					break;
> -				}
>  			} else {
>  				sym = sym_lookup(line + 9, 0);
>  				if (sym->type == S_UNKNOWN)
> @@ -261,10 +259,8 @@ load:
>  			}
>  			if (def == S_DEF_USER) {
>  				sym = sym_find(line + 7);
> -				if (!sym) {
> -					conf_warning("trying to assign nonexistent symbol %s", line + 7);
> +				if (!sym)
>  					break;
> -				}
>  			} else {
>  				sym = sym_lookup(line + 7, 0);
>  				if (sym->type == S_UNKNOWN)

No commets to this - so I pushed it to Linus.

	Sam
