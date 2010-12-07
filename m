Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f45.google.com ([209.85.214.45]:41473 "EHLO
	mail-bw0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754402Ab0LGUbG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Dec 2010 15:31:06 -0500
MIME-Version: 1.0
In-Reply-To: <AANLkTi=iH6QOAph0iW6MR2khD5KCe8mRLPe8Y3QnTTTW@mail.gmail.com>
References: <AANLkTikVM=zakYF7uhX1mYHy9QUVL6dmEPNsmV7=oyuh@mail.gmail.com>
	<AANLkTi=iH6QOAph0iW6MR2khD5KCe8mRLPe8Y3QnTTTW@mail.gmail.com>
Date: Tue, 7 Dec 2010 21:31:04 +0100
Message-ID: <AANLkTik2SWrmVJ1o98-e2CwJP9SAo6oMmnuLc4K+rT1R@mail.gmail.com>
Subject: Re: visibility changes (was: Re: [GIT] kbuild and kconfig fixes for 2.6.37-rc5)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>, brueckner@linux.vnet.ibm.com, mchehab@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 7, 2010 at 20:51, Arnaud Lacombe <lacombar@gmail.com> wrote:
> On Tue, Dec 7, 2010 at 2:07 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Sat, Dec 4, 2010 at 14:57, Michal Marek <mmarek@suse.cz> wrote:
>>> please pull these kbuild/kconfig fixes for the next -rc. The largest
>>> part are fixes for the annoying kconfig warnings, contributed by Arnaud
>>> Lacombe and Mauro Carvalho Chehab. The solution adds a new 'visible if'
>>> keyword to the Kconfig language, so it's not exactly something that one
>>> would expect in the rc phase, but the kconfig change is not huge (the
>>> large diff is due to generated files) and it is deployed only in those
>>> five Kconfig files that had the warnings and were hard to fix by other
>>> means.  The second part is a forgotten patch by Hendrik Brueckner to
>>> usr/initramfs, that fixes build for Blackfin and h8300.
>>
>>> Arnaud Lacombe (5):
>>>      kconfig: add an option to determine a menu's visibility
>>
>> Hmm, this changeset also went in through the v4l tree?
>>
> Mauro merely imported the set in his tree to give them visibility and
> testing, but they went in trough the kbuild tree after being in -next
> for a week.

Hmm, git show 86e187ff9bce9fbed7bfed92ae34f491cf1af50f doesn't
show a SoB from Michal...

>> BTW, I got confused:
>>  - make allmodconfig causes e.g.:
>>        CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
>>        CONFIG_VIDEO_TVAUDIO=m
>>    => good
>>  - make oldconfig for my config with almost everything selected,
>> except for stuff I know that breaks:
>>        CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
>>        # CONFIG_VIDEO_TVAUDIO is not set
>>    and no way to manually set CONFIG_VIDEO_TVAUDIO=y?
>>    => bad!
> that's difficult to judge without your old configuration.
> VIDEO_TVAUDIO is only selected by VIDEO_BT848 which you don't give
> information about.

I don't have PCI, so I cannot enable VIDEO_BT848.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
