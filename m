Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:57438 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965580AbeF0Qml (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jun 2018 12:42:41 -0400
MIME-Version: 1.0
In-Reply-To: <1529772111-5780-1-git-send-email-yamada.masahiro@socionext.com>
References: <1529772111-5780-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Jun 2018 01:41:44 +0900
Message-ID: <CAK7LNAT8qp2-mj4_miSJUojzZTty1gbh2YOOw4zAiLRBKXx0rA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reword help of LD_DEAD_CODE_DATA_ELIMINATION
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

2018-06-24 1:41 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Since commit 5d20ee3192a5 ("kbuild: Allow LD_DEAD_CODE_DATA_ELIMINATION
> to be selectable if enabled"), HAVE_LD_DEAD_CODE_DATA_ELIMINATION is
> supposed to be selected by architectures that are capable of this
> functionality.  LD_DEAD_CODE_DATA_ELIMINATION is now users' selection.
> Update the help message.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/fixes.

>  init/Kconfig | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index fde3d09..041f3a0 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1051,10 +1051,9 @@ config LD_DEAD_CODE_DATA_ELIMINATION
>         depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>         depends on EXPERT
>         help
> -         Select this if the architecture wants to do dead code and
> -         data elimination with the linker by compiling with
> -         -ffunction-sections -fdata-sections, and linking with
> -         --gc-sections.
> +         Enable this if you want to do dead code and data elimination with
> +         the linker by compiling with -ffunction-sections -fdata-sections,
> +         and linking with --gc-sections.
>
>           This can reduce on disk and in-memory size of the kernel
>           code and static data, particularly for small configs and
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
