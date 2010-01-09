Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34586 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753257Ab0AIBIU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Jan 2010 20:08:20 -0500
Message-ID: <4B47D6E3.8080300@redhat.com>
Date: Fri, 08 Jan 2010 20:07:47 -0500
From: Masami Hiramatsu <mhiramat@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile: do not override LC_CTYPE
References: <20100108115745.GA14758@sepie.suse.cz> <1262952988-16563-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <1262952988-16563-1-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Simon Horman <horms@verge.net.au>, Roland Dreier <rdreier@cisco.com>, Sam Ravnborg <sam@ravnborg.org>, Sergei Trofimovich <slyfox@inbox.ru>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org

Michal Marek wrote:
> Setting LC_CTYPE=C breaks localized messages in some setups. With only
> LC_COLLATE=C and LC_NUMERIC=C, we get almost all we need, except for not
> so defined character classes and tolower()/toupper(). The former is not
> a big issue, because we can assume that e.g. [:alpha:] will always
> include a-zA-Z and we only ever process ASCII input. The latter seems
> only affect arch/sh/tools/gen-mach-types, which we can handle separately.
> 
> So after this patch the meaning of ranges like [a-z], the behavior of
> sort and join, etc. should be the same everywhere and at the same time
> gcc should be able to print localized waring and error messages.
> LC_NUMERIC=C might not be necessary, but setting it doesn't hurt.
> 
> Reported-by: Simon Horman <horms@verge.net.au>
> Reported-by: Sergei Trofimovich <slyfox@inbox.ru>
> Signed-off-by: Michal Marek <mmarek@suse.cz>

I checked that this change doesn't affect arch/x86/tools/gen-insn-attr-x86.awk.

Tested-by: Masami Hiramatsu <mhiramat@redhat.com>

Thank you!


> ---
> 
> Note: if this still breaks for someone, we will simply set LC_ALL=C.
> 
>  Makefile               |    3 +--
>  arch/sh/tools/Makefile |    2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 09a320f..a7b4351 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -18,10 +18,9 @@ MAKEFLAGS += -rR --no-print-directory
>  
>  # Avoid funny character set dependencies
>  unexport LC_ALL
> -LC_CTYPE=C
>  LC_COLLATE=C
>  LC_NUMERIC=C
> -export LC_CTYPE LC_COLLATE LC_NUMERIC
> +export LC_COLLATE LC_NUMERIC
>  
>  # We are using a recursive build, so we need to do a little thinking
>  # to get the ordering right.
> diff --git a/arch/sh/tools/Makefile b/arch/sh/tools/Makefile
> index 558a56b..2082af1 100644
> --- a/arch/sh/tools/Makefile
> +++ b/arch/sh/tools/Makefile
> @@ -13,4 +13,4 @@
>  include/generated/machtypes.h: $(src)/gen-mach-types $(src)/mach-types
>  	@echo '  Generating $@'
>  	$(Q)mkdir -p $(dir $@)
> -	$(Q)$(AWK) -f $^ > $@ || { rm -f $@; /bin/false; }
> +	$(Q)LC_ALL=C $(AWK) -f $^ > $@ || { rm -f $@; /bin/false; }

-- 
Masami Hiramatsu

Software Engineer
Hitachi Computer Products (America), Inc.
Software Solutions Division

e-mail: mhiramat@redhat.com

