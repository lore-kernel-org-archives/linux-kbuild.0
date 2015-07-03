Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20]:51473 "EHLO
	mx-rz-1.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932072AbbGCHdr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 03:33:47 -0400
Message-ID: <55963AD7.3040905@fau.de>
Date: Fri, 03 Jul 2015 09:33:43 +0200
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
MIME-Version: 1.0
Subject: Re: Kconfig: '+config' valid syntax?
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>	 <1435827662.2423.4.camel@tiscali.nl> <55952723.80801@fau.de> <1435839005.2423.28.camel@tiscali.nl>
In-Reply-To: <1435839005.2423.28.camel@tiscali.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On 07/02/2015 14:10, Paul Bolle wrote:
> [Spoiler: please start at the end of my reply.]
> 
> On do, 2015-07-02 at 13:57 +0200, Andreas Ruprecht wrote:
>> On 07/02/2015 11:01, Paul Bolle wrote:
>>> On Thu, 2015-07-02 at 10:08 +0200, Valentin Rothberg wrote:
>>> Welcome to the wonders of lex and yacc!
>>>
>>> I try to spend as little time as possible looking at the lex rules, 
>>> so
>>> I'm just guessing here. Anyhow, you might start by looking at this
>>> snippet in zconf.l:
>>>     .       {
>>>             unput(yytext[0]);
>>>             BEGIN(COMMAND);
>>>     }
>>>
>>>
>>>     <COMMAND>{
>>>             {n}+    {
>>>                     [...]
>>>             }
>>>             .
>>>             \n      {
>>>                     BEGIN(INITIAL);
>>>                     current_file->lineno++;
>>>                     return T_EOL;
>>>             }
>>>     }
>>>
>>> Which perhaps translates to:
>>> - ignore unknown stuff for now and go in COMMAND state;
>>> - do something if we encounter some text ({n} = [A-Za-z0-9_]);
>>> - go in INITIAL state if we encounter newlines or unknown stuff.
>>
>> This is _almost_ true (which I think is the problem). The rule for "."
>> is empty, and not the same rule as for \n.
> 
> I see. That's nice to know.
> 
>>  So what happens here, is that
>> any unknown characters are simply ignored until something in {n}+ 
>> shows up.
> 
> How can unknown characters be part of {n}+?
> 

They are not considered part of {n}+, but through ignoring the '+'
character with the empty '.' rule, the parser will go back into the
top-level rule - the very first rule in your snippet above - see the 'c'
character (from 'config'), go into COMMAND again and parse the 'config'
item properly.

> 
> As I said in my follow up: see commit 2e0d737fc76f ("kconfig: don't
> silently ignore unhandled characters").

I tested the behaviour on yesterday's linux-next, but the commit
mentioned above will only complain for invalid characters inside the
PARAM case and not for COMMANDs. So, as an example, if you write
something like

config ACPI_REV_OVERRIDE_POSSIBLE
	depends on X86 +
[...]

Kconfig will complain about the '+'. This, however, does not apply for
top-level statements like 'config', 'menuconfig', and so on.

Regards,

Andreas

