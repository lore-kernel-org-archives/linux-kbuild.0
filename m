Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:36650 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751389AbeAWTCj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jan 2018 14:02:39 -0500
Received: by mail-wr0-f177.google.com with SMTP id d9so1730163wre.3
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2018 11:02:39 -0800 (PST)
Date: Tue, 23 Jan 2018 20:02:36 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH v4 1/1] kconfig: menuconfig make "Selected by:" and
 "Depends on:" readable
Message-ID: <20180123190235.pedoprrs4jwefz3v@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20180115230930.8723-1-petr.vorel@gmail.com>
 <CAK7LNAStFqZ6F5HS-yXMCAJ3sgM4fkfvFg887Mkr-SBRZnQ13g@mail.gmail.com>
 <CAK7LNARLi3NgvXanHjepd=x118cSvTO9q77ywyKcmbAX1UuaJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARLi3NgvXanHjepd=x118cSvTO9q77ywyKcmbAX1UuaJQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>

Hi Masahiro,

>   Depends on:
>    - BAR [=y]
>    - BAZ [=y]

> ... means "depends on BAR || BAZ",
> but it might be confusing with

>     depends on BAR
>     depends on BAZ

> ... which is equivalent to "depends on BAR && BAZ".

I'm going to post v5 where I change only "Selected by:" and "Implied by:".


Kind regards,
Petr
