Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:64392 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751641AbdFUXdg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 19:33:36 -0400
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com [209.85.161.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v5LNXW0i023095
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2017 08:33:33 +0900
Received: by mail-yw0-f169.google.com with SMTP id l75so132740ywc.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 16:33:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170621075638.19251-1-npiggin@gmail.com>
References: <20170621075638.19251-1-npiggin@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 22 Jun 2017 08:33:31 +0900
Message-ID: <CAK7LNAQHshFNgtkffQMUVWEk9_crnLKN-VDQew_gRGFEvs6v=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] fix ia64 and tile for thin archives
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Nicholas,

2017-06-21 16:56 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> These fixes are similar to the sh fix already in the kbuild/thin-ar
> tree.
>
> Thanks,
> Nick
>
> Nicholas Piggin (2):
>   ia64: thin archives fix linking
>   tile: thin archives fix linking

I inserted these two after "sh: thin archives fix linking".
Thanks!


-- 
Best Regards
Masahiro Yamada
