Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62569 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751706AbdGHNme (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Jul 2017 09:42:34 -0400
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com [209.85.161.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v68DgVxE028394
        for <linux-kbuild@vger.kernel.org>; Sat, 8 Jul 2017 22:42:31 +0900
Received: by mail-yw0-f174.google.com with SMTP id l21so22256574ywb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 08 Jul 2017 06:42:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170629121724.cnv5eymfnlctdifk@pengutronix.de>
References: <20170629121136.16860-1-u.kleine-koenig@pengutronix.de> <20170629121724.cnv5eymfnlctdifk@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 8 Jul 2017 22:42:30 +0900
Message-ID: <CAK7LNATL1CkGMtyLVsR3791dgYHR6PQ7OBmaGSa0WPAkxk8PLw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable Large File Support for hostprogs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

2017-06-29 21:17 GMT+09:00 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutron=
ix.de>:
> Hello,
>
> On Thu, Jun 29, 2017 at 02:11:36PM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> diff --git a/Makefile b/Makefile
>> index e40c471abe29..2c72207ce298 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -301,9 +301,15 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; then =
echo $$BASH; \
>>         else if [ -x /bin/bash ]; then echo /bin/bash; \
>>         else echo sh; fi ; fi)
>>
>> +HOST_LFS_CFLAGS :=3D $(shell getconf LFS_CFLAGS)
>> +HOST_LFS_LDFLAGS :=3D $(shell getconf LFS_LDFLAGS)
>> +HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS)
>> +
>>  HOSTCC       =3D gcc
>>  HOSTCXX      =3D g++
>> -HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fo=
mit-frame-pointer -std=3Dgnu89
>> +HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fo=
mit-frame-pointer -std=3Dgnu89 $(HOST_LFS_CFLAGS)
>> +HOSTLDFLAGS  =3D $(HOST_LFS_LDFLAGS)
>> +HOST_LOADLIBES =3D $(HOST_LFS_LIBS)
>>  HOSTCXXFLAGS =3D -O2
>
> I forgot to add $(HOST_LFS_CFLAGS) to HOSTCXXFLAGS. I can resend if the
> patch is considered ok otherwise.
>

Ben,
Is this patch OK with you?




--=20
Best Regards
Masahiro Yamada
