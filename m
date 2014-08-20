Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51684 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751744AbaHTTrE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Aug 2014 15:47:04 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 3/3] modsign: lookup lines ending in .ko in .mod files
In-Reply-To: <1408474660-24999-4-git-send-email-beber@meleeweb.net>
References: <1408474660-24999-1-git-send-email-beber@meleeweb.net> <1408474660-24999-4-git-send-email-beber@meleeweb.net>
Date: Thu, 21 Aug 2014 01:36:50 +0930
Message-ID: <87wqa3i1r9.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bertrand Jacquin <beber@meleeweb.net>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>

Bertrand Jacquin <beber@meleeweb.net> writes:
> This does the same as commit ef591a5 (scripts/Makefile.modpost: error
> in finding modules from .mod files), but for scripts/Makefile.modsign
>
> Maybe we should also apply to Makefile.modsign and Makefile.modinst
> the change applied to Makefile.modpost by commit ea4054a (modpost:
> handle huge numbers of modules) ?

Probably, yes.

Applied!
Rusty.

>
> Reviewed-by: Willy Tarreau <w@1wt.eu>
> Signed-off-by: Bertrand Jacquin <beber@meleeweb.net>
> ---
>  scripts/Makefile.modsign | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modsign b/scripts/Makefile.modsign
> index abfda62..b6ac708 100644
> --- a/scripts/Makefile.modsign
> +++ b/scripts/Makefile.modsign
> @@ -7,7 +7,7 @@ __modsign:
>  
>  include scripts/Kbuild.include
>  
> -__modules := $(sort $(shell grep -h '\.ko' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
> +__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
>  modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
>  
>  PHONY += $(modules)
> -- 
> 2.0.4
