Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43644 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750769AbeAYE6s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jan 2018 23:58:48 -0500
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com [209.85.213.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id w0P4wTSJ002207
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jan 2018 13:58:30 +0900
Received: by mail-vk0-f47.google.com with SMTP id h69so4071714vke.7
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jan 2018 20:58:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180123193103.17651-1-petr.vorel@gmail.com>
References: <20180123193103.17651-1-petr.vorel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 25 Jan 2018 13:57:48 +0900
Message-ID: <CAK7LNASF79H3R4Mh4yhnhYqkyPk5ehWEH-CnmN593a=YQDm1+g@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] kconfig: menuconfig make "Selected by:" and
 "Implied by:" readable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>

2018-01-24 4:31 GMT+09:00 Petr Vorel <petr.vorel@gmail.com>:
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


I forgot to mention this.

The patch subject is strange because this is not limited to menuconfig.

menu_get_ext_help() is called from all kconfig host programs
(conf, mconf, gconf, nconf, qconf)



-- 
Best Regards
Masahiro Yamada
