Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35870 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755093AbbGCLkc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 07:40:32 -0400
MIME-Version: 1.0
In-Reply-To: <5596731F.20309@fau.de>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
	<1435827662.2423.4.camel@tiscali.nl>
	<55952723.80801@fau.de>
	<1435839005.2423.28.camel@tiscali.nl>
	<55963AD7.3040905@fau.de>
	<1435913987.2423.38.camel@tiscali.nl>
	<559655E3.6010400@fau.de>
	<CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
	<5596731F.20309@fau.de>
Date: Fri, 3 Jul 2015 13:40:31 +0200
Message-ID: <CAEMqcmr-BR8NbJCMXjy956B3iW82Sem4Gz46RDJxYT2nsjMReA@mail.gmail.com>
Subject: Re: Kconfig: '+config' valid syntax?
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On Fri, Jul 3, 2015 at 1:33 PM, Andreas Ruprecht
<andreas.ruprecht@fau.de> wrote:
> On 07/03/2015 12:46, Ulf Magnusson wrote:
>>
>> Except for scattered accidents like in the original message, which are
>> hopefully pretty rare and easy to fix, the only documented thing that depends
>> on that lexer sloppiness is the ---help--- "token".
>>
>> I'd just add "---help---" as another T_HELP alias (or get rid of it altogether,
>> but that's probably more work than it's worth). Tightening things up should be
>> safe after that.
>>
>> /Ulf
>>
>
> So we might want to do something like the attached patch, right?
>
> Unfortunately, when I generate the zconf.{hash,lex,tab}.c files on my
> machine, they have some notable differences to the _shipped versions:
>
> ruprecht@box:linux-next$ diff -u zconf.tab.c zconf.tab.c_shipped
> -  return yyresult;
> +  /* Make sure YYID is used.  */
> +  return YYID (yyresult);
>
> and I can't find any Documentation on how to properly rebuild the
> _shipped files... Does anybody have a hint on that?
>
> Regards,
>
> Andreas

Yup, something like that. Been too long, so I don't remember either,
though I don't remember having to do anything special.

I'm heading off to bed soon, so probably shouldn't be thinking. Could
take a look tomorrow if there's still a problem. :)

/Ulf
