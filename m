Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51747 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751251AbeA1LMh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jan 2018 06:12:37 -0500
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com [209.85.213.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w0SBCIVa010574
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2018 20:12:19 +0900
Received: by mail-vk0-f50.google.com with SMTP id g83so2835080vki.4
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2018 03:12:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516597101-30637-1-git-send-email-philipp@redfish-solutions.com>
References: <1516597101-30637-1-git-send-email-philipp@redfish-solutions.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jan 2018 20:11:37 +0900
Message-ID: <CAK7LNASfxqz3h6eS8gf0XrWg5pTkaixKiyi+svPM3Wuqu8QG6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kconfig: double up dollar signs in strings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-01-22 13:58 GMT+09:00 Philip Prindeville <philipp@redfish-solutions.com>:
> From: Philip Prindeville <philipp@redfish-solutions.com>
>
> Since kconfig reads and writes makefiles, reflect that dollars need
> to be doubled up in make syntax so that they're not interpolated.
>
> Example: if we have a CONFIG_VAR of type string that we want to have
> the value of "abc$def" then it must be written to the file .config
> file as:
>
> CONFIG_VAR="abc$$def"
>
> to avoid the $d from being interpolated as the $(d).
>
> Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>


Question:
If you want to interpolate $d, how can you do that?
Is it possible to make CONFIG_VAR="abc${d}ef" ?


Currently,
User input: abc$$def    ->  Output: CONFIG_FOO="abc$$def"

User input: abc${d}ef   ->  Output: CONFIG_FOO="abc${d}ef"

Both are possible by inputting the string verbatim.




With your patch, the conversion is forced as follows:

User Input: abc$def         ->   Output:  CONFIG_FOO="abc$$def

So, having a single $ is banned.


I am wondering what value is added by this patch...





>  scripts/kconfig/confdata.c | 6 +++++-
>  scripts/kconfig/symbol.c   | 9 ++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 87f723804079ed3b6c1fbb0d1470f717582c4a28..e45f23dd04a7ceede2533d80d3ec8fc993685112 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -155,11 +155,15 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>         case S_STRING:
>                 if (*p++ != '"')
>                         break;
> -               for (p2 = p; (p2 = strpbrk(p2, "\"\\")); p2++) {
> +               for (p2 = p; (p2 = strpbrk(p2, "\"\\$")); p2++) {
>                         if (*p2 == '"') {
>                                 *p2 = 0;
>                                 break;
>                         }
> +                       else if (*p2 == '$' && p2[1] != '$') {
> +                               conf_warning("invalid string found");
> +                               break;
> +                       }
>                         memmove(p2, p2 + 1, strlen(p2));
>                 }
>                 if (!p2) {
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 7caabdb51c647e12e35b500bdebd262ba1545eb0..2458da4e2b203e5213e4ea0cb380f8f88af566ab 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -923,7 +923,7 @@ const char *sym_escape_string_value(const char *in)
>
>         p = in;
>         for (;;) {
> -               l = strcspn(p, "\"\\");
> +               l = strcspn(p, "\"\\$");
>                 p += l;
>
>                 if (p[0] == '\0')
> @@ -940,14 +940,17 @@ const char *sym_escape_string_value(const char *in)
>
>         p = in;
>         for (;;) {
> -               l = strcspn(p, "\"\\");
> +               l = strcspn(p, "\"\\$");
>                 strncat(res, p, l);
>                 p += l;
>
>                 if (p[0] == '\0')
>                         break;
>
> -               strcat(res, "\\");
> +               if (p[0] == '$')
> +                       strcat(res, "$");
> +               else
> +                       strcat(res, "\\");
>                 strncat(res, p++, 1);
>         }
>
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
