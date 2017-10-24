Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26441 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750711AbdJXE2Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Oct 2017 00:28:24 -0400
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com [209.85.161.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v9O4SIdH029085
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Oct 2017 13:28:19 +0900
Received: by mail-yw0-f173.google.com with SMTP id u142so10493183ywg.4
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Oct 2017 21:28:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1508505607.2721.26.camel@decadent.org.uk>
References: <dbf8b816-e1f7-f835-dd32-6b517e87cbc4@foxmail.com>
 <1a4f82d9999041c6a3c5ce9f37805e7f@SOC-EX01V.e01.socionext.com>
 <20171020054710.vfkkfnl3hjqqmlsb@pengutronix.de> <1508505607.2721.26.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 24 Oct 2017 13:27:37 +0900
Message-ID: <CAK7LNAQZNx39GiKGP8b0Mc0Yj4co9GdcpaxGMEnqFs7meftz1Q@mail.gmail.com>
Subject: Re: getconf options
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: puck.chen@foxmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-10-20 22:20 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> On Fri, 2017-10-20 at 07:47 +0200, Uwe Kleine-K=C3=B6nig wrote:
>> Hello,
>>
>> On Fri, Oct 20, 2017 at 04:14:44AM +0000, yamada.masahiro@socionext.com =
wrote:
>> > > With commit d7f14c66c273b00aaa626f419d3155773a88d460, I got the foll=
ow
>> > > warning on macos.
>> > >
>> > > getconf: no such configuration parameter `LFS_CFLAGS'
>> > > getconf: no such configuration parameter `LFS_LDFLAGS'
>> > > getconf: no such configuration parameter `LFS_LIBS'
>> > > scripts/kconfig/mconf  Kconfig
>> > >
>> > > $ getconf LFS_CFLAGS
>> > > getconf: no such configuration parameter `LFS_CFLAGS'
>> > >
>> > >
>> > > Do you have some idea about this? Are these paremeters default to ge=
tconf?
>> > >
>> > > -Feng
>> > >
>> >
>> >
>> > Do you have a clue?
>> >
>> >
>> > Does it make sense to suppress warnings like this?
>> >
>> > HOST_LFS_CFLAGS :=3D $(shell getconf LFS_CFLAGS 2>/dev/null)
>> > HOST_LFS_LDFLAGS :=3D $(shell getconf LFS_LDFLAGS 2>/dev/null)
>> > HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS 2>/dev/null)
>> >
>> >
>> > Or, hard-code
>> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
>> > as Ben originally suggested?
>>
>> I'm not a fan of hardcoding these. On 64 bit arch (and I think also a
>> few 32 bit archs (x32?)) they are not needed and so IMHO shouldn't be
>> added.
>
> What harm would they do?
>
> Ben.
>
>> I think 2>/dev/null is fine.


If your machine does not recognize "getconf LFS_CFLAGS",
but needs LFS flags, it is a problem.

Hard-coding the flags seem more stable to me.



--=20
Best Regards
Masahiro Yamada
