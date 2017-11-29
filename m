Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:61643 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751241AbdK2Hdu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 02:33:50 -0500
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
 <CAMsH0TRjz3DCPXab6c5m20yr9+diQ0sBgcS3ELcmWn-3Wz2TVQ@mail.gmail.com> <CA+r1ZhgFQS6EEzazw0YZXhYqm+WN3mp69mGyaeNpX36WZLABrA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 29 Nov 2017 16:33:03 +0900
Message-ID: <CAK7LNARNfOzuR72U6Co0GYt7=7V4u8TmTUQAsB8R7H_5QYQ_5A@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, Paolo Pisati <paolo.pisati@canonical.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2017-11-29 4:35 GMT+09:00 Jim Davis <jim.epost@gmail.com>:
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Worked for me too,
after updating snapcraft.


Is it really impossible to check the snapcraft version?
What is the minimum version?   2.35 ?



-- 
Best Regards
Masahiro Yamada
