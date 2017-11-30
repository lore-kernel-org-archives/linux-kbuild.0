Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:42852 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751410AbdK3XPX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:15:23 -0500
MIME-Version: 1.0
In-Reply-To: <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
 <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com> <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Thu, 30 Nov 2017 16:15:22 -0700
Message-ID: <CA+r1Zhj6H8+g_F+caPvWrCouPk-Cib62wACG+uH=s3_Ato_qhQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Nov 29, 2017 at 10:05 AM, Paolo Pisati
<paolo.pisati@canonical.com> wrote:
> On Wed, Nov 29, 2017 at 8:33 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> Worked for me too,
>> after updating snapcraft.
>>
>>
>> Is it really impossible to check the snapcraft version?
>> What is the minimum version?   2.35 ?
>
> The minimum version is 2.35+ - what is about to become 2.36 anytime soon now.

If I run /snap/bin/snapcraft --version now on that Ubuntu 16.04 VM I
am getting 2.36+git2.ae61453.

I noticed that if I tried to make snap-pkg with the O=/some/dir option
the tar step failed but the rest of the build continued, and seems to
have finished successfully.  Should the snap-pkg target stop after a
tar failure?

-- 
Jim
