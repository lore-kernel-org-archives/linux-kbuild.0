Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29823 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751015AbeBWMLc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 07:11:32 -0500
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com [209.85.217.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w1NCBIaT001906
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 21:11:19 +0900
Received: by mail-ua0-f180.google.com with SMTP id u99so5532371uau.8
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 04:11:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180221061052.GA29861@example.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com> <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
 <20180220150018.mjyjmdmao7xqyukr@huvuddator> <20180220195119.GA14262@vmlxhi-102.adit-jv.com>
 <CAFkk2KRxERva+XZi_fR_Epr63TwA6hKjwjCYnwtnK+xOSJUWHg@mail.gmail.com>
 <CAK7LNATTqqzJReUfkoxE=5+GsVUMv4wjOuz--=-PY_B4eK4NeA@mail.gmail.com> <20180221061052.GA29861@example.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 23 Feb 2018 21:10:37 +0900
Message-ID: <CAK7LNATHuCmU3WJJZs_S6ppZ2dbaZJa66yWhaCRJxqB6PLXgQg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>

Eugeniu,


2018-02-21 15:10 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:

>
> I've tested https://patchwork.kernel.org/patch/10229545/ and
> https://patchwork.kernel.org/patch/10231295/ and they work great for me.
> Thank you for this feature.
>

I will give you that code in the second one.

Please fill the commit log with yours,
and also fix the bugs pointed by Petr.

Anyway, I will claim my contribution
in the form of Signed-off-by when I pick it up.  :)


-- 
Best Regards
Masahiro Yamada
