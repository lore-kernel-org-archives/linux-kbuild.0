Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:38430 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751066AbdLEVXs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Dec 2017 16:23:48 -0500
MIME-Version: 1.0
In-Reply-To: <CAMsH0TSaQ02dZOWSPj88tkC5G4bWe7hOOeOgUVOCasz4GRyRbQ@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
 <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
 <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
 <CA+r1Zhj6H8+g_F+caPvWrCouPk-Cib62wACG+uH=s3_Ato_qhQ@mail.gmail.com> <CAMsH0TSaQ02dZOWSPj88tkC5G4bWe7hOOeOgUVOCasz4GRyRbQ@mail.gmail.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 5 Dec 2017 14:23:46 -0700
Message-ID: <CA+r1ZhjW+OeTnCkffjMfoORx63h8PTNW91HVyvbqVWCpud0UiQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Dec 5, 2017 at 4:43 AM, Paolo Pisati <paolo.pisati@canonical.com> wrote:

>> I noticed that if I tried to make snap-pkg with the O=/some/dir option
>> the tar step failed but the rest of the build continued, and seems to
>> have finished successfully.  Should the snap-pkg target stop after a
>> tar failure?
>
> That is weird, how did you do that?

make O=/some/dir defconfig (or your-config-of-choice)
make O=/some/dir snap-pkg

The snap-pkg target is calling the src_tar command, which bails when
$(objtree) isn't $(srctree).

Is $(objtree) = $(srctree) a necessary restriction with snap builds?
It's a restriction for rpm builds for some reason or another, but I
thought that was just a peculiarity of the rpm build process.  If the
snap's tarball could be built without using src_tar, like the buildtar
script does, then Bob's your uncle.

Though if the source tree is an essential part of the snap build then
perhaps the build should just exit if the tarball can't be generated
for whatever reason, including users doing weird things :)

-- 
Jim
