Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25291 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfELPnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 11:43:24 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4CFh3xN011103
        for <linux-kbuild@vger.kernel.org>; Mon, 13 May 2019 00:43:03 +0900
Received: by mail-vs1-f50.google.com with SMTP id z11so2501727vsq.9
        for <linux-kbuild@vger.kernel.org>; Sun, 12 May 2019 08:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190510192852.4dwfeicp3ebv3epm@ualberta.ca>
In-Reply-To: <20190510192852.4dwfeicp3ebv3epm@ualberta.ca>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 00:42:26 +0900
Message-ID: <CAK7LNASTL7zy675g7MG1=b-Dq2SuUxD2hfGEKe4LTUoiHEfuLw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: use snprintf for formatting pathnames
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jacob Garber <jgarber1@ualberta.ca>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, May 11, 2019 at 4:28 AM Jacob Garber <jgarber1@ualberta.ca> wrote:
>
> Valid pathnames will never exceed PATH_MAX, but these file names
> are unsanitized and can cause buffer overflow if set incorrectly.
> Use snprintf to avoid this. This was flagged during a Coverity scan
> of the coreboot project, which also uses kconfig for its build system.
>
> Signed-off-by: Jacob Garber <jgarber1@ualberta.ca>
> ---
>  scripts/kconfig/confdata.c | 7 ++++---
>  scripts/kconfig/lexer.l    | 3 ++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 08ba146a8..847fe428a 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -194,7 +194,7 @@ char *conf_get_default_confname(void)
>         name = expand_string(conf_defname);
>         env = getenv(SRCTREE);
>         if (env) {
> -               sprintf(fullname, "%s/%s", env, name);
> +               snprintf(fullname, sizeof(fullname), "%s/%s", env, name);
>                 if (is_present(fullname))
>                         return fullname;
>         }


Replacing sprintf() with snprintf() is correct
although I think this if-conditional has no sense
in the first place.

The returned string from conf_get_default_confname()
will be passed to zconf_fopen().
So, SRCTREE/ will be prepended anyway.


I was wondering about applying a small fix like this
to already wrong code, but I decided to picked it up.

BTW, this function has one more bug.
expand_string() must be free'd. So it is memory leak.
I will not fix it because I will remove this function sooner or later.



> @@ -843,10 +843,11 @@ int conf_write(const char *name)
>         } else
>                 basename = conf_get_configname();
>
> -       sprintf(newname, "%s%s", dirname, basename);
> +       snprintf(newname, sizeof(newname), "%s%s", dirname, basename);
>         env = getenv("KCONFIG_OVERWRITECONFIG");
>         if (!env || !*env) {
> -               sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
> +               snprintf(tmpname, sizeof(tmpname),
> +                        "%s.tmpconfig.%d", dirname, (int)getpid());
>                 out = fopen(tmpname, "w");
>         } else {
>                 *tmpname = 0;


I do not need this hunk.

I had already posted this:
https://patchwork.kernel.org/patch/10938255/

When I touched this hunk, I used snprintf().


> diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
> index c9df1c8b9..6354c905b 100644
> --- a/scripts/kconfig/lexer.l
> +++ b/scripts/kconfig/lexer.l
> @@ -378,7 +378,8 @@ FILE *zconf_fopen(const char *name)
>         if (!f && name != NULL && name[0] != '/') {
>                 env = getenv(SRCTREE);
>                 if (env) {
> -                       sprintf(fullname, "%s/%s", env, name);
> +                       snprintf(fullname, sizeof(fullname),
> +                                "%s/%s", env, name);
>                         f = fopen(fullname, "r");
>                 }
>         }


This function will stay, so I will apply.

Thanks.




--
Best Regards
Masahiro Yamada
