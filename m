Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:42924 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751556AbdHPPcL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Aug 2017 11:32:11 -0400
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com [209.85.161.177]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v7GFW3Oe017990
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Aug 2017 00:32:04 +0900
Received: by mail-yw0-f177.google.com with SMTP id u207so24827498ywc.3
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Aug 2017 08:32:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEYzJUEgX4+1b0c8jqC7TALWZkKqLiqE0HMvB1zqHrEfv9yEEg@mail.gmail.com>
References: <20170724142047.3679-1-bjorn.forsman@gmail.com>
 <CAK7LNARVhn9QkjOSfSHr+G2P08v9za2m51cr6kruekA8FwVVhg@mail.gmail.com> <CAEYzJUEgX4+1b0c8jqC7TALWZkKqLiqE0HMvB1zqHrEfv9yEEg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 17 Aug 2017 00:31:22 +0900
Message-ID: <CAK7LNATj+oidNg_FTpa57BfUK=kBNhHzs8wdbobCFbQaagV2RA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: /bin/pwd -> pwd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kieran@ksquared.org.uk>

Hi.


2017-08-12 21:00 GMT+09:00 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> Hi,
>
> On 12 August 2017 at 05:26, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Hi.
>>
>> 2017-07-24 23:20 GMT+09:00 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
>>> Several places already use pwd and rely on $PATH lookup. Moving the
>>> remaining /bin/pwd users over for consistency.
>>>
>>> Also, a reason for doing /bin/pwd -> pwd instead of the other way aroun=
d
>>> is because I believe build systems should make little assumptions on ho=
st
>>> filesystem layout. Case in point, we do this kind of patching already i=
n
>>> NixOS.
>> [...]
>> Could you use $(abspath ...) instead of $(shell cd ... && /bin/pwd) ?
>> [...]
>> This one should use $(realpath ...) instead of $(abspath ...), I think.
>>
>> The difference between them is that
>> $(realpath ...) returns an empty string if the given path does not exist=
.
>
> That sounds like possibly changing semantics. I'd prefer to keep the
> patch as is, since I'm not familiar with the side effects of inserting
> relative vs absolute paths here. Is that OK for you?
>

I prefer abspath/realpath.

If you are reluctant to do it, I will take a look.



--=20
Best Regards
Masahiro Yamada
