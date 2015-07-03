Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:33900 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754841AbbGCKwa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 06:52:30 -0400
MIME-Version: 1.0
In-Reply-To: <CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
 <1435827662.2423.4.camel@tiscali.nl> <55952723.80801@fau.de>
 <1435839005.2423.28.camel@tiscali.nl> <55963AD7.3040905@fau.de>
 <1435913987.2423.38.camel@tiscali.nl> <559655E3.6010400@fau.de> <CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
From: Valentin Rothberg <valentinrothberg@gmail.com>
Date: Fri, 3 Jul 2015 12:51:58 +0200
Message-ID: <CAD3Xx4LSYWfeeSyEnFNgOHera9wnt2ZxBrRutzMdw2tbaC1DNw@mail.gmail.com>
Subject: Re: Kconfig: '+config' valid syntax?
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Andreas Ruprecht <andreas.ruprecht@fau.de>, Paul Bolle <pebolle@tiscali.nl>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On Fri, Jul 3, 2015 at 12:46 PM, Ulf Magnusson <ulfalizer.lkml@gmail.com> wrote:
> On Fri, Jul 3, 2015 at 11:29 AM, Andreas Ruprecht
> <andreas.ruprecht@fau.de> wrote:
>> On 07/03/2015 10:59, Paul Bolle wrote:
>>> On vr, 2015-07-03 at 09:33 +0200, Andreas Ruprecht wrote:
>>>> I tested the behaviour on yesterday's linux-next, but the commit
>>>> mentioned above will only complain for invalid characters inside the
>>>> PARAM case and not for COMMANDs. So, as an example, if you write
>>>> something like
>>>>
>>>> config ACPI_REV_OVERRIDE_POSSIBLE
>>>>      depends on X86 +
>>>> [...]
>>>>
>>>> Kconfig will complain about the '+'. This, however, does not apply for
>>>> top-level statements like 'config', 'menuconfig', and so on.
>>>
>>> Which might explain why this silly mistake went unnoticed. (And, as I
>>> think you implied, it doesn't help that the empty rule we're hitting
>>> here is not commented.)
>>>
>>> So the naive solution seems to be to also add the warning to COMMAND's
>>> rule for '.'. A quick test suggest that would work. Am I missing some
>>> obvious downside with that solution?
>>
>> Well, as I mentioned earlier, with a patch similar to the one below this
>> warning is also generated three times for every '---' before 'help'.
>> This results in a giant pile of warnings:
>>
>> ruprecht@box:linux-next$ rm -f scripts/kconfig/*_shipped &&
>> REGENERATE_PARSERS=1 make allyesconfig 2>&1 | wc -l
>> 7419
>>
>> The output looks like this:
>> scripts/kconfig/conf  --allyesconfig Kconfig
>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>> arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
>> init/Kconfig:222:warning: ignoring unsupported character '-'
>> init/Kconfig:222:warning: ignoring unsupported character '-'
>> init/Kconfig:222:warning: ignoring unsupported character '-'
>> init/Kconfig:244:warning: ignoring unsupported character '-'
>> init/Kconfig:244:warning: ignoring unsupported character '-'
>> init/Kconfig:244:warning: ignoring unsupported character '-'
>> [...]
>>
>> So we would need to add special treatment for '-' also in the command
>> case, right? But that doesn't look appealing to me, more like a dirty,
>> dirty hack around the actual problem...
>>
>> Regards,
>>
>> Andreas
>>
>
> Except for scattered accidents like in the original message, which are
> hopefully pretty rare and easy to fix, the only documented thing that depends
> on that lexer sloppiness is the ---help--- "token".
>
> I'd just add "---help---" as another T_HELP alias (or get rid of it altogether,
> but that's probably more work than it's worth). Tightening things up should be
> safe after that.

This idea has a big ACK from me.  It seems to me the cleanest way to
solve the issue.

Kind regards,
 Valentin

> /Ulf
