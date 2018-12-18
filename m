Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42036 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeLROeL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Dec 2018 09:34:11 -0500
Received: by mail-qt1-f196.google.com with SMTP id d19so18330426qtq.9
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Dec 2018 06:34:11 -0800 (PST)
Message-ID: <1545143648.18411.20.camel@lca.pw>
Subject: Re: [PATCH] kbuild: fix false positive warning/error about missing
 libelf
From: Qian Cai <cai@lca.pw>
Date: Tue, 18 Dec 2018 09:34:08 -0500
In-Reply-To: <1545110741-10761-1-git-send-email-yamada.masahiro@socionext.com>
References: <1545110741-10761-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Tue, 2018-12-18 at 14:25 +0900, Masahiro Yamada wrote:
> For the same reason as commit 25896d073d8a ("x86/build: Fix compiler
> support check for CONFIG_RETPOLINE"), you cannot put this $(error ...)
> into the parse stage of the top Makefile.
> 
> Perhaps I'd propose a more sophisticated solution later, but this is
> the best I can do for now.
> 
> Link: https://lkml.org/lkml/2017/12/25/211
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Reported-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> Reported-by: Qian Cai <cai@lca.pw>
> Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 

Tested-by: Qian Cai <cai@lca.pw>

>  Makefile | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 56d5270..d45856f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -962,11 +962,6 @@ ifdef CONFIG_STACK_VALIDATION
>    ifeq ($(has_libelf),1)
>      objtool_target := tools/objtool FORCE
>    else
> -    ifdef CONFIG_UNWINDER_ORC
> -      $(error "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please
> install libelf-dev, libelf-devel or elfutils-libelf-devel")
> -    else
> -      $(warning "Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-
> dev, libelf-devel or elfutils-libelf-devel")
> -    endif
>      SKIP_STACK_VALIDATION := 1
>      export SKIP_STACK_VALIDATION
>    endif
> @@ -1125,6 +1120,14 @@ uapi-asm-generic:
>  
>  PHONY += prepare-objtool
>  prepare-objtool: $(objtool_target)
> +ifeq ($(SKIP_STACK_VALIDATION),1)
> +ifdef CONFIG_UNWINDER_ORC
> +	@echo "error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y,
> please install libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
> +	@false
> +else
> +	@echo "warning: Cannot use CONFIG_STACK_VALIDATION=y, please install
> libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
> +endif
> +endif
>  
>  # Generate some files
>  # ---------------------------------------------------------------------------
