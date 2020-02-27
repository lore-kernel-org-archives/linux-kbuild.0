Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:53132 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730420AbgB0QpG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 11:45:06 -0500
MIME-Version: 1.0
References: <20200218095859.9725-1-masahiroy@kernel.org>
In-Reply-To: <20200218095859.9725-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 28 Feb 2020 01:44:18 +0900
Message-ID: <CAK7LNATVao=FodbS2y8ECqNVPQ7gdPN8f=AzpbmACyjiiVJSXQ@mail.gmail.com>
Subject: Re: [PATCH] fixdep: remove unneeded code and comments about *.ver files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 18, 2020 at 6:59 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is probably stale code. In old days (~ Linux 2.5.59), Kbuild made
> genksyms generate include/linux/modules/*.ver files.
>
> The currenct Kbuild does not generate *.ver files at all.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.

>
>  scripts/basic/fixdep.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index 9ba47b0a47b9..ad2041817985 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -77,11 +77,6 @@
>   * dependencies on include/config/my/option.h for every
>   * CONFIG_MY_OPTION encountered in any of the prerequisites.
>   *
> - * It will also filter out all the dependencies on *.ver. We need
> - * to make sure that the generated version checksum are globally up
> - * to date before even starting the recursive build, so it's too late
> - * at this point anyway.
> - *
>   * We don't even try to really parse the header files, but
>   * merely grep, i.e. if CONFIG_FOO is mentioned in a comment, it will
>   * be picked up as well. It's not a problem with respect to
> @@ -299,8 +294,7 @@ static void *read_file(const char *filename)
>  static int is_ignored_file(const char *s, int len)
>  {
>         return str_ends_with(s, len, "include/generated/autoconf.h") ||
> -              str_ends_with(s, len, "include/generated/autoksyms.h") ||
> -              str_ends_with(s, len, ".ver");
> +              str_ends_with(s, len, "include/generated/autoksyms.h");
>  }
>
>  /*
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
