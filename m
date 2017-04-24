Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63011 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S979153AbdDXXKC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 19:10:02 -0400
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com [209.85.213.177]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v3ON9cpZ001989
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Apr 2017 08:09:39 +0900
Received: by mail-yb0-f177.google.com with SMTP id 11so60602829ybw.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2017 16:09:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170424110741.4524-1-riku.voipio@linaro.org>
References: <20170424110741.4524-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 25 Apr 2017 08:09:38 +0900
Message-ID: <CAK7LNAQO9AOx7KVA2d0_kXygXBdqDdN128pkr3th_3MAujj+Vw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] builddeb updates
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>

2017-04-24 20:07 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Trivial builddeb updates, the fastdeb change to be refactored later.
>
> Andrew Donnellan (1):
>   builddeb: fix typo
>
> Riku Voipio (1):
>   builddeb: Update a few outdated and hardcoded strings
>
>  scripts/package/builddeb | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)


Applied to linux-kbuild/misc.  Thanks!



-- 
Best Regards
Masahiro Yamada
