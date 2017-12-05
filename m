Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38367 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbdLELn0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Dec 2017 06:43:26 -0500
Received: from mail-ot0-f200.google.com ([74.125.82.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1eMBdF-0008Q5-Ur
        for linux-kbuild@vger.kernel.org; Tue, 05 Dec 2017 11:43:26 +0000
Received: by mail-ot0-f200.google.com with SMTP id n64so11147108ota.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Dec 2017 03:43:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+r1Zhj6H8+g_F+caPvWrCouPk-Cib62wACG+uH=s3_Ato_qhQ@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com>
 <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
 <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
 <CAMsH0TRSnWvR8pH-3ksBsb-WPMuq-PpFT+W6PdBX=xd-HhyZ4g@mail.gmail.com> <CA+r1Zhj6H8+g_F+caPvWrCouPk-Cib62wACG+uH=s3_Ato_qhQ@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Tue, 5 Dec 2017 12:43:24 +0100
Message-ID: <CAMsH0TSaQ02dZOWSPj88tkC5G4bWe7hOOeOgUVOCasz4GRyRbQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Dec 1, 2017 at 12:15 AM, Jim Davis <jim.epost@gmail.com> wrote:
>
> If I run /snap/bin/snapcraft --version now on that Ubuntu 16.04 VM I
> am getting 2.36+git2.ae61453.

Yep, the edge channel follows the bleeding edge:

$ snap info snapcraft
...
channels:
  stable:    2.35                (794) 53MB classic
  candidate: ↑
  beta:      2.36.1              (876) 53MB classic
  edge:      2.36.1+git6.3524514 (895) 53MB classic

you better switch to beta (and then stable when 2.36.1 gets promoted there):

$ snap refresh --beta snapcraft

> I noticed that if I tried to make snap-pkg with the O=/some/dir option
> the tar step failed but the rest of the build continued, and seems to
> have finished successfully.  Should the snap-pkg target stop after a
> tar failure?

That is weird, how did you do that?

My experience with the O=... option (that mimicks the other rpm-pkg
and deb-pkg targets) is that, you first create the dir, copy there the
.config and it builds fine:

~/linux $ mke defconfig
...
~/linux $ mkdir /tmp/foobar
~/linux $ mv .config /tmp/foobar
~/linux $ git clean -ffdx
~/linux $ make O=/tmp/foobar snap-pkg
...
Snapped kernel_4.14.0+_amd64.snap
~/linux $ ls -la /tmp/foobar/snap/
-rw-r--r-- 1 flag flag 14114816 dic  5 12:41 kernel_4.14.0+_amd64.snap
drwxrwxr-x 3 flag flag     4096 dic  5 12:38 parts
drwxrwxr-x 4 flag flag     4096 dic  5 12:41 prime
drwxrwxr-x 3 flag flag     4096 dic  5 12:38 snap
-rw-rw-r-- 1 flag flag      274 dic  5 12:38 snapcraft.yaml
drwxrwxr-x 3 flag flag     4096 dic  5 12:41 stage




-- 
bye,
p.
