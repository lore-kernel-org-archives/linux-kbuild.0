Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33963 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932133AbbGCLeT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 07:34:19 -0400
MIME-Version: 1.0
In-Reply-To: <CABv5NL_xyB2U6khOudBok_v_H0cw1E7m7uJ0iSPVn0DYW-w9Pg@mail.gmail.com>
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
	<CABv5NL_xyB2U6khOudBok_v_H0cw1E7m7uJ0iSPVn0DYW-w9Pg@mail.gmail.com>
Date: Fri, 3 Jul 2015 13:34:18 +0200
Message-ID: <CAEMqcmpxZOOwTWQzFf0zhVdutXt5ESuEGj5cp8BMxS-cE2MHow@mail.gmail.com>
Subject: Re: Kconfig: '+config' valid syntax?
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Hengelein <stefan.hengelein@fau.de>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <andreas.ruprecht@fau.de>, Paul Bolle <pebolle@tiscali.nl>, rafael.j.wysocki@intel.com, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@dominikbrodowski.net

On Fri, Jul 3, 2015 at 1:11 PM, Stefan Hengelein
<stefan.hengelein@fau.de> wrote:
> 2015-07-03 12:56 GMT+02:00 Stefan Hengelein <stefan.hengelein@fau.de>:
>> 2015-07-03 12:51 GMT+02:00 Valentin Rothberg <valentinrothberg@gmail.com>:
>>>>>
>>>>> The output looks like this:
>>>>> scripts/kconfig/conf  --allyesconfig Kconfig
>>>>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>>>>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>>>>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>>>>> init/Kconfig:222:warning: ignoring unsupported character '-'
>>>>> init/Kconfig:222:warning: ignoring unsupported character '-'
>>>>> init/Kconfig:222:warning: ignoring unsupported character '-'
>>>>> init/Kconfig:244:warning: ignoring unsupported character '-'
>>>>> init/Kconfig:244:warning: ignoring unsupported character '-'
>>>>> init/Kconfig:244:warning: ignoring unsupported character '-'
>>>>> [...]
>>>>>
>>>>> So we would need to add special treatment for '-' also in the command
>>>>> case, right? But that doesn't look appealing to me, more like a dirty,
>>>>> dirty hack around the actual problem...
>>>>>
>>>>> Regards,
>>>>>
>>>>> Andreas
>>>>>
>>>>
>>>> Except for scattered accidents like in the original message, which are
>>>> hopefully pretty rare and easy to fix, the only documented thing that depends
>>>> on that lexer sloppiness is the ---help--- "token".
>>>>
>>>> I'd just add "---help---" as another T_HELP alias (or get rid of it altogether,
>>>> but that's probably more work than it's worth). Tightening things up should be
>>>> safe after that.
>>>
>>> This idea has a big ACK from me.  It seems to me the cleanest way to
>>> solve the issue.
>>>
>>
>> Agreed! I also wanted to suggest this solution, but Ulf was faster :)
>>
>> Kind Regards,
>> Stefan
>
> However, thinking about this solution a little more....
> This change might lead to parser conflicts....shift-reduce conflicts maybe.
>
> Is the '-' used somewhere else and has a distinct token or is it just
> ignored and thrown away?
>

Yeah, I considered that too. Been a few years since I really dug into
zconf.{l,y,gperf} and zconf.y, but from a quick look I think it might work out.
With things tightened up, '-' should only ever appear as part of identifiers
and inside strings and comments. There's no T_MINUS or similar.

/Ulf
