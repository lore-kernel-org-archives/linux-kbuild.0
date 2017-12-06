Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:45489 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751757AbdLFPkJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Dec 2017 10:40:09 -0500
Received: by mail-qt0-f195.google.com with SMTP id g10so9802286qtj.12
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Dec 2017 07:40:08 -0800 (PST)
Date: Wed, 6 Dec 2017 10:40:06 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] kconfig: fix relational operators for bool and tristate
 symbols
In-Reply-To: <nycvar.YSQ.7.76.1711161956590.20817@knanqh.ubzr>
Message-ID: <nycvar.YSQ.7.76.1712061039080.1626@knanqh.ubzr>
References: <nycvar.YSQ.7.76.1711161956590.20817@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jan Beulich <JBeulich@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


Ping.

On Thu, 16 Nov 2017, Nicolas Pitre wrote:

> Since commit 31847b67bec0 ("kconfig: allow use of relations other than
> (in)equality") it is possible to use relational operators in Kconfig
> statements. However, those operators give unexpected results when
> applied to bool/tristate values:
> 
> 	(n < y) = y (correct)
> 	(m < y) = y (correct)
> 	(n < m) = n (wrong)
> 
> This happens because relational operators process bool and tristate
> symbols as strings and m sorts before n. It makes little sense to do a
> lexicographical compare on bool and tristate values though.
> 
> Documentation/kbuild/kconfig-language.txt states that expression can have
> a value of 'n', 'm' or 'y' (or 0, 1, 2 respectively for calculations).
> Let's make it so for relational comparisons with bool/tristate
> expressions as well and document them. If at least one symbol is an
> actual string then the lexicographical compare works just as before.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> 
> diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> index 262722d886..c4a293a03c 100644
> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -200,10 +200,14 @@ module state. Dependency expressions have the following syntax:
>  <expr> ::= <symbol>                             (1)
>             <symbol> '=' <symbol>                (2)
>             <symbol> '!=' <symbol>               (3)
> -           '(' <expr> ')'                       (4)
> -           '!' <expr>                           (5)
> -           <expr> '&&' <expr>                   (6)
> -           <expr> '||' <expr>                   (7)
> +           <symbol1> '<' <symbol2>              (4)
> +           <symbol1> '>' <symbol2>              (4)
> +           <symbol1> '<=' <symbol2>             (4)
> +           <symbol1> '>=' <symbol2>             (4)
> +           '(' <expr> ')'                       (5)
> +           '!' <expr>                           (6)
> +           <expr> '&&' <expr>                   (7)
> +           <expr> '||' <expr>                   (8)
>  
>  Expressions are listed in decreasing order of precedence. 
>  
> @@ -214,10 +218,13 @@ Expressions are listed in decreasing order of precedence.
>      otherwise 'n'.
>  (3) If the values of both symbols are equal, it returns 'n',
>      otherwise 'y'.
> -(4) Returns the value of the expression. Used to override precedence.
> -(5) Returns the result of (2-/expr/).
> -(6) Returns the result of min(/expr/, /expr/).
> -(7) Returns the result of max(/expr/, /expr/).
> +(4) If value of <symbol1> is respectively lower, greater, lower-or-equal,
> +    or greater-or-equal than value of <symbol2>, it returns 'y',
> +    otherwise 'n'.
> +(5) Returns the value of the expression. Used to override precedence.
> +(6) Returns the result of (2-/expr/).
> +(7) Returns the result of min(/expr/, /expr/).
> +(8) Returns the result of max(/expr/, /expr/).
>  
>  An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
>  respectively for calculations). A menu entry becomes visible when its
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index cbf4996dd9..8cee597d33 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -893,7 +893,10 @@ static enum string_value_kind expr_parse_string(const char *str,
>  	switch (type) {
>  	case S_BOOLEAN:
>  	case S_TRISTATE:
> -		return k_string;
> +		val->s = !strcmp(str, "n") ? 0 :
> +			 !strcmp(str, "m") ? 1 :
> +			 !strcmp(str, "y") ? 2 : -1;
> +		return k_signed;
>  	case S_INT:
>  		val->s = strtoll(str, &tail, 10);
>  		kind = k_signed;
> 
