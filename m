Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33012 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755251AbdGKGNt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Jul 2017 02:13:49 -0400
Received: by mail-oi0-f46.google.com with SMTP id p188so93348842oia.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jul 2017 23:13:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+r1Zhi3b_KxcKVohEty5ObdrA+OZ-3Pyyu2ggB1aDQ7FoHErw@mail.gmail.com>
References: <1499698797-10747-1-git-send-email-paolo.pisati@canonical.com> <CA+r1Zhi3b_KxcKVohEty5ObdrA+OZ-3Pyyu2ggB1aDQ7FoHErw@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Tue, 11 Jul 2017 08:13:47 +0200
Message-ID: <CAMsH0TQF1drb2p9w8P5xnCvA4YGFKNfSRtBbmDHLFpOK__+x=w@mail.gmail.com>
Subject: Re: [PATCH] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Jul 10, 2017 at 6:46 PM, Jim Davis <jim.epost@gmail.com> wrote:
>>
>> For more information on snap packages: https://snapcraft.io/docs/
>
> Is this something a user could do with the existing deb target, and
> then running deb2snap?

No, the kernel snap is a special case, it requires communication with
the store (e.g. to download the core snap) and some extra steps,
therefore you should use snapcraft and abstract from these details.
-- 
bye,
p.
