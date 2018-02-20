Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43412 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750988AbeBTJdQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 04:33:16 -0500
MIME-Version: 1.0
In-Reply-To: <20180216214117.1947175-2-arnd@arndb.de>
References: <20180216214117.1947175-1-arnd@arndb.de> <20180216214117.1947175-2-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Feb 2018 18:32:31 +0900
Message-ID: <CAK7LNASG34OhzKbMLUdTU_hjcD4598m9k01cVEGPjTeJO5YLgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Kconfig: disable PROFILE_ALL_BRANCHES for compile testing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>

2018-02-17 6:41 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> This can easily double the time for compiling a driver but does not
> provide any benefit for the compile tester, so it's better left disabled.
>
> In addition, any 'inline' function that is not also 'static' and that
> contains an 'if' causes a warning like
>
> include/linux/string.h:212:2: note: in expansion of macro 'if'
>   if (strscpy(p, q, p_size < q_size ? p_size : q_size) < 0)
>   ^~
> include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'strcpy' which is not static
>
> without this patch, and I could not come up with a nice fix for that.
> In combination with my patch to always enable 'CONFIG_COMPILE_TEST'
> during 'randconfig' builds, we can at least hide these warnings for
> most users.
>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


I took a look at this just in case
because the subject is prefixed with "Kconfig:",
but it is actually "trace:".

I expect "Kconfig:" for core changes of Kconfig.

Using precise patch prefix would get more attention from
right people.




> ---
>  kernel/trace/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 434c840e2d82..faaf687b13b1 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -345,6 +345,7 @@ config PROFILE_ANNOTATED_BRANCHES
>  config PROFILE_ALL_BRANCHES
>         bool "Profile all if conditionals"
>         select TRACE_BRANCH_PROFILING
> +       depends on !COMPILE_TEST
>         help
>           This tracer profiles all branch conditions. Every if ()
>           taken in the kernel is recorded whether it hit or miss.
> --
> 2.9.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
