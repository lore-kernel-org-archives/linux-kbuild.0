Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:38124 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751661AbdLAMDe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Dec 2017 07:03:34 -0500
Received: by mail-lf0-f67.google.com with SMTP id e137so11462983lfg.5
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Dec 2017 04:03:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
 <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com> <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Fri, 1 Dec 2017 14:03:31 +0200
Message-ID: <CAAqcGHmG7jNvWXbG7_FTpLb4FrD5BjDfzzQMXqu7s9hvwnXUYw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jim Davis <jim.epost@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On 29 November 2017 at 19:05, Paolo Pisati <paolo.pisati@canonical.com> wrote:
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

Since you are already patching snapcraft for this, why not embed the
whole support in snapcraft? Eg something like snapcraft --kernel
/path/to/kernel

The key advantage you'll get is being able to support old kernel versions too.

Riku
