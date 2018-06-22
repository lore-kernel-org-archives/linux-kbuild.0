Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35845 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932973AbeFVRnN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 13:43:13 -0400
MIME-Version: 1.0
In-Reply-To: <20180608214746.136554-1-gthelen@google.com>
References: <20180608214746.136554-1-gthelen@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 23 Jun 2018 02:42:26 +0900
Message-ID: <CAK7LNARngmBXa5w3XFfuA7pEv39vWjJVNJ+3XVLPYd9QLH+f-A@mail.gmail.com>
Subject: Re: [PATCH] trace: fix SKIP_STACK_VALIDATION=1 build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Thelen <gthelen@google.com>
Cc: Andi Kleen <andi@firstfloor.org>, Steven Rostedt <rostedt@goodmis.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Michal Marek <michal.lkml@markovi.net>

2018-06-09 6:47 GMT+09:00 Greg Thelen <gthelen@google.com>:
> Non gcc-5 builds with CONFIG_STACK_VALIDATION=y and
> SKIP_STACK_VALIDATION=1 fail.
> Example output:
>   /bin/sh: init/.tmp_main.o: Permission denied
>
> commit 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace"),
> added a mismatched endif.  This causes cmd_objtool to get mistakenly
> set.
>
> Relocate endif to balance the newly added -record-mcount check.
>
> Fixes: 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace")
> Signed-off-by: Greg Thelen <gthelen@google.com>
> ---

Applied to linux-kbuild/fixes. Thanks!



>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 34d9e9ce97c2..e7889f486ca1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -239,6 +239,7 @@ cmd_record_mcount =                                         \
>              "$(CC_FLAGS_FTRACE)" ]; then                       \
>                 $(sub_cmd_record_mcount)                        \
>         fi;
> +endif # -record-mcount
>  endif # CONFIG_FTRACE_MCOUNT_RECORD
>
>  ifdef CONFIG_STACK_VALIDATION
> @@ -263,7 +264,6 @@ ifneq ($(RETPOLINE_CFLAGS),)
>    objtool_args += --retpoline
>  endif
>  endif
> -endif
>
>
>  ifdef CONFIG_MODVERSIONS
> --
> 2.18.0.rc1.242.g61856ae69a-goog
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
