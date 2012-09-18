Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:42155 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755839Ab2IRQLZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Sep 2012 12:11:25 -0400
From: Mark Asselstine <mark.asselstine@windriver.com>
Subject: RE: [PATCH] firmware: fix directory creation rule matching with make 3.80
Date: Tue, 18 Sep 2012 12:09:51 -0400
Message-ID: <1347984591-11064-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1347975403-30332-1-git-send-email-mark.asselstine@windriver.com>
References: <1347975403-30332-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, JBeulich@suse.com, dwmw2@infradead.org
Cc: linux-kbuild@vger.kernel.org, mark.asselstine@windriver.com

> commit 6c7080a61fc7 [firmware: fix directory creation rule matching
> with make 3.82] broke builds with make 3.80. This is caused by the
> literal substitution behaving differently with this version of
> make. The following works with make 3.82, 3.81 and 3.80.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> 
> Jan I was able to reproduce your error and this change fixes it, can
> you try this out? I would prefer to keep things working with the
> latest versions of make. I am still looking into any possible
> consequences of removing the double dollar sign.
> 
>  scripts/Makefile.fwinst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
> index c3f69ae..e264fab 100644
> --- a/scripts/Makefile.fwinst
> +++ b/scripts/Makefile.fwinst
> @@ -42,7 +42,7 @@ quiet_cmd_install = INSTALL $(subst $(srctree)/,,$@)
>  $(installed-fw-dirs):
>  	$(call cmd,mkdir)
>  
> -$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $$(dir $(INSTALL_FW_PATH)/%)
> +$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $(dir $(INSTALL_FW_PATH)/%)

Actually I believe this should be
+$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $(dir $(INSTALL_FW_PATH)/$$(%))

I have added David Woodhouse to the TO list as he has made similar
changes in the past and I would like to get his input on this as I
haven't been able to figure out the double dollar sign use here.

Regards,
Mark

>  	$(call cmd,install)
>  
>  PHONY +=  __fw_install __fw_modinst FORCE
> -- 
> 1.7.9.5

