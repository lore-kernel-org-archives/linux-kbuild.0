Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:55274 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbeBRXn3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 18:43:29 -0500
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com [209.85.217.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w1INhRCU016600
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Feb 2018 08:43:27 +0900
Received: by mail-ua0-f173.google.com with SMTP id q8so5127720uae.4
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 15:43:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180210142504.29890-1-npiggin@gmail.com>
References: <20180210142504.29890-1-npiggin@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Feb 2018 08:42:46 +0900
Message-ID: <CAK7LNAQWwoiEfps3-f_T9Nr0Nyd0oKui5t2FkudZZ_G4tKshtw@mail.gmail.com>
Subject: Re: [PATCH 0/2] remove the last of incremental linking
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-02-10 23:25 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> I don't think there is any point to keeping around the deprecated
> incremental linking option for too long. So I propose to remove it.
>
> After that is removed, I wonder what people think of changing from
> built-in.o to built-in.a?
>
> Thanks,
> Nick
>
> Nicholas Piggin (2):
>   kbuild: remove incremental linking option
>   kbuild: rename built-in.o to built-in.a


Both applied to linux-kbuild/kbuild.

Thanks!



-- 
Best Regards
Masahiro Yamada
