Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35414 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754781AbbGCMjP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 08:39:15 -0400
MIME-Version: 1.0
In-Reply-To: <CAEMqcmr-BR8NbJCMXjy956B3iW82Sem4Gz46RDJxYT2nsjMReA@mail.gmail.com>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
	<1435827662.2423.4.camel@tiscali.nl>
	<55952723.80801@fau.de>
	<1435839005.2423.28.camel@tiscali.nl>
	<55963AD7.3040905@fau.de>
	<1435913987.2423.38.camel@tiscali.nl>
	<559655E3.6010400@fau.de>
	<CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
	<5596731F.20309@fau.de>
	<CAEMqcmr-BR8NbJCMXjy956B3iW82Sem4Gz46RDJxYT2nsjMReA@mail.gmail.com>
Date: Fri, 3 Jul 2015 14:39:14 +0200
Message-ID: <CAEMqcmrQ36qOFELskY8SkQV3uadHDq8yivpwsAyo6Kgz0UbLTg@mail.gmail.com>
Subject: Re: Kconfig: '+config' valid syntax?
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On Fri, Jul 3, 2015 at 1:40 PM, Ulf Magnusson <ulfalizer.lkml@gmail.com> wrote:
> On Fri, Jul 3, 2015 at 1:33 PM, Andreas Ruprecht
> <andreas.ruprecht@fau.de> wrote:
>> On 07/03/2015 12:46, Ulf Magnusson wrote:
>>>
>>> Except for scattered accidents like in the original message, which are
>>> hopefully pretty rare and easy to fix, the only documented thing that depends
>>> on that lexer sloppiness is the ---help--- "token".
>>>
>>> I'd just add "---help---" as another T_HELP alias (or get rid of it altogether,
>>> but that's probably more work than it's worth). Tightening things up should be
>>> safe after that.
>>>
>>> /Ulf
>>>
>>
>> So we might want to do something like the attached patch, right?
>>
>> Unfortunately, when I generate the zconf.{hash,lex,tab}.c files on my
>> machine, they have some notable differences to the _shipped versions:
>>
>> ruprecht@box:linux-next$ diff -u zconf.tab.c zconf.tab.c_shipped
>> -  return yyresult;
>> +  /* Make sure YYID is used.  */
>> +  return YYID (yyresult);
>>
>> and I can't find any Documentation on how to properly rebuild the
>> _shipped files... Does anybody have a hint on that?
>>
>> Regards,
>>
>> Andreas
>
> Yup, something like that. Been too long, so I don't remember either,
> though I don't remember having to do anything special.
>
> I'm heading off to bed soon, so probably shouldn't be thinking. Could
> take a look tomorrow if there's still a problem. :)
>
> /Ulf

Or add '---help---' to zconf.gperf I guess, to avoid special-casing it. Would
need to add '-' to the

n    [A-Za-z0-9_]

definition in zconf.l in that case too.

That should be safe provided the gperf part works out, since zconf.y should
verify that the T_WORD has the expected form. (As a side note, the first token
on a line is always a keyword, except for within help texts, which are handled
specially.)

I guess that might change the meaning of lines like "foo-bar" if '-' is
introduced as an operator, but that seems kinda academic as 'foo' would
probably still be a keyword. It's already broken due to the <PARAM> regex
({n}|[-/.])+ having '-' in it too.

/Ulf
