Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59524 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751648AbdK1RO1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Nov 2017 12:14:27 -0500
Received: from mail-ot0-f197.google.com ([74.125.82.197])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1eJjSk-0008GX-3e
        for linux-kbuild@vger.kernel.org; Tue, 28 Nov 2017 17:14:26 +0000
Received: by mail-ot0-f197.google.com with SMTP id g98so259886otg.11
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2017 09:14:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Tue, 28 Nov 2017 18:14:24 +0100
Message-ID: <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Nov 27, 2017 at 7:33 PM, Jim Davis <jim.epost@gmail.com> wrote:
>
> With this patch applied to the 4.14 kernel source, and running make
> snap-pkg on a Ubuntu 16.04 VM with the latest 16.04 kernel config
> file, I ran into
>
> Traceback (most recent call last):
>   File "/usr/lib/python3.5/shutil.py", line 538, in move
>     os.rename(src, real_dst)
> FileNotFoundError: [Errno 2] No such file or directory:
> '/home/jim/linux/snap/parts/kernel/install/lib/firmware' ->
> '/home/jim/linux/snap/parts/kernel/install/firmware'
>
> What did I miss?

You need a recent version of snapcraft, i landed a fix for that last week.

$ snap install --classic --edge snapcraft

or refresh it, in case you already installed via snaps:

$ snap refresh --edge snapcraft

and then 'make snap-pkg' again.
Beware of $PATH in case you have the snap and deb version installed.
-- 
bye,
p.
