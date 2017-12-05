Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38126 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751796AbdLELbH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Dec 2017 06:31:07 -0500
Received: from mail-oi0-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1eMBRK-0007UP-7h
        for linux-kbuild@vger.kernel.org; Tue, 05 Dec 2017 11:31:06 +0000
Received: by mail-oi0-f70.google.com with SMTP id w78so9071042oiw.6
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Dec 2017 03:31:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHmG7jNvWXbG7_FTpLb4FrD5BjDfzzQMXqu7s9hvwnXUYw@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
 <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
 <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com> <CAAqcGHmG7jNvWXbG7_FTpLb4FrD5BjDfzzQMXqu7s9hvwnXUYw@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Tue, 5 Dec 2017 12:31:04 +0100
Message-ID: <CAMsH0TTtpGE5G-OQLrc_Dk54CRzT9WcF9iUkEB-1=cJ1_oXwqQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jim Davis <jim.epost@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Dec 1, 2017 at 1:03 PM, Riku Voipio <riku.voipio@linaro.org> wrote:
>
> Since you are already patching snapcraft for this, why not embed the
> whole support in snapcraft? Eg something like snapcraft --kernel
> /path/to/kernel
>
> The key advantage you'll get is being able to support old kernel versions too.

There's a lot more you can do inside a snapcraft.yaml (bundle external
files, override .config options, run pre or post scripts, etc) but by
embedding everything inside the kernel/kbuild plugins
you would loose all these options, and people would loose visibility
of these opportunities.

Besides, snapcraft requires a snapcraft.yaml by design, and i can't
remove that (such a change would never be accepted).
-- 
bye,
p.
