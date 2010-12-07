Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f42.google.com ([74.125.83.42]:60694 "EHLO
	mail-gw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754534Ab0LGTvT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Dec 2010 14:51:19 -0500
MIME-Version: 1.0
In-Reply-To: <AANLkTikVM=zakYF7uhX1mYHy9QUVL6dmEPNsmV7=oyuh@mail.gmail.com>
References: <AANLkTikVM=zakYF7uhX1mYHy9QUVL6dmEPNsmV7=oyuh@mail.gmail.com>
Date: Tue, 7 Dec 2010 14:51:18 -0500
Message-ID: <AANLkTi=iH6QOAph0iW6MR2khD5KCe8mRLPe8Y3QnTTTW@mail.gmail.com>
Subject: Re: visibility changes (was: Re: [GIT] kbuild and kconfig fixes for 2.6.37-rc5)
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>, brueckner@linux.vnet.ibm.com, mchehab@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Tue, Dec 7, 2010 at 2:07 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, Dec 4, 2010 at 14:57, Michal Marek <mmarek@suse.cz> wrote:
>> please pull these kbuild/kconfig fixes for the next -rc. The largest
>> part are fixes for the annoying kconfig warnings, contributed by Arnaud
>> Lacombe and Mauro Carvalho Chehab. The solution adds a new 'visible if'
>> keyword to the Kconfig language, so it's not exactly something that one
>> would expect in the rc phase, but the kconfig change is not huge (the
>> large diff is due to generated files) and it is deployed only in those
>> five Kconfig files that had the warnings and were hard to fix by other
>> means.  The second part is a forgotten patch by Hendrik Brueckner to
>> usr/initramfs, that fixes build for Blackfin and h8300.
>
>> Arnaud Lacombe (5):
>>      kconfig: add an option to determine a menu's visibility
>
> Hmm, this changeset also went in through the v4l tree?
>
Mauro merely imported the set in his tree to give them visibility and
testing, but they went in trough the kbuild tree after being in -next
for a week.

> BTW, I got confused:
>  - make allmodconfig causes e.g.:
>        CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
>        CONFIG_VIDEO_TVAUDIO=m
>    => good
>  - make oldconfig for my config with almost everything selected,
> except for stuff I know that breaks:
>        CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
>        # CONFIG_VIDEO_TVAUDIO is not set
>    and no way to manually set CONFIG_VIDEO_TVAUDIO=y?
>    => bad!
that's difficult to judge without your old configuration.
VIDEO_TVAUDIO is only selected by VIDEO_BT848 which you don't give
information about.

 - Arnaud
