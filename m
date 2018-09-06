Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19052 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbeIFFTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 01:19:40 -0400
MIME-Version: 1.0
In-Reply-To: <20180905225333.GA23155@gate.crashing.org>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
 <1532072796-7947-8-git-send-email-yamada.masahiro@socionext.com>
 <20180903093945.GA1195@zn.tnic> <CAK7LNAQOd-QA6E7189q4K-p_9ReRtE88UbhtuXS9600nOQTgaA@mail.gmail.com>
 <20180903100021.GD10249@zn.tnic> <20180905225333.GA23155@gate.crashing.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 6 Sep 2018 09:46:05 +0900
Message-ID: <CAK7LNATJ494dsB_dYu3LvvxebBJCo-ru+-9d=ctVmG_BbXr7Og@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] kbuild: use 'include' directive to load
 auto.conf from top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Borislav Petkov <bp@alien8.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-09-06 7:53 GMT+09:00 Segher Boessenkool <segher@kernel.crashing.org>:
> On Mon, Sep 03, 2018 at 12:00:21PM +0200, Borislav Petkov wrote:
>> On Mon, Sep 03, 2018 at 06:54:12PM +0900, Masahiro Yamada wrote:
>> > You are right - I missed this usecase,
>> > but I still want to excuse "it is rare enough".
>>
>> Isn't there a Makefile way to check file existence before including it?
>
> Sure there is, you can use $(wildcard ) .


If you work around it by $(wildcard ),
we need something else that terminates building
in case auto.conf is really missing.


I do not want to revert

commit 2063945fdc3d4c0ac8f9319d942eda720d02aabe
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri Jul 20 16:46:36 2018 +0900

    kbuild: remove auto.conf from prerequisite of phony targets





-- 
Best Regards
Masahiro Yamada
