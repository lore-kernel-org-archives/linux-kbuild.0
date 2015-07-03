Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34410 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754894AbbGCLLV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 07:11:21 -0400
MIME-Version: 1.0
In-Reply-To: <CABv5NL_-1zeOR+=9KHLmzZKMd7DXCLtQB+wVW79u8YaJQbN5Rw@mail.gmail.com>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
	<1435827662.2423.4.camel@tiscali.nl>
	<55952723.80801@fau.de>
	<1435839005.2423.28.camel@tiscali.nl>
	<55963AD7.3040905@fau.de>
	<1435913987.2423.38.camel@tiscali.nl>
	<559655E3.6010400@fau.de>
	<CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
	<CAD3Xx4LSYWfeeSyEnFNgOHera9wnt2ZxBrRutzMdw2tbaC1DNw@mail.gmail.com>
	<CABv5NL_-1zeOR+=9KHLmzZKMd7DXCLtQB+wVW79u8YaJQbN5Rw@mail.gmail.com>
Date: Fri, 3 Jul 2015 13:11:19 +0200
Message-ID: <CABv5NL_xyB2U6khOudBok_v_H0cw1E7m7uJ0iSPVn0DYW-w9Pg@mail.gmail.com>
Subject: Re: Kconfig: '+config' valid syntax?
From: Stefan Hengelein <stefan.hengelein@fau.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Ulf Magnusson <ulfalizer.lkml@gmail.com>, Andreas Ruprecht <andreas.ruprecht@fau.de>, Paul Bolle <pebolle@tiscali.nl>, rafael.j.wysocki@intel.com, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@dominikbrodowski.net

2015-07-03 12:56 GMT+02:00 Stefan Hengelein <stefan.hengelein@fau.de>:
> 2015-07-03 12:51 GMT+02:00 Valentin Rothberg <valentinrothberg@gmail.com>:
>>>>
>>>> The output looks like this:
>>>> scripts/kconfig/conf  --allyesconfig Kconfig
>>>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>>>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>>>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>>>> init/Kconfig:222:warning: ignoring unsupported character '-'
>>>> init/Kconfig:222:warning: ignoring unsupported character '-'
>>>> init/Kconfig:222:warning: ignoring unsupported character '-'
>>>> init/Kconfig:244:warning: ignoring unsupported character '-'
>>>> init/Kconfig:244:warning: ignoring unsupported character '-'
>>>> init/Kconfig:244:warning: ignoring unsupported character '-'
>>>> [...]
>>>>
>>>> So we would need to add special treatment for '-' also in the command
>>>> case, right? But that doesn't look appealing to me, more like a dirty,
>>>> dirty hack around the actual problem...
>>>>
>>>> Regards,
>>>>
>>>> Andreas
>>>>
>>>
>>> Except for scattered accidents like in the original message, which are
>>> hopefully pretty rare and easy to fix, the only documented thing that depends
>>> on that lexer sloppiness is the ---help--- "token".
>>>
>>> I'd just add "---help---" as another T_HELP alias (or get rid of it altogether,
>>> but that's probably more work than it's worth). Tightening things up should be
>>> safe after that.
>>
>> This idea has a big ACK from me.  It seems to me the cleanest way to
>> solve the issue.
>>
>
> Agreed! I also wanted to suggest this solution, but Ulf was faster :)
>
> Kind Regards,
> Stefan

However, thinking about this solution a little more....
This change might lead to parser conflicts....shift-reduce conflicts maybe.

Is the '-' used somewhere else and has a distinct token or is it just
ignored and thrown away?


Kind Regards,
Stefan
