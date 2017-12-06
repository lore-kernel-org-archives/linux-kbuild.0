Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28101 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754965AbdLFKhk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Dec 2017 05:37:40 -0500
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhjW+OeTnCkffjMfoORx63h8PTNW91HVyvbqVWCpud0UiQ@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
 <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
 <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
 <CA+r1Zhj6H8+g_F+caPvWrCouPk-Cib62wACG+uH=s3_Ato_qhQ@mail.gmail.com>
 <CAMsH0TSaQ02dZOWSPj88tkC5G4bWe7hOOeOgUVOCasz4GRyRbQ@mail.gmail.com> <CA+r1ZhjW+OeTnCkffjMfoORx63h8PTNW91HVyvbqVWCpud0UiQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Dec 2017 19:36:45 +0900
Message-ID: <CAK7LNAToQjqUoA17jwvQzFzyijOP9HNGz8js3GREKTHd2NyyTw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Paolo Pisati <paolo.pisati@canonical.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2017-12-06 6:23 GMT+09:00 Jim Davis <jim.epost@gmail.com>:
> On Tue, Dec 5, 2017 at 4:43 AM, Paolo Pisati <paolo.pisati@canonical.com> wrote:
>
>>> I noticed that if I tried to make snap-pkg with the O=/some/dir option
>>> the tar step failed but the rest of the build continued, and seems to
>>> have finished successfully.  Should the snap-pkg target stop after a
>>> tar failure?
>>
>> That is weird, how did you do that?
>
> make O=/some/dir defconfig (or your-config-of-choice)
> make O=/some/dir snap-pkg
>
> The snap-pkg target is calling the src_tar command, which bails when
> $(objtree) isn't $(srctree).
>
> Is $(objtree) = $(srctree) a necessary restriction with snap builds?
> It's a restriction for rpm builds for some reason or another,

Rather, restriction for our build system.

Working directory is changed at the top Makefile if O= is given.
This option is propagated to sub-make.


> but I
> thought that was just a peculiarity of the rpm build process.  If the
> snap's tarball could be built without using src_tar, like the buildtar
> script does, then Bob's your uncle.

Probably, you must reset O=, KBUILD_OUTPUT, KBUILD_SRC, etc.
before calling rpmbuild, snapcraft, etc.

This is not a peculiarity of rpmbuild or snapcraft.

I guess things are not so simple as they look at a glance.



> Though if the source tree is an essential part of the snap build then
> perhaps the build should just exit if the tarball can't be generated
> for whatever reason, including users doing weird things :)
>

I agree, but this is not a problem specific to snap-pkg,
so Paolo's work will not be blocked.

I sent this patch:
https://patchwork.kernel.org/patch/10095377/



Just one question to Paolo:

  If some change like firmware removal happens in the future,
  patching for snapcraft is necessary?
    (i.e. users are required to upgrade snapcraft from --edge ?)

I guess the answer is yes, because "plugin: kernel" needs to know
the kernel-build system internal.

-- 
Best Regards
Masahiro Yamada
