Return-Path: <SRS0=OKdZ=DY=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC12C433E7
	for <linux-kbuild@archiver.kernel.org>; Sat, 17 Oct 2020 05:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D39C5207EA
	for <linux-kbuild@archiver.kernel.org>; Sat, 17 Oct 2020 05:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602912371;
	bh=kHEXKE3lXtmOb2XmNJebsC4Ar7AMROgQZsY2Xl/rJJk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=MJKHwfMhfBk+DK90gsVGgPF1CZiEBQXPySbKLuYuKMjTW2R1vH1c6WXmg8O4KeomV
	 ZxxXqTdDwavy9HaLuvHKBxwqxR4BIOVaB5l6JXBEg29ApbkvPEwIYmtLSLSpKKOixc
	 4ImURzIWHitdbAnw3SC9pYggiylgOL9bB/QPBhNM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391091AbgJQF0B (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 17 Oct 2020 01:26:01 -0400
Received: from condef-04.nifty.com ([202.248.20.69]:43286 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411544AbgJQFZy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Oct 2020 01:25:54 -0400
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-04.nifty.com with ESMTP id 09H0rMrL009980;
        Sat, 17 Oct 2020 09:53:22 +0900
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 09H0qmJY013427;
        Sat, 17 Oct 2020 09:52:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 09H0qmJY013427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602895968;
        bh=jFGDeoBUNtHI/f1LRfGilMdZRb/3sRJkyBE1d/xCYck=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=U4igSnlhco/uKMDvmaWDUBdtZQFswNOWirGMKGl6v4WtjX2jomeUg939QPnXY8TWj
         uWWN4pp7iL/oa0p9j0hgoy9k5qeQ+/wt0mgm0F8tg+ZGQnOs48x8yLnLRvNkEhlFsp
         Ssvq12FpmRDKVLyw9pnn6wLBN9P1o41AfQE+Io5Y1aikIB2zwNAYdXq2f7nJJm7d2y
         txc4fdqyKXH76E0wUtT0VBnaarait7owxq9iHjWsnBF1DJHrzguUybMq67zAeNYzuU
         1QfSlj8sZL1OyE3rEE1aMX6WRnBLexLNdlY25HZO7iQugPY6AB7oUTINcJX2uGc01U
         yoo+tEkagklqA==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id w11so2132855pll.8;
        Fri, 16 Oct 2020 17:52:48 -0700 (PDT)
X-Gm-Message-State: AOAM531MfS72Ixbrd7pDpMWSIW6MCOyBj7mUJFM1J5iyZYziGhglTo4h
        pHjaSSvD1OmDPFc8dDtcX1Ss7lA76gApWWHnUrg=
X-Google-Smtp-Source: ABdhPJy0t5Bs9486cJFBgeiucT13MtwNmm5izOeS4BI5lD7YxG6DcO+J0HHX3cWn3haUPhfgkn9a5NkV6Ta57m/MCqs=
X-Received: by 2002:a17:902:c3d4:b029:d3:df24:1619 with SMTP id
 j20-20020a170902c3d4b02900d3df241619mr6509345plj.1.1602895967611; Fri, 16 Oct
 2020 17:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201016125846.8156-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20201016125846.8156-1-linux@rasmusvillemoes.dk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 17 Oct 2020 09:52:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ+5vd6rcgta3VMAMxDMkbw4h8ngohPA1fUjSPXXLjAZg@mail.gmail.com>
Message-ID: <CAK7LNAQ+5vd6rcgta3VMAMxDMkbw4h8ngohPA1fUjSPXXLjAZg@mail.gmail.com>
Subject: Re: [PATCH] Kbuild.include: remove leftover comment for filechk utility
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 16, 2020 at 9:59 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> After commit 43fee2b23895 ("kbuild: do not redirect the first
> prerequisite for filechk"), the rule is no longer automatically passed
> $< as stdin, so remove the stale comment.
>
> Fixes: 43fee2b23895 ("kbuild: do not redirect the first prerequisite for filechk")
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/Kbuild.include | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 83a1637417e5..08e011175b4c 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -56,8 +56,6 @@ kecho := $($(quiet)kecho)
>  # - If no file exist it is created
>  # - If the content differ the new file is used
>  # - If they are equal no change, and no timestamp update
> -# - stdin is piped in from the first prerequisite ($<) so one has
> -#   to specify a valid file as first prerequisite (often the kbuild file)
>  define filechk
>         $(Q)set -e;                                             \
>         mkdir -p $(dir $@);                                     \
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
