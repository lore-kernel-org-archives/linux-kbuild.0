Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:60066 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdL3QwU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Dec 2017 11:52:20 -0500
MIME-Version: 1.0
In-Reply-To: <1513883429-9527-1-git-send-email-lukas.bulwahn@gmail.com>
References: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com> <1513883429-9527-1-git-send-email-lukas.bulwahn@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 31 Dec 2017 01:51:33 +0900
Message-ID: <CAK7LNAROjcbES8-debAnzVz1EV1Ar+RLW8phF5+bQxpHQUODKQ@mail.gmail.com>
Subject: Re: [PATCH v2] fixdep: exit with error code in error branches of do_config_file()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicholas Mc Guire <der.herr@hofr.at>, sil2review@lists.osadl.org, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-12-22 4:10 GMT+09:00 Lukas Bulwahn <lukas.bulwahn@gmail.com>:
> do_config_file() should exit with an error code, and not return if it fails
> as then the error in do_config_file() would go unnoticed in the current
> code and allow the build to continue. The exit with error code will make
> the build fail in those very exceptional cases. If this occurs, this
> actually indicates a deeper problem in the execution of the kernel build
> process.
>
> Now, that the function exists, we do not explicitly free memory and close
> the file handlers in do_config_file(), as this is covered by exit().
>
> This issue in the fixdep script was introduced with its initial
> implementation back in 2002 by the original author Kai Germaschewski with
> this commit 04bd72170653 ("kbuild: Make dependencies at compile time").

"04bd72170653" is just confusing.

If you really want to mention this hash,
please clearly say it is in the history repository
outside of this.


> This issue was identified during the review of a previous patch that
> intended to address a memory leak detected by a static analysis tool.
>
> Link: https://lkml.org/lkml/2017/12/14/736
>
> Fixes: 04bd72170653 ("kbuild: Make dependencies at compile time")

Please drop this pointless Fixes tag
because that commit is not reachable from this patch.



> Suggested-by: Nicholas Mc Guire <der.herr@hofr.at>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> compile tested on top of next-20171220 with clang and gcc
> Change in v2:
>   - no code change; only include proper Fixes tag and explain it
>
>  scripts/basic/fixdep.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index bbf62cb..4274610 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -284,19 +284,18 @@ static void do_config_file(const char *filename)
>                 exit(2);
>         }
>         if (st.st_size == 0) {
> -               close(fd);
> -               return;
> +               fprintf(stderr, "fixdep: error empty file config file: ");
> +               perror(filename);
> +               exit(2);
>         }

No.  This is correct as-is.

do_config_file() does not parse .cmd files
but parse source files (.c .h .S etc.)

Having an empty source file is rare, but possible.






>         map = malloc(st.st_size + 1);
>         if (!map) {
>                 perror("fixdep: malloc");
> -               close(fd);
> -               return;
> +               exit(2);
>         }
>         if (read(fd, map, st.st_size) != st.st_size) {
>                 perror("fixdep: read");
> -               close(fd);
> -               return;
> +               exit(2);
>         }
>         map[st.st_size] = '\0';
>         close(fd);
> --
> 2.7.4
>

These two changes are OK.



-- 
Best Regards
Masahiro Yamada
