Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44241 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750997AbeAVPWX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jan 2018 10:22:23 -0500
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com [209.85.213.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w0MFMKhC010894
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2018 00:22:20 +0900
Received: by mail-vk0-f50.google.com with SMTP id z9so4949633vkd.5
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2018 07:22:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAStFqZ6F5HS-yXMCAJ3sgM4fkfvFg887Mkr-SBRZnQ13g@mail.gmail.com>
References: <20180115230930.8723-1-petr.vorel@gmail.com> <CAK7LNAStFqZ6F5HS-yXMCAJ3sgM4fkfvFg887Mkr-SBRZnQ13g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 23 Jan 2018 00:21:39 +0900
Message-ID: <CAK7LNARLi3NgvXanHjepd=x118cSvTO9q77ywyKcmbAX1UuaJQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] kconfig: menuconfig make "Selected by:" and
 "Depends on:" readable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>

2018-01-23 0:04 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>
>   Depends on:
>   - BAR [=y]
>   - BAZ [=y]
>
> ... means "depends on BAR && BAZ",
> but it might be confusing with
>
>    depends on BAR
>    depends on BAZ
>
> ... which is equivalent to "depends on BAR || BAZ".
>
>

Sorry, my previous comment was wrong.
Let me correct it.



  Depends on:
   - BAR [=y]
   - BAZ [=y]

... means "depends on BAR || BAZ",
but it might be confusing with

    depends on BAR
    depends on BAZ

... which is equivalent to "depends on BAR && BAZ".



-- 
Best Regards
Masahiro Yamada
