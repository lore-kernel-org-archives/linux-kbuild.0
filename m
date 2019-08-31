Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gateway30.websitewelcome.com ([50.116.125.1]:33776 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725298AbfHaFeL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Aug 2019 01:34:11 -0400
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id C02D331EF
        for <linux-kbuild@vger.kernel.org>; Sat, 31 Aug 2019 00:12:12 -0500 (CDT)
References: <20190829120215.1977-1-msuchanek@suse.de>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] Makefile: Convert -Wimplicit-fallthrough to
 -Wimplicit-fallthrough=2
Message-ID: <975cea02-a2db-c0b9-ba84-83a0ddadab0f@embeddedor.com>
Date: Sat, 31 Aug 2019 00:12:10 -0500
MIME-Version: 1.0
In-Reply-To: <20190829120215.1977-1-msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Suchanek <msuchanek@suse.de>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>



On 8/29/19 7:02 AM, Michal Suchanek wrote:
> From gcc documentation:
> 
> -Wimplicit-fallthrough=0
>   disables the warning altogether.
> -Wimplicit-fallthrough=1
>   matches .* regular expression, any comment is used as fallthrough comment.
> -Wimplicit-fallthrough=2
>   case insensitively matches .*falls?[ \t-]*thr(ough|u).* regular expression.
> -Wimplicit-fallthrough=3
>   case sensitively matches one of the following regular expressions:
>    -fallthrough
>    @fallthrough@
>    lint -fallthrough[ \t]*
>    [ \t.!]*(ELSE,? |INTENTIONAL(LY)? )?
>    FALL(S | |-)?THR(OUGH|U)[ \t.!]*(-[^\n\r]*)?
>    [ \t.!]*(Else,? |Intentional(ly)? )?
>    Fall((s | |-)[Tt]|t)hr(ough|u)[ \t.!]*(-[^\n\r]*)?
>    [ \t.!]*([Ee]lse,? |[Ii]ntentional(ly)? )?
>    fall(s | |-)?thr(ough|u)[ \t.!]*(-[^\n\r]*)?
> -Wimplicit-fallthrough=4
>   case sensitively matches one of the following regular expressions:
>    -fallthrough
>    @fallthrough@
>    lint -fallthrough[ \t]*
>    [ \t]*FALLTHR(OUGH|U)[ \t]*
> -Wimplicit-fallthrough=5
>   doesn’t recognize any comments as fallthrough comments, only attributes disable the warning.
> 
> In particular the default value of 3 does not match the comments like
> /* falls through to do foobar */
> generating suprious warnings on properly annotated code.
> 

NACK

How many of those case do you see? if any...

In any case, those comments can be easily transformed to:

/* falls through - to do foobar */

like in this case:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d2d833e0bf2bad221a955626b942b38312630894

Also, notice that code in linux-next is already ahead... :

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e2079e93f562c7f7a030eb7642017ee5eabaaa10

--
Gustavo
