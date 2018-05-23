Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18297 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753140AbeEWCYd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 22:24:33 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQUF6YbHRTJOtQ9F91M-iqF1U+PemDAbsdx3qzcqg4Ufw@mail.gmail.com>
References: <20180522194928.GA29900@ravnborg.org> <CAK7LNAQUF6YbHRTJOtQ9F91M-iqF1U+PemDAbsdx3qzcqg4Ufw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 23 May 2018 11:23:38 +0900
Message-ID: <CAK7LNAQWHeR71=H5Z94jAMjRjE-kmjFaPrQy6_cd5=G_WHEpUw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] kconfig: drop localization support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>

2018-05-23 10:40 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 2018-05-23 4:49 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
>> From b243b06da1417efe01ca7041371f4597584f8a10 Mon Sep 17 00:00:00 2001
>> From: Sam Ravnborg <sam@ravnborg.org>
>> Date: Tue, 22 May 2018 21:36:12 +0200
>> Subject: [PATCH 1/1] kconfig: drop localization support
>>
>> The localization support is broken and appears unused.
>> There is no google hits on the update-po-config target.
>> And there is no recent (5 years) activity related to the localization.
>>
>> So lets just drop this as it is no longer used.
>>
>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> ---
>
> Thank you for cleaing up!
>
>
> Ulf Magnusson originally mentioned this removal some time ago.
>
> So, here is his tag.
>
> Suggested-by: Ulf Magnusson <ulfalizer@gmail.com>
>
>
>
>
>
>
>> The patch is on top of the series "kconfig: refactor package checks for GUI frontends"
>> It was triggerd by a comment by Masahiro.
>>
>> I have compile time checked all targets - and checkted that they starts.
>> diffstat looks nice, and the simplification of the Makefile was worth it all.
>>
>> I considered a stepwise approach, but changes are all simple so ended
>> up with this "all-in-one-go" approach.
>>
>>         Sam
>>


Just a nit:


PHONY += xconfig gconfig menuconfig config syncconfig update-po-config \
     localmodconfig localyesconfig


The 'update-po-config' is left-over in the PHONY assignment.

This is simple, so I can fix it up locally.






-- 
Best Regards
Masahiro Yamada
