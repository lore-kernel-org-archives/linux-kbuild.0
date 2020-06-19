Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38158 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgFSE5q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 00:57:46 -0400
MIME-Version: 1.0
References: <20200617030220.34733-1-masahiroy@kernel.org> <20200617030220.34733-2-masahiroy@kernel.org>
 <b1eef508475f2ad501a153bb9d90d64a5128ecdd.camel@perches.com>
In-Reply-To: <b1eef508475f2ad501a153bb9d90d64a5128ecdd.camel@perches.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 19 Jun 2020 13:56:30 +0900
Message-ID: <CAK7LNAR-hYJyOHe6Mgw6-3SbDMqd4udq2o1fk1TzVSAy8gsPXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "checkpatch: kconfig: prefer 'help' over '---help---'"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Andy Whitcroft <apw@canonical.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jun 17, 2020 at 1:37 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-06-17 at 12:02 +0900, Masahiro Yamada wrote:
> > This reverts commit 84af7a6194e493fae312a2b7fa5a3b51f76d9282.
>
> Also: https://lore.kernel.org/patchwork/patch/1255848/
> ---

Yes, I removed --help-- support in 1/2.

https://patchwork.kernel.org/patch/11608927/



>  scripts/checkkconfigsymbols.py | 2 +-
>  scripts/checkpatch.pl          | 6 +-----
>  scripts/kconfig/lexer.l        | 2 +-
>  3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index 00a10a293f4f..1548f9ce4682 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -34,7 +34,7 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
>  REGEX_KCONFIG_DEF = re.compile(DEF)
>  REGEX_KCONFIG_EXPR = re.compile(EXPR)
>  REGEX_KCONFIG_STMT = re.compile(STMT)
> -REGEX_KCONFIG_HELP = re.compile(r"^\s+(help|---help---)\s*$")
> +REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
>  REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
>  REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
>  REGEX_QUOTES = re.compile("(\"(.*?)\")")
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 524df88f9364..738bb3fcf202 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3044,11 +3044,7 @@ sub process {
>
>                                 if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
>                                         $is_start = 1;
> -                               } elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
> -                                       if ($lines[$ln - 1] =~ "---help---") {
> -                                               WARN("CONFIG_DESCRIPTION",
> -                                                    "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
> -                                       }
> +                               } elsif ($lines[$ln - 1] =~ /^\+\s*help\s*$/) {
>                                         $length = -1;
>                                 }
>
> diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
> index 6354c905b006..4b7339ff4c8b 100644
> --- a/scripts/kconfig/lexer.l
> +++ b/scripts/kconfig/lexer.l
> @@ -105,7 +105,7 @@ n   [A-Za-z0-9_-]
>  "endchoice"            return T_ENDCHOICE;
>  "endif"                        return T_ENDIF;
>  "endmenu"              return T_ENDMENU;
> -"help"|"---help---"    return T_HELP;
> +"help"                 return T_HELP;
>  "hex"                  return T_HEX;
>  "if"                   return T_IF;
>  "imply"                        return T_IMPLY;
>
>


-- 
Best Regards
Masahiro Yamada
