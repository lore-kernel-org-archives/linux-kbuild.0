Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51909 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933650AbdK2RDK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 12:03:10 -0500
Received: from mail-ot0-f200.google.com ([74.125.82.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1eK5lN-0000jB-JH
        for linux-kbuild@vger.kernel.org; Wed, 29 Nov 2017 17:03:09 +0000
Received: by mail-ot0-f200.google.com with SMTP id c41so1978401otc.18
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 09:03:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com> <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Wed, 29 Nov 2017 18:03:07 +0100
Message-ID: <CAMsH0TSJuWLs-pDUyaop5g-LLvG1XuwsaUAap8LnF0NAKJGLKA@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Weird, are you sure you are checking the snap version?

$ /snap/bin/snapcraft --version
snapcraft, version 2.35+git26.0474d85

$ snap info snapcraft
name:      snapcraft
summary:   easily create snaps
publisher: canonical
contact:   snappy-canonical-storeaccount@canonical.com
description: |
  Snapcraft aims to make upstream developers' lives easier and as such is not a
  single toolset, but instead is a collection of tools that enable the natural
  workflow of an upstream to be extended with a simple release step into Snappy
  enabled system.
snap-id: vMTKRaLjnOJQetI78HjntT37VuoyssFE
commands:
  - snapcraft
tracking:    edge
installed:   2.35+git26.0474d85 (864) 53MB classic
refreshed:   2017-11-29 09:54:04 +0100 CET
channels:
  stable:    2.35               (794) 53MB classic
  candidate: ↑
  beta:      ↑
  edge:      2.35+git26.0474d85 (864) 53MB classic

On Tue, Nov 28, 2017 at 8:35 PM, Jim Davis <jim.epost@gmail.com> wrote:
> On Tue, Nov 28, 2017 at 10:14 AM, Paolo Pisati
> <paolo.pisati@canonical.com> wrote:
>> On Mon, Nov 27, 2017 at 7:33 PM, Jim Davis <jim.epost@gmail.com> wrote:
>>>
>>> With this patch applied to the 4.14 kernel source, and running make
>>> snap-pkg on a Ubuntu 16.04 VM with the latest 16.04 kernel config
>>> file, I ran into
>>>
>>> Traceback (most recent call last):
>>>   File "/usr/lib/python3.5/shutil.py", line 538, in move
>>>     os.rename(src, real_dst)
>>> FileNotFoundError: [Errno 2] No such file or directory:
>>> '/home/jim/linux/snap/parts/kernel/install/lib/firmware' ->
>>> '/home/jim/linux/snap/parts/kernel/install/firmware'
>>>
>>> What did I miss?
>>
>> You need a recent version of snapcraft, i landed a fix for that last week.
>>
>> $ snap install --classic --edge snapcraft
>>
>> or refresh it, in case you already installed via snaps:
>>
>> $ snap refresh --edge snapcraft
>>
>> and then 'make snap-pkg' again.
>> Beware of $PATH in case you have the snap and deb version installed.
>
> Ok, after updating and setting ~/snapcraft/bin/snapcraft ahead of
> /usr/bin in my $PATH, the build completed.   Oddly both
> /usr/bin/snapcraft --version and ~/snapcraft/bin/snapcraft --version
> return 2.34, though the build failed with /usr/bin/snapcraft.
>
> --
> Jim



-- 
bye,
p.
