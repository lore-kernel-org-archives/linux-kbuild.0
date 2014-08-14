Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:60656 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196AbaHNJCZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Aug 2014 05:02:25 -0400
Received: by mail-la0-f49.google.com with SMTP id hz20so728524lab.8
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Aug 2014 02:02:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53EC7839.3010704@roeck-us.net>
References: <F5184659D418E34EA12B1903EE5EF5FD0130D4AC5B90@seldmbx02.corpusers.net>
	<20140813180743.GB16662@roeck-us.net>
	<CAMuHMdVEYEsk1EtBbAAinJ=7m5SRh-w4DZb=_N0gaMgpvtRadw@mail.gmail.com>
	<20140813224507.GA29606@roeck-us.net>
	<CAMuHMdXZWhLtTzUnPymSt-P=viz7O7fq8nFaM-mHLT+XMnRJcA@mail.gmail.com>
	<53EC7839.3010704@roeck-us.net>
Date: Thu, 14 Aug 2014 11:02:21 +0200
Message-ID: <CAMuHMdVQkqiE_S3ZAFziYXT4qESeofvC-6MsXfo_pYJxez2udQ@mail.gmail.com>
Subject: Re: [Ksummit-discuss] RFC: Kernel tinification - kernel config reduction
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Bird, Tim" <Tim.Bird@sonymobile.com>, "ksummit-discuss@lists.linuxfoundation.org" <ksummit-discuss@lists.linuxfoundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Günther,

CC kbuild

On Thu, Aug 14, 2014 at 10:50 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 08/14/2014 12:40 AM, Geert Uytterhoeven wrote:
>>> Maybe something like
>>>
>>> make PCI=n allmodconfig
>>> make GPIOLIB=n allmodconfig
>>>
>>> which would let me disable key options selectively so I can improve
>>> compile
>>> coverage without having to go through all configurations (or randconfig).
>>
>>
>> That's doable, using KCONFIG_ALLCONFIG.
>>
> I'll play with it some more, but a quick glance (and test) suggests that I
> can
> only use it to force a configuration option to be true, not to force it to
> be false. Also, there seems to be an odd side effect.
>
> With
>         kconfig.gpio:   "CONFIG_GPIOLIB=y"
> and
>         kconfig.nogpio: "# CONFIG_GPIOLIB is not set"
>
> KCONFIG_ALLCONFIG=kconfig.gpio make allnoconfig
>         causes CONFIG_GPIOLIB to be set.
>
> KCONFIG_ALLCONFIG=kconfig.gpio make allmodconfig
> KCONFIG_ALLCONFIG=kconfig.nogpio make allmodconfig
>         both have the odd and at least for me unexpected effect of disabling
>         CONFIG_MODULES, but do not affect CONFIG_GPIOLIB.

Strange...

I also saw strange things with randconfig, needing config input during the
subsequent build, or "make oldconfig" asking new questions, just after
having done a randconfig.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
