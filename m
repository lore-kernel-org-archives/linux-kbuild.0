Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22167 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732310AbeGLPGg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 11:06:36 -0400
MIME-Version: 1.0
In-Reply-To: <20180712110806.dql44ngo4nysozj6@pengutronix.de>
References: <1531391916-24086-1-git-send-email-yamada.masahiro@socionext.com> <20180712110806.dql44ngo4nysozj6@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Jul 2018 23:55:40 +0900
Message-ID: <CAK7LNATjU8mGaOARzV56MuUW=4JrGdJW0gOY5PoGn8t=8rva_g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: suppress warnings from 'getconf LFS_*'
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ben Hutchings <ben.hutchings@codethink.co.uk>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-12 20:08 GMT+09:00 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutron=
ix.de>:
> On Thu, Jul 12, 2018 at 07:38:36PM +0900, Masahiro Yamada wrote:
>> Suppress warnings for systems that do not recognize LFS_*.
>>
>>  getconf: no such configuration parameter `LFS_CFLAGS'
>>  getconf: no such configuration parameter `LFS_LDFLAGS'
>>  getconf: no such configuration parameter `LFS_LIBS'
>>
>> Fixes: d7f14c66c273 ("kbuild: Enable Large File Support for hostprogs")
>> Reported-by: Chen Feng <puck.chen@hisilicon.com>
>> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Which is the system that doesn't know about LFS_* and you care about?

No particular system in my mind.


Chen Feng reported this before.

I also found this:
https://stackoverflow.com/questions/47367350/how-to-recompile-torvalds-linu=
x-from-mac-osx-high-sierra



> Irrespective of that:
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
