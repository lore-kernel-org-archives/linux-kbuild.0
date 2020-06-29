Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:26493 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgF2AzN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 20:55:13 -0400
MIME-Version: 1.0
References: <20200617030220.34733-1-masahiroy@kernel.org>
In-Reply-To: <20200617030220.34733-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 Jun 2020 09:54:17 +0900
Message-ID: <CAK7LNATGmbunTT2KkS6-GTuangCUXJSOOoaxm=Y4Vn=sAf1UEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: remove '---help---' support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jun 17, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The conversion is done. No more user of '---help---'.
>
> Cc: Ulf Magnusson <ulfalizer@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild.

> ---
>
>  scripts/checkkconfigsymbols.py | 2 +-
>  scripts/kconfig/lexer.l        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
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
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
