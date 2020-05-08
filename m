Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:44662 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgEHFjG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 May 2020 01:39:06 -0400
MIME-Version: 1.0
References: <20200507185601.GA14759@embeddedor>
In-Reply-To: <20200507185601.GA14759@embeddedor>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 8 May 2020 14:37:58 +0900
Message-ID: <CAK7LNAS1bjKcczLADzP8JQ=CVe4VOFb1L3C4bb+0eS5zfBHubg@mail.gmail.com>
Subject: Re: [PATCH] modpost: Replace zero-length array with flexible-array
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 8, 2020 at 3:51 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>


Applied to linux-kbuild. Thanks.



-- 
Best Regards
Masahiro Yamada
