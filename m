Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47472 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdIBE71 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Sep 2017 00:59:27 -0400
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com [209.85.161.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v824x72r013820
        for <linux-kbuild@vger.kernel.org>; Sat, 2 Sep 2017 13:59:08 +0900
Received: by mail-yw0-f169.google.com with SMTP id h127so8714584ywf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Sep 2017 21:59:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170818222052.22375-2-nicolasporcel06@gmail.com>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com> <20170818222052.22375-2-nicolasporcel06@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 2 Sep 2017 13:58:26 +0900
Message-ID: <CAK7LNATEFYsVaiPAbNqaRd8Rpf+s188c7SiJK4hp-OHZO1zSfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Use KCONFIG_CONFIG in buildtar
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Porcel <nicolasporcel06@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-08-19 7:20 GMT+09:00 Nicolas Porcel <nicolasporcel06@gmail.com>:
> Previously, .config was used in buildtar script regardless of the value of
> KCONFIG_CONFIG.
>
> Signed-off-by: Nicolas Porcel <nicolasporcel06@gmail.com>


This one looks good.

Applied to linux-kbuild.




-- 
Best Regards
Masahiro Yamada
