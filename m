Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46981 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752250AbeAQVhR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jan 2018 16:37:17 -0500
Subject: Re: [PATCH v4 1/1] kconfig: menuconfig make "Selected by:" and
 "Depends on:" readable
References: <20180115230930.8723-1-petr.vorel@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c4d969b6-201f-7321-d108-9bae82e7fc22@infradead.org>
Date: Wed, 17 Jan 2018 13:37:11 -0800
MIME-Version: 1.0
In-Reply-To: <20180115230930.8723-1-petr.vorel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>

On 01/15/18 15:09, Petr Vorel wrote:
> rev_dep expressions can get rather unwieldy, especially if a symbol is
> selected by more than a handful of other symbols. I.e. it's possible to
> have near endless expressions like:
>    A && B && !C || D || F && (G || H) || [...]
> 
> Chop these expressions into actually readable chunks:
>    - A && B && !C
>    - D
>    - F && (G || H)
>    - [...]
> 
> I.e. transform the top level OR tokens into newlines and prepend each
> line with a minus. This makes the "Selected by:" blurb much easier to
> read. For consistency the same is done for "Depends on:" although the
> problem isn't that bad for it. This is done only if there is more than
> one top level OR.
> 
> This also prevents trimming too long lines.
> 
> Based on idea from Paul Bolle.
> 
> Reported-by: Paul Bolle <pebolle@tiscali.nl>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Tested on search USB and General setup -> Kernel compression mode (Gzip) -> Help.
> 
> Changes v3->v4:
> * Add split also for "Depends on:". This is done for consistency (reported
>   by Masahiro Yamada). I didn't consider other symbols which call expr_gstr_print()
>   as reasonable candidates (i.e. "Implies:" and "Range : ").
> * Add new line and hyphen only when there are more top level OR than one.
> ---
>  scripts/kconfig/expr.c | 16 +++++++++++++---
>  scripts/kconfig/menu.c |  4 ++++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


-- 
~Randy
