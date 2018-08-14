Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:48752 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730438AbeHNFeo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Aug 2018 01:34:44 -0400
MIME-Version: 1.0
In-Reply-To: <20180813172003.GA20519@ravnborg.org>
References: <1534178919-8375-1-git-send-email-yamada.masahiro@socionext.com> <20180813172003.GA20519@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Aug 2018 11:48:53 +0900
Message-ID: <CAK7LNAQ+xe56yVs=R1MjWX71Bw+kwjSeGpRP-kD0TY3oEmy4+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: remove unused sym_get_env_prop() function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-08-14 2:20 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
> On Tue, Aug 14, 2018 at 01:48:38AM +0900, Masahiro Yamada wrote:
>> This function is unused since commit 104daea149c4 ("kconfig: reference
>> environment variables directly and remove 'option env='").
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Both patches are obviously correct.
> Feel free to add:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> and apply to kbuild so we  can get them in this cycle.
>
>         Sam


Applied to linux-kbuild/kconfig with Sam's Ack.



-- 
Best Regards
Masahiro Yamada
