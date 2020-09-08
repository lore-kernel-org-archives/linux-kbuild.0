Return-Path: <SRS0=D3sw=CR=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAA6C43461
	for <linux-kbuild@archiver.kernel.org>; Tue,  8 Sep 2020 00:45:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41B05215A4
	for <linux-kbuild@archiver.kernel.org>; Tue,  8 Sep 2020 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599525939;
	bh=lr9UROX+Wg+4O01aWzLtp2KEqYwZf6rrGiX8WYrj60A=;
	h=From:Date:Subject:To:Cc:List-ID:From;
	b=TdWlexjHii6uDQyGggofp1d/eCQwZ90NM0n/SuUEpc1tdWdw+Hd80YUOoXpTueLal
	 yVv5cZaT1kk44zPTd6TgGlKwr9fEgO8AR6Z+1ZokFGSRMN63z9N6TzJheQ60L8uDZw
	 s0Y671Top2vBKS7tePH5dMMuo5isXnyiVM+2aKDQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgIHApi (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 7 Sep 2020 20:45:38 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62288 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgIHAph (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Sep 2020 20:45:37 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0880jGAo010660;
        Tue, 8 Sep 2020 09:45:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0880jGAo010660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599525916;
        bh=r2g24b5Z4gKGlSBUVj0Rg4mdr3x5OYX9n9TvGXbat7Q=;
        h=From:Date:Subject:To:Cc:From;
        b=vbppcsrU4rMb/quTXV/X2jAFgeIBJjhS0u3s31f8pMMGVBikYN0gy8BzsaFG6phF0
         EVAGHH3M89XapHxUz6QiSD87UuSYf2Xw/A+90tTcrX82RRS8oR8TUxeeA22DUH9vtQ
         xmPRrD1dsdiEaeZd1FHCG4H7R9BuWelsWg7lzpiAE1kkqbof73DFfIqgfTnejC7sx0
         U/b9pGd5raiDtzzPsHzU3/Bxbmf0rVRI6paGA1wECze29smhQNJW/qj9RVy+Po6ISi
         DjfJAZ3Cyyesxa6IqL9LOjzQJzXaPkRp+XPzYT8S1OXXetkhURSIGL+J9ZBRoNtSAE
         shp0L+L6DQmdA==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id a9so4165496pjg.1;
        Mon, 07 Sep 2020 17:45:16 -0700 (PDT)
X-Gm-Message-State: AOAM531l9hFD0CaYRR2TmHic90IG5UtJ5XqCCRGFGPZRx0Olf5xid+9W
        ZS4cNCuplEo3qA6qEFvNb64/AArAQlbesHarJ04=
X-Google-Smtp-Source: ABdhPJzFVgghbu9O6YGw2YRgfDVwziZW47i/OFI3CzACRPTNRQgXHu+8e5fnAmRck81BBgxMlOZB7iCBAhBS/MwYBM4=
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr1619629pjb.87.1599525915813;
 Mon, 07 Sep 2020 17:45:15 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 8 Sep 2020 09:44:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARR3Hh0EwrHKU+gqyO7UVGJVK81pXO1CTNEKe-mbWAgqA@mail.gmail.com>
Message-ID: <CAK7LNARR3Hh0EwrHKU+gqyO7UVGJVK81pXO1CTNEKe-mbWAgqA@mail.gmail.com>
Subject: Please revert kbuild commit for today's linux-next
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Stephen,


As 0-day bot detected, the following commit
in my kbuild tree turned out to be problematic.

commit 8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5 (origin/kbuild, kbuild)
Author: Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri Sep 4 22:31:21 2020 +0900

    kbuild: preprocess module linker script



Could you revert it for now?


I will consider how to fix it.


-- 
Best Regards
Masahiro Yamada
