Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52894 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751396Ab2F1JGe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jun 2012 05:06:34 -0400
Message-ID: <4FEC1E92.5070005@suse.cz>
Date: Thu, 28 Jun 2012 11:06:26 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: add a rule to just create one file for kernel
 doc
References: <1340732427-3747-1-git-send-email-sebastian@breakpoint.cc>
In-Reply-To: <1340732427-3747-1-git-send-email-sebastian@breakpoint.cc>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>

On 26.6.2012 19:40, Sebastian Andrzej Siewior wrote:
> If you are chaning the file and you want to verify that it looks good it
> is helpfull to just re-run for the single file instead of running the
> complete htmldocs target.
> 
> With this patch one can run
> |	make drivers/mtd/ubi/wl.html
> and create the output just for this file.

Sounds useful.


> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index ff1720d..75a1823 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -209,6 +209,12 @@ cmd_cc_i_c       = $(CPP) $(c_flags)   -o $@ $<
>  $(obj)/%.i: $(src)/%.c FORCE
>  	$(call if_changed_dep,cc_i_c)
>  
> +quiet_cmd_doc_html_c	= HTML $@
> +cmd_doc_html_c		= $(srctree)/scripts/kernel-doc -html $< > $@
> +
> +$(obj)/%.html: $(src)/%.c FORCE
> +	$(call if_changed,doc_html_c)
> +

Could you add this rule to Documentation/DocBook/Makefile instead, so
that scripts/Makefile.build is not needlessly polluted with stuff not
related to compiling and linking?

Thanks!
Michal
