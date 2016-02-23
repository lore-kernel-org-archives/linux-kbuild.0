Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35563 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbcBWR5i (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2016 12:57:38 -0500
Received: by mail-ob0-f177.google.com with SMTP id dm2so27496175obb.2
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Feb 2016 09:57:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160223162940.GA28373@hudson.localdomain>
References: <20160223162940.GA28373@hudson.localdomain>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 23 Feb 2016 09:57:18 -0800
Message-ID: <CALCETrW8WbrGq7bvd9bKVL2rjq5D-5eWx=QbCKffQF=Z6KvSzg@mail.gmail.com>
Subject: Re: [REGRESSION] dell-wmi, dell-laptop: select DMI, Kconfig recursive dependency
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeremiah Mahler <jmmahler@gmail.com>, Andy Lutomirski <luto@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.de>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>

On Tue, Feb 23, 2016 at 8:29 AM, Jeremiah Mahler <jmmahler@gmail.com> wrote:
> Hi Andy,
>
> Running the latest linux-next I am getting a Kconfig recursive
> dependency detected message that was not present before.

Here's a heavily edited version, because the actual output is unreadable.

>
>   jeri@hudson:~/linux-next$ make oldconfig
>   scripts/kconfig/conf  --oldconfig Kconfig
>   drivers/gpio/Kconfig:34:error: recursive dependency detected!
>   drivers/gpio/Kconfig:34:      symbol GPIOLIB is selected by GEOS
>   arch/x86/Kconfig:2572:        symbol GEOS depends on DMI
>   arch/x86/Kconfig:810: symbol DMI is selected by DELL_LAPTOP
>   drivers/platform/x86/Kconfig:104:     symbol DELL_LAPTOP depends on BACKLIGHT_CLASS_DEVICE
>   drivers/video/backlight/Kconfig:158:  symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>   drivers/video/fbdev/Kconfig:192:      symbol FB_BACKLIGHT is selected by FB_SSD1307
>   drivers/video/fbdev/Kconfig:2463:     symbol FB_SSD1307 depends on GPIOLIB

This is still unreadable because "selected by" is confusingly
backwards.  Let's rewrite where --> means "depends" and ==> means
"selects".

GEOS ==> GPIOLIB
GEOS --> DMI
DELL_LAPTOP ==> DMI
DELL_LAPTOP --> BACKLIGHT_CLASS_DEVICE
FB_BACKLIGHT ==> BACKLIGHT_CLASS_DEVICE
FB_SSD1307 ==> FB_BACKLIGHT
FB_SSD1307 --> GPIOLIB

Which has no recursive dependencies.  Unfortunately, it seems that
actual limitation isn't that kconfig can't handle recursive
dependencies -- it's that it can't handle cycles in the graph in which
all the "select" edges are *backwards*.

Presumably we should either make DELL_LAPTOP depend on DMI instead of
selecting it or we should complain to the kconfig maintainers.

Kconfig people: what's the actual problem here?

--Andy
