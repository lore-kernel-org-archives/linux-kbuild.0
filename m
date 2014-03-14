Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36137 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756381AbaCNRSv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2014 13:18:51 -0400
Date: Fri, 14 Mar 2014 18:10:50 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/2] kbuild: docbook: include cmd files more simply
Message-ID: <20140314171050.GB18789@sepie.suse.cz>
References: <1390194611-15102-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1390194611-15102-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>

On Mon, Jan 20, 2014 at 02:10:10PM +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  Documentation/DocBook/Makefile | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Applied to kbuild.git#kbuild, thanks.

Michal
> 
> diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
> index 6ea50a3..237f6dc 100644
> --- a/Documentation/DocBook/Makefile
> +++ b/Documentation/DocBook/Makefile
> @@ -36,6 +36,7 @@ PS_METHOD	= $(prefer-db2x)
>  # The targets that may be used.
>  PHONY += xmldocs sgmldocs psdocs pdfdocs htmldocs mandocs installmandocs cleandocs
>  
> +targets += $(DOCBOOKS)
>  BOOKS := $(addprefix $(obj)/,$(DOCBOOKS))
>  xmldocs: $(BOOKS)
>  sgmldocs: xmldocs
> @@ -90,14 +91,6 @@ endef
>  	$(call if_changed_rule,docproc)
>  
>  ###
> -#Read in all saved dependency files
> -cmd_files := $(wildcard $(foreach f,$(BOOKS),$(dir $(f)).$(notdir $(f)).cmd))
> -
> -ifneq ($(cmd_files),)
> -  include $(cmd_files)
> -endif
> -
> -###
>  # Changes in kernel-doc force a rebuild of all documentation
>  $(BOOKS): $(KERNELDOC)
>  
> -- 
> 1.8.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
