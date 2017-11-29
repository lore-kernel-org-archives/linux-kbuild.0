Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51958 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933676AbdK2RFx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 12:05:53 -0500
Received: from mail-ot0-f197.google.com ([74.125.82.197])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1eK5o0-0000sJ-Pm
        for linux-kbuild@vger.kernel.org; Wed, 29 Nov 2017 17:05:52 +0000
Received: by mail-ot0-f197.google.com with SMTP id v8so2010810otd.4
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 09:05:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com> <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Wed, 29 Nov 2017 18:05:51 +0100
Message-ID: <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jim Davis <jim.epost@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Nov 29, 2017 at 8:33 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Worked for me too,
> after updating snapcraft.
>
>
> Is it really impossible to check the snapcraft version?
> What is the minimum version?   2.35 ?

The minimum version is 2.35+ - what is about to become 2.36 anytime soon now.
-- 
bye,
p.
