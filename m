Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:50581 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752182Ab0DZWXu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Apr 2010 18:23:50 -0400
Received: from ::ffff:64.134.236.53 ([64.134.236.53]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Mon, 26 Apr 2010 15:23:41 -0700
Message-ID: <4BD61266.5020905@xenotime.net>
Date: Mon, 26 Apr 2010 15:23:34 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] Add targets to use the Coccinelle checker
References: <1272316279-12042-1-git-send-email-npalix@diku.dk> <1272316279-12042-2-git-send-email-npalix@diku.dk> <1272317821.15953.107.camel@Joe-Laptop.home> <201004270020.09447.npalix@diku.dk>
In-Reply-To: <201004270020.09447.npalix@diku.dk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Palix <npalix@diku.dk>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk

Nicolas Palix wrote:

> diff --git a/Makefile b/Makefile
> index 67c1001..293c88b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1424,6 +1425,14 @@ versioncheck:
>  		-name '*.[hcS]' -type f -print | sort \
>  		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
>  
> +coccicheck-context coccicheck-patch coccicheck-org coccicheck-report:
> +	@echo "\nPlease check for false positive in the output before submitting a patch.\n\n"\

	                                positives

> +		"Take particularly attention when using the \"patch\" mode\n"\

		      particular

> +		"and carefully review the patch you are about to submit.\n"
> +	@find $(srctree)/scripts/smpl/                        \
> +		-name '*.cocci' -type f                       \
> +		-exec $(srctree)/scripts/spatch.sh $(SPATCH) $(@:coccicheck-%=%) \{} $(srctree) \;
> +
>  namespacecheck:
>  	$(PERL) $(srctree)/scripts/namespace.pl
>  

