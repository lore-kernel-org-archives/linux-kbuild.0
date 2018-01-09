Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64276 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750788AbeAII0x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jan 2018 03:26:53 -0500
MIME-Version: 1.0
In-Reply-To: <1515405841-2041-1-git-send-email-lukas.bulwahn@gmail.com>
References: <1513883429-9527-1-git-send-email-lukas.bulwahn@gmail.com> <1515405841-2041-1-git-send-email-lukas.bulwahn@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Jan 2018 17:26:00 +0900
Message-ID: <CAK7LNATXxndz6P1QXnzZA-MUDR1pzT_hMCJJQBaTwfjfHz5HkA@mail.gmail.com>
Subject: Re: [PATCH v3] fixdep: exit with error code in error branches of do_config_file()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicholas Mc Guire <der.herr@hofr.at>, sil2review@lists.osadl.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-08 19:04 GMT+09:00 Lukas Bulwahn <lukas.bulwahn@gmail.com>:
> do_config_file() should exit with an error code on internal run-time
> errors, and not return if it fails as then the error in do_config_file()
> would go unnoticed in the current code and allow the build to continue.
> The exit with error code will make the build fail in those very
> exceptional cases. If this occurs, this actually indicates a deeper
> problem in the execution of the kernel build process.
>
> Now, in these error cases, we do not explicitly free memory and close
> the file handlers in do_config_file(), as this is covered by exit().
>
> This issue in the fixdep script was introduced with its initial
> implementation back in 2002 by the original author Kai Germaschewski with
> this commit 04bd72170653 ("kbuild: Make dependencies at compile time")
> in the linux history git tree, i.e.,
> git://git.kernel.org/pub/scm/linux/kernel/git/history/history.git.
>
> This issue was identified during the review of a previous patch that
> intended to address a memory leak detected by a static analysis tool.
>
> Link: https://lkml.org/lkml/2017/12/14/736
>
> Suggested-by: Nicholas Mc Guire <der.herr@hofr.at>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> compile tested on top of next-20180108 with clang and gcc
> Changes in v2:
>   - no code change; only include proper Fixes tag and explain it
> Changes in v3:
>   - Clarify history commit reference and dropped Fixes tag
>   - Do not error on empty files (reverts one hunk of v2)
>
>  scripts/basic/fixdep.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index bbf62cb..86a61d6 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -290,13 +290,11 @@ static void do_config_file(const char *filename)
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
> 2.5.5
>

Applied to linux-kbuild/kbuid. Thanks!



-- 
Best Regards
Masahiro Yamada
