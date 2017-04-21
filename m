Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:29305 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S971103AbdDUJmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 05:42:44 -0400
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com [209.85.213.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v3L9gbC9004962
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 18:42:37 +0900
Received: by mail-yb0-f178.google.com with SMTP id 6so39158401ybq.2
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 02:42:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170331130941.5250-2-riku.voipio@linaro.org>
References: <20170331130941.5250-1-riku.voipio@linaro.org> <20170331130941.5250-2-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Apr 2017 18:42:36 +0900
Message-ID: <CAK7LNATrpSXG_tz=V=J7Q4a8qGzfHMBXRgtzLoL11C_Ef4t9+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] builddeb: Update a few outdated and hardcoded strings
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>, Timo Sigurdsson <public_timo.s@silentcreek.de>

Hi Riku,


The merge windows will be open shortly,
so I'd like to apply the first two.

2017-03-31 22:09 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> The builddeb script has some hardcoded references to Linux version 2.6
> which is ancient. Drop Provides as the virtual packages provided are not
> useful anymore. Leave the Provides for linux-kernel-headers, as someone
> might still be referring to it.
>
> While at it, updated copyright date and drop Standards-Version:


Could you add some comments about
"why" for the Standard-Version removal?

I know the answer is in the v2:
https://patchwork.kernel.org/patch/9532275/
but I'd like you to record it in git-log.

With the comment improved, I will pick up this soon.

Thanks!


-- 
Best Regards
Masahiro Yamada
