Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43276 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727589AbeLSQye (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Dec 2018 11:54:34 -0500
Date: Wed, 19 Dec 2018 10:54:28 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] kbuild: use -flive-patching when CONFIG_LIVEPATCH is
 enabled
Message-ID: <20181219165428.5udrppedpdvf2u7k@treble>
References: <20181219141744.32392-1-mbenes@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181219141744.32392-1-mbenes@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, jeyu@kernel.org, jikos@kernel.org, pmladek@suse.com, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 19, 2018 at 03:17:44PM +0100, Miroslav Benes wrote:
> GCC 9 introduces a new option, -flive-patching. It disables certain
> optimizations which could make a compilation unsafe for later live
> patching of the running kernel.
> 
> The option is used only if CONFIG_LIVEPATCH is enabled and $(CC)
> supports it.
> 
> Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index a0650bf79606..53f5ab810efe 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -778,6 +778,10 @@ KBUILD_CFLAGS_KERNEL	+= $(call cc-option,-ffunction-sections,)
>  KBUILD_CFLAGS_KERNEL	+= $(call cc-option,-fdata-sections,)
>  endif
>  
> +ifdef CONFIG_LIVEPATCH
> +KBUILD_CFLAGS += $(call cc-option, -flive-patching=inline-clone)
> +endif
> +
>  # arch Makefile may override CC so keep this after arch Makefile is included
>  NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)


This option only makes sense for source-based patch generation, so isn't
it a bit premature to make this change without proper source-based patch
tooling?

Also the commit message needs an analysis of the performance impacts.

-- 
Josh
