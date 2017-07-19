Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33645 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751962AbdGSACq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Jul 2017 20:02:46 -0400
MIME-Version: 1.0
In-Reply-To: <CAMsH0TQF1drb2p9w8P5xnCvA4YGFKNfSRtBbmDHLFpOK__+x=w@mail.gmail.com>
References: <1499698797-10747-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1Zhi3b_KxcKVohEty5ObdrA+OZ-3Pyyu2ggB1aDQ7FoHErw@mail.gmail.com> <CAMsH0TQF1drb2p9w8P5xnCvA4YGFKNfSRtBbmDHLFpOK__+x=w@mail.gmail.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 18 Jul 2017 17:02:45 -0700
Message-ID: <CA+r1ZhhZ2yFy=nzhs91nXxkPN_iSyUrE73EzBkB9NVHUOUHWrA@mail.gmail.com>
Subject: Re: [PATCH] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Jul 10, 2017 at 11:13 PM, Paolo Pisati
<paolo.pisati@canonical.com> wrote:
> On Mon, Jul 10, 2017 at 6:46 PM, Jim Davis <jim.epost@gmail.com> wrote:
>>>
>>> For more information on snap packages: https://snapcraft.io/docs/
>>
>> Is this something a user could do with the existing deb target, and
>> then running deb2snap?
>
> No, the kernel snap is a special case, it requires communication with
> the store (e.g. to download the core snap) and some extra steps,
> therefore you should use snapcraft and abstract from these details.

From a quick check on top of 4.13-rc1 it does what it says, but...
building a snap like this, unless I'm missing something, is quite
different from building a kernel deb or rpm or tar package.

Once I fed the snap into ubuntu-image, after hunting down a plausible
model file, I did get an image file that booted under qemu.  I guess
if you're in the know about snap (and I don't include myself in that
august company) you'd know that the snap-pkg target won't directly
give you something you can boot, but the "make help" output looks so
similar to the other conventional build targets that the some might
miss that point.

The snap-informed would also know that the snap-pkg target would
download stuff from the internet as part of the build process, but
that's unusual enough in kernel building that another recent build
target, linkcheckdocs, included "(will connect to external hosts)" as
part of its "make help" output.  That probably would be a good idea
for the snap-pkg target too.

Running snap-pkg twice in a row seems to have rebuilt the entire
kernel source, unlike the other more conventional build targets.


-- 
Jim
