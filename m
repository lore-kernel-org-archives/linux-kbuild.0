Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51503 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751251AbeA1BXy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jan 2018 20:23:54 -0500
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com [209.85.217.181]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w0S1NoB0032136
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2018 10:23:51 +0900
Received: by mail-ua0-f181.google.com with SMTP id f5so2596279ual.8
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Jan 2018 17:23:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180125094635.456-1-petr.vorel@gmail.com>
References: <20180125094635.456-1-petr.vorel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jan 2018 10:23:09 +0900
Message-ID: <CAK7LNAQpx5Sw-X7wF5vnPXKFO9RhUen5s07isERFpq5Mq2GPOw@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] kconfig: make "Selected by:" and "Implied by:" readable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>

2018-01-25 18:46 GMT+09:00 Petr Vorel <petr.vorel@gmail.com>:
> Reverse dependency expressions can get rather unwieldy, especially if
> a symbol is selected by more than a handful of other symbols. I.e. it's
> possible to have near endless expressions like:
>    A && B && !C || D || F && (G || H) || [...]
>
> Chop these expressions into actually readable chunks:
>    - A && B && !C
>    - D
>    - F && (G || H)
>    - [...]
>
> I.e. transform the top level OR tokens into newlines and prepend each
> line with a minus. This makes the "Selected by:" and "Implied by:" blurb
> much easier to read. This is done only if there is more than one top
> level OR. "Depends on:" and "Range :" were deliberately left as they are.
>
> Based on idea from Paul Bolle.
>
> Reported-by: Paul Bolle <pebolle@tiscali.nl>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---

Applied to linux-kbuild/kconfig. Thanks!

-- 
Best Regards
Masahiro Yamada
