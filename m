Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:32820 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751610AbeEQGj3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 02:39:29 -0400
Received: by mail-ua0-f194.google.com with SMTP id i2-v6so2239589uah.0
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 23:39:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526537830-22606-18-git-send-email-yamada.masahiro@socionext.com>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com> <1526537830-22606-18-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 May 2018 23:39:28 -0700
Message-ID: <CAGXu5jKpNN3SSh3CRb9+U=1nFvOqrAtcdk0Km_QO1Cwa5dZfNQ@mail.gmail.com>
Subject: Re: [PATCH v4 17/31] kconfig: add 'filename' and 'lineno' built-in variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

On Wed, May 16, 2018 at 11:16 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The special variables, $(filename) and $(lineno), are expanded to a
> file name and its line number being parsed, respectively.
>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>
> Changes in v4:
>  - Newly added
>
> Changes in v3: None
> Changes in v2: None
>
>  scripts/kconfig/preprocess.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
> index 88844a7..c39e30e 100644
> --- a/scripts/kconfig/preprocess.c
> +++ b/scripts/kconfig/preprocess.c
> @@ -111,6 +111,11 @@ static char *do_error(int argc, char *argv[], int old_argc, char *old_argv[])
>         return NULL;
>  }
>
> +static char *do_filename(int argc, char *argv[], int old_argc, char *old_argv[])
> +{
> +       return xstrdup(current_file->name);
> +}
> +
>  static char *do_if(int argc, char *argv[], int old_argc, char *old_argv[])
>  {
>         char *cond, *p, *res;
> @@ -144,6 +149,15 @@ static char *do_info(int argc, char *argv[], int old_argc, char *old_argv[])
>         return xstrdup("");
>  }
>
> +static char *do_lineno(int argc, char *argv[], int old_argc, char *old_argv[])
> +{
> +       char buf[16];
> +
> +       sprintf(buf, "%d", yylineno);
> +
> +       return xstrdup(buf);
> +}
> +
>  static char *do_shell(int argc, char *argv[], int old_argc, char *old_argv[])
>  {
>         FILE *p;
> @@ -194,8 +208,10 @@ static char *do_warning(int argc, char *argv[], int old_argc, char *old_argv[])
>  static const struct function function_table[] = {
>         /* Name         MIN     MAX     EXP?    Function */
>         { "error",      1,      1,      true,   do_error },
> +       { "filename",   0,      0,      false,  do_filename },
>         { "if",         2,      3,      false,  do_if },
>         { "info",       1,      1,      true,   do_info },
> +       { "lineno",     0,      0,      false,  do_lineno },
>         { "shell",      1,      1,      true,   do_shell },
>         { "warning",    1,      1,      true,   do_warning },
>  };
> --
> 2.7.4
>



-- 
Kees Cook
Pixel Security
