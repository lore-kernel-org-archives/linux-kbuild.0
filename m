Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36138 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756221AbaCNRSv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2014 13:18:51 -0400
Date: Fri, 14 Mar 2014 18:11:22 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 2/2] kbuild: docbook: specify KERNELDOC dependency
 correctly
Message-ID: <20140314171122.GC18789@sepie.suse.cz>
References: <1390194611-15102-1-git-send-email-yamada.m@jp.panasonic.com>
 <1390194611-15102-2-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1390194611-15102-2-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>

On Mon, Jan 20, 2014 at 02:10:11PM +0900, Masahiro Yamada wrote:
> It is not a good idea to describe
> 
>   %.xml: %.tmpl FORCE
>     ...
> 
> and
> 
>   $(BOOKS): $(KERNELDOC)
> 
> separately. This cannot detect missing template files.
> 
> For example, add something to DOCBOOKS variable:
>   DOCBOOKS += foobar.xml
> and run
>   make xmldocs
> 
> It will succeed even if Documention/DocBook/foobar.tmpl
> does not exist.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Applied to kbuild.git#kbuild, thanks.

Michal

> ---
>  Documentation/DocBook/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
> index 237f6dc..824d26a 100644
> --- a/Documentation/DocBook/Makefile
> +++ b/Documentation/DocBook/Makefile
> @@ -87,13 +87,9 @@ define rule_docproc
>          ) > $(dir $@).$(notdir $@).cmd
>  endef
>  
> -%.xml: %.tmpl FORCE
> +%.xml: %.tmpl $(KERNELDOC) $(DOCPROC) FORCE
>  	$(call if_changed_rule,docproc)
>  
> -###
> -# Changes in kernel-doc force a rebuild of all documentation
> -$(BOOKS): $(KERNELDOC)
> -
>  # Tell kbuild to always build the programs
>  always := $(hostprogs-y)
>  
> -- 
> 1.8.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
