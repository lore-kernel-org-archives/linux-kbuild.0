Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36939 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750978Ab0EFOeg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 May 2010 10:34:36 -0400
Date: Thu, 6 May 2010 16:34:34 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Fix checking of scm-identifier variable
Message-ID: <20100506143434.GA7129@sepie.suse.cz>
References: <alpine.DEB.2.00.1004151459420.25805@chino.kir.corp.google.com>
 <4BC7A027.7060502@google.com>
 <alpine.DEB.2.00.1004151627290.9919@chino.kir.corp.google.com>
 <4BC7A757.4090205@google.com>
 <alpine.DEB.2.00.1004201347130.870@chino.kir.corp.google.com>
 <4BCE1883.6060307@google.com>
 <alpine.DEB.2.00.1004202224470.19920@chino.kir.corp.google.com>
 <xr93aasf2r93.fsf@ninji.mtv.corp.google.com>
 <alpine.DEB.2.00.1005041618170.1851@chino.kir.corp.google.com>
 <xr93fx261c13.fsf_-_@ninji.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xr93fx261c13.fsf_-_@ninji.mtv.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Thelen <gthelen@google.com>
Cc: David Rientjes <rientjes@google.com>, linux-kbuild@vger.kernel.org

On Wed, May 05, 2010 at 10:41:44AM -0700, Greg Thelen wrote:
> Michal,
> 
> I'm looking Makefile in the -mm branch (dated 2010-04-28-16-53) and
> seeing what looks like a bug in the checking of scm-identifier.  The
> "ifneq ($scm-identifier)" seems to always execute "ifeq
> ($(LOCALVERSION,)) ...".  This patch fixes the checking of
> scm-identifier.

Good catch, thanks!

Michal

> Signed-off-by: Greg Thelen <gthelen@google.com>
> Acked-by: David Rientjes <rientjes@google.com>
> 
> ---
>  Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6e8cc20..beeb757 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -943,7 +943,7 @@ endif
>  ifdef CONFIG_LOCALVERSION_AUTO
>  	localver-extra = $(scm-identifier)
>  else
> -	ifneq ($scm-identifier,)
> +	ifneq ($(scm-identifier),)
>  		ifeq ($(LOCALVERSION),)
>  			localver-extra = +
>  		endif
> -- 
> 1.7.0.1
> 
> --
> Greg
