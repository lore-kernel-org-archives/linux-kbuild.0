Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:35762 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbcCYIyr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Mar 2016 04:54:47 -0400
MIME-Version: 1.0
In-Reply-To: <20160324205119.GA11597@pobox.suse.cz>
References: <20160324205119.GA11597@pobox.suse.cz>
Date: Fri, 25 Mar 2016 09:54:45 +0100
Message-ID: <CAMuHMdUrEbBi=Lmjq_R8YcaXueS5ErEV+qEbDjUS22iG7wcUpw@mail.gmail.com>
Subject: Re: [GIT PULL] kconfig changes for v4.6-rc1
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jan Beulich <JBeulich@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Michal, Al,

On Thu, Mar 24, 2016 at 9:51 PM, Michal Marek <mmarek@suse.cz> wrote:
> just two kconfig commits this time:
> - kconfig Makefile fix for make 3.80
> - Fix calculating symbols so that KCONFIG_ALLCONFIG=... does not disable
>   CONFIG_MODULES silently

> for you to fetch changes up to 6b87b70c5339f30e3c5b32085e69625906513dc2:
>
>   unbreak allmodconfig KCONFIG_ALLCONFIG=... (2016-02-01 15:12:40 +0100)
>
> ----------------------------------------------------------------
> Al Viro (1):
>       unbreak allmodconfig KCONFIG_ALLCONFIG=...

I can now indeed drop the

    CONFIG_MODULES=y

line from my

    allmod.config

However, this fix has the side-effect of enabling CONFIG_MODULES silently for

    make allyesconfig KCONFIG_ALLCONFIG=1

Adding an explicit

    CONFIG_MODULES=n

to the allyes.config file fixes that.

IMHO CONFIG_MODULES should default to y when using allmodconfig, and
default to n when using allyesconfig.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
