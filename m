Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30279 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbeISMf7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Sep 2018 08:35:59 -0400
MIME-Version: 1.0
In-Reply-To: <2024081.XhWFmWp6tJ@blindfold>
References: <1537243113-1710-1-git-send-email-yamada.masahiro@socionext.com> <2024081.XhWFmWp6tJ@blindfold>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Sep 2018 15:58:40 +0900
Message-ID: <CAK7LNAQrOhJpkUf=zxvwcbf8oWTAhKiWxemweHz8QPT55H+R-g@mail.gmail.com>
Subject: Re: [PATCH] samples: disable CONFIG_SAMPLES for UML
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org, David Howells <dhowells@redhat.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

Hi.

2018-09-18 17:21 GMT+09:00 Richard Weinberger <richard@nod.at>:
> Am Dienstag, 18. September 2018, 05:58:33 CEST schrieb Masahiro Yamada:
>> Some samples require headers installation, so commit 3fca1700c4c3
>> ("kbuild: make samples really depend on headers_install") added
>> such dependency in the top Makefile.  However, UML fails to build
>> with CONFIG_SAMPLES=y because UML does not support headers_install.
>>
>> Fixes: 3fca1700c4c3 ("kbuild: make samples really depend on headers_install")
>> Reported-by: Kees Cook <keescook@chromium.org>
>> Cc: David Howells <dhowells@redhat.com>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Is there anything UML can do better?
> Not sure whether an arch like is supposed to install headers at all,
> I guess no. :)

I just thought suppressing CONFIG_SAMPLES was a big hammer.

We could install host-arch headers for UML if we like,
but I am not sure whether is is sensible...

Wait for comments in case somebody has a better solution.





-- 
Best Regards
Masahiro Yamada
