Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64717 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbdLLPJF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Dec 2017 10:09:05 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNARWZ-OSV+USgzuQCK4H1UL3pvY-NRDVN2665tuaOgqkSA@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
 <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
 <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
 <CA+r1Zhj6H8+g_F+caPvWrCouPk-Cib62wACG+uH=s3_Ato_qhQ@mail.gmail.com>
 <CAMsH0TSaQ02dZOWSPj88tkC5G4bWe7hOOeOgUVOCasz4GRyRbQ@mail.gmail.com>
 <CA+r1ZhjW+OeTnCkffjMfoORx63h8PTNW91HVyvbqVWCpud0UiQ@mail.gmail.com>
 <CAK7LNAToQjqUoA17jwvQzFzyijOP9HNGz8js3GREKTHd2NyyTw@mail.gmail.com>
 <CAMsH0TSzcWYV5tru7NXDOur_pHNHO+qkEgpp0m--Jeqjn-h7KQ@mail.gmail.com> <CAK7LNARWZ-OSV+USgzuQCK4H1UL3pvY-NRDVN2665tuaOgqkSA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 13 Dec 2017 00:08:10 +0900
Message-ID: <CAK7LNAQFiuTPRAsLMscCQ3v3EoGfYYkQfnKDFP0qmMCdSCGF-g@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Jim Davis <jim.epost@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2017-12-08 0:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 2017-12-07 3:14 GMT+09:00 Paolo Pisati <paolo.pisati@canonical.com>:
>> On Wed, Dec 6, 2017 at 11:36 AM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> Just one question to Paolo:
>>>
>>>   If some change like firmware removal happens in the future,
>>>   patching for snapcraft is necessary?
>>>     (i.e. users are required to upgrade snapcraft from --edge ?)
>>>
>>> I guess the answer is yes, because "plugin: kernel" needs to know
>>> the kernel-build system internal.
>>
>> Well, in this case, i had to fix the 'kernel-with-firmware' option to
>> skip the 'firmware_install' step since
>> we took it by default - let's say that in the future the
>> 'modules_install' target is removed or change name,
>> then i'll have to patch snapcraft.
>>
>> Wrt updating from -edge, i told you to take it from there because snap
>> packages land there more often and more quickly
>> compared to the canonicaldeb  archive, so from a developer perspective
>> it's easier&quicker to iterate over it, but sooner
>> or later (e.g. once snapcraft 2.36.1 reaches the snap -stable
>> channel), it will be copied to the deb archive too -
>> IOW, you would get using apt-get only too.
>> --
>
>
> I will pick up this for v4.16-rc1.
> It sounds like this target is a bit fragile, but let's see.
> I hope a breakage will not happen...
>


Applied to linux-kbuild/misc.  Thanks!

-- 
Best Regards
Masahiro Yamada
