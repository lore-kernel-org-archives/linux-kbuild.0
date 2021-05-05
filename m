Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BF1C433ED
	for <linux-kbuild@archiver.kernel.org>; Wed,  5 May 2021 17:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D54076121F
	for <linux-kbuild@archiver.kernel.org>; Wed,  5 May 2021 17:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhEERuQ (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 5 May 2021 13:50:16 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:48095 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236340AbhEERtk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 13:49:40 -0400
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 145HmERl022609;
        Thu, 6 May 2021 02:48:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 145HmERl022609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620236895;
        bh=C2LiIxaQLmcbubV7KAJlOAeDUPkL6DYE0IuMqmtJHTc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=z5cQSaMCeSaFuKxdnnY73UTdrpVTgOIHA+mMX7f7EOc4gXZPvzMHCYIM3Qoy6+M/i
         RXv6mLp/mWQO6aSULpFEJWmM/J2YRtx2DlCVM23Zde/YgeJZUSDdn7l+a2jFWaJjG7
         DH+6uBs2gv8XxfawNhGWD+cEdHa/mxKNMo8x8LpnAw/KoR5ybxaAugKggdfntvgFgS
         zT/wHOXL7M8Z9AjGLlnuX+KBrHvsMkArBDBmfd2pxm+2RGaG4MnhRWsuIOWbB1kuTh
         y66oQbA1SrqlaA+YKHenfMNH6ijzttqcVAjxz7cEHVRuMjtn5vFC7caSnNhjOoKZRP
         DHHbvtlkRWswg==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id q2so2481984pfh.13;
        Wed, 05 May 2021 10:48:14 -0700 (PDT)
X-Gm-Message-State: AOAM533MOQ99xZWWV2Vu8ZTRCrODH9MDUFOCTlX802tBuDYhXq3MkDTP
        LFqfvvouU3FczAcNMiWP2UKtMl323g+Pu/dCOVo=
X-Google-Smtp-Source: ABdhPJyK59R/P6vJ870GlUCJyA7n+c2G1EWUlbuWHYKJiV2S03+7avnriu+YKJVCvsY8/UyZL0MXs76iWypEbt1S5o4=
X-Received: by 2002:a63:a547:: with SMTP id r7mr104882pgu.7.1620236893893;
 Wed, 05 May 2021 10:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210501172437.156926-1-masahiroy@kernel.org> <CAK8P3a2Ng7ZvRh4iT5jrFvp9=Z7oQJ4Ay_OWJ76bnZfn=VEZVw@mail.gmail.com>
In-Reply-To: <CAK8P3a2Ng7ZvRh4iT5jrFvp9=Z7oQJ4Ay_OWJ76bnZfn=VEZVw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 6 May 2021 02:47:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQpCy+pZwCSMv8YRK3BVgMhu9vR1=cK6hTx=jxfO+MxzA@mail.gmail.com>
Message-ID: <CAK7LNAQpCy+pZwCSMv8YRK3BVgMhu9vR1=cK6hTx=jxfO+MxzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove ARCH=sh64 support from top Makefile
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 2, 2021 at 6:19 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, May 1, 2021 at 7:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Commit 37744feebc08 ("sh: remove sh5 support") removed the SUPERH64
> > support entirely.
> >
> > Remove the left-over code from the top Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Good catch!
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>


Applied to linux-kbuild.
-- 
Best Regards
Masahiro Yamada
