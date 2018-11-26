Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57026 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbeKZSYW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 13:24:22 -0500
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id wAQ7UkA1023000
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Nov 2018 16:30:46 +0900
Received: by mail-vs1-f47.google.com with SMTP id x64so10668491vsa.5
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Nov 2018 23:30:46 -0800 (PST)
MIME-Version: 1.0
References: <e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org>
In-Reply-To: <e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 26 Nov 2018 16:30:09 +0900
Message-ID: <CAK7LNARKuFj=YhSHg2fKw2yuWHOaTMUVQA75=3W8Hxdn0Y8Uuw@mail.gmail.com>
Subject: Re: netfilter Kconfig question
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Taehee Yoo <ap420073@gmail.com>

Hi Randy,


On Tue, Nov 20, 2018 at 5:51 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi Yamada-san,
>
> There was recently a netfilter build error in linux-next for which
> a patch was posted by Taehee Yoo.  The patch works (fixes the build
> error) but I don't see how or why.
>
> My build error report is here:
> https://lore.kernel.org/lkml/fa7a7824-44df-c058-dba2-ec29c5028361@infradead.org/T/#u
>
>
> Would you take a look at it and try to explain why the patch works?
>
> The patch's email thread begins here:
> https://www.spinics.net/lists/netfilter-devel/msg56985.html


I think this is a bug of Kconfig.

I sent a patch.
https://patchwork.kernel.org/patch/10697637/


-- 
Best Regards
Masahiro Yamada
