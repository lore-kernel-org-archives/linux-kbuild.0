Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56615 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752637AbdIHLe5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Sep 2017 07:34:57 -0400
Received: from mail-oi0-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1dqHYm-0007rH-ED
        for linux-kbuild@vger.kernel.org; Fri, 08 Sep 2017 11:34:56 +0000
Received: by mail-oi0-f72.google.com with SMTP id m18so3458406oig.3
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Sep 2017 04:34:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhhZ2yFy=nzhs91nXxkPN_iSyUrE73EzBkB9NVHUOUHWrA@mail.gmail.com>
References: <1499698797-10747-1-git-send-email-paolo.pisati@canonical.com>
 <CA+r1Zhi3b_KxcKVohEty5ObdrA+OZ-3Pyyu2ggB1aDQ7FoHErw@mail.gmail.com>
 <CAMsH0TQF1drb2p9w8P5xnCvA4YGFKNfSRtBbmDHLFpOK__+x=w@mail.gmail.com> <CA+r1ZhhZ2yFy=nzhs91nXxkPN_iSyUrE73EzBkB9NVHUOUHWrA@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Fri, 8 Sep 2017 13:34:54 +0200
Message-ID: <CAMsH0TTiundrshLLSFC-71QBA+otrP7stTicJg7g=Wf2GPE7_Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Apologise for the late reply.

On Wed, Jul 19, 2017 at 2:02 AM, Jim Davis <jim.epost@gmail.com> wrote:
>
> Once I fed the snap into ubuntu-image, after hunting down a plausible
> model file, I did get an image file that booted under qemu.  I guess
> if you're in the know about snap (and I don't include myself in that
> august company) you'd know that the snap-pkg target won't directly
> give you something you can boot, but the "make help" output looks so
> similar to the other conventional build targets that the some might
> miss that point.

Well, snap-pkg gives you a kernel that you can use in an ubuntu-core
image (either when building an entire image from scratch, or you can
install it in a preinstalled system), much like deb-pkg or rpm-pkg
targets give you a kernel that you can use in a deb / rpm based
system, i don't see any semantics difference here.

> The snap-informed would also know that the snap-pkg target would
> download stuff from the internet as part of the build process, but
> that's unusual enough in kernel building that another recent build
> target, linkcheckdocs, included "(will connect to external hosts)" as
> part of its "make help" output.  That probably would be a good idea
> for the snap-pkg target too.

Ack.

> Running snap-pkg twice in a row seems to have rebuilt the entire
> kernel source, unlike the other more conventional build targets.

The deb-pkg and rpm-pkg targets rebuild from scratch too if invoked in a row.
-- 
bye,
p.
