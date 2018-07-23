Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:46974 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731151AbeGWCtL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Jul 2018 22:49:11 -0400
MIME-Version: 1.0
In-Reply-To: <20180718091336.4540-1-dirk@gouders.net>
References: <20180718091336.4540-1-dirk@gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 23 Jul 2018 10:49:41 +0900
Message-ID: <CAK7LNATV+HW6=gX+Ax2RjS+8mOZ=tsM10ENXCd7qJK383tOg5g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: if_changed: document single use per target limitation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-18 18:13 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> Users of if_changed could easily feel invited to use it to divide a
> recipe into parts like:
>
> a: prereq FORCE
>         $(call if_changed,do_a)
>         $(call if_changed,do_b)
>
> But this is problematic, because if_changed should not be used more
> than once per target: in the above example, if_changed stores the
> command-line of the given command in .a.cmd and when a is up-to-date
> with respect to prereq, the file .a.cmd contains the command-line for
> the last command executed, i.e. do_b.
>
> When the recipe is then executed again, without any change of
> prerequisites, the command-line check for do_a will fail, do_a will be
> executed and stored in .a.cmd.  The next check, however, will still see
> the old content (the file isn't re-read) and if_changed will skip
> do_b, because the command-line test will not recognize a change.  On
> the next execution of the recipe the roles will flip: do_a is OK but
> do_b not and it will be executed.  And so on...
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---

Applied.  Thanks!


>  Documentation/kbuild/makefiles.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 048fc39a6b91..01fae5a01ce7 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -1105,6 +1105,12 @@ When kbuild executes, the following steps are followed (roughly):
>                 target: source(s) FORCE
>         #WRONG!#        $(call if_changed, ld/objcopy/gzip/...)
>
> +        Note: if_changed should not be used more than once per target.
> +              It stores the executed command in a corresponding .cmd
> +        file and multiple calls would result in overwrites and
> +        unwanted results when the target is up to date and only the
> +        tests on changed commands trigger execution of commands.
> +
>      ld
>         Link target. Often, LDFLAGS_$@ is used to set specific options to ld.
>
> --
> 2.16.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
