Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20]:49094 "EHLO
	mx-rz-1.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753735AbbGBMEP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 08:04:15 -0400
Message-ID: <55952723.80801@fau.de>
Date: Thu, 02 Jul 2015 13:57:23 +0200
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
MIME-Version: 1.0
Subject: Re: Kconfig: '+config' valid syntax?
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com> <1435827662.2423.4.camel@tiscali.nl>
In-Reply-To: <1435827662.2423.4.camel@tiscali.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

Hi,

On 07/02/2015 11:01, Paul Bolle wrote:
> [Dropped Yann. You already know Yann disappeared.]
> 
> On Thu, 2015-07-02 at 10:08 +0200, Valentin Rothberg wrote:
>> commit ed013214afa7 ("ACPI / init: Make it possible to override _REV")
>> is in today's linux-next tree (i.e., next-20150702) adding the
>> following hunk to drivers/acpi/Kconfig:
>>
>> --- a/drivers/acpi/Kconfig
>> +++ b/drivers/acpi/Kconfig
>> @@ -428,6 +428,26 @@ config XPOWER_PMIC_OPREGION
>>         help
>>           This config adds ACPI operation region support for XPower 
>> AXP288 PMIC.
>>
>> ++config ACPI_REV_OVERRIDE_POSSIBLE
> 
> (Odd. Botched conflict resolution?)
> 
>> +       bool "Allow supported ACPI revision to be overriden"
>> +       depends on X86
>> +       default y
>> [...]
>>
>> By having a close look at the first added line, we can see that
>> '+config ACPI_...' is added.  To my great surprise, it's valid Kconfig
>> syntax.
> 
> I played a bit with this. It seems you can basically add a '+' anywhere
> you like and kconfig will just ignore it.
> 
>> How is that possible?  IMHO it's an invalid token, such that
>> Kconfig should complain about it.  Or do I miss something?
> 
> Welcome to the wonders of lex and yacc!
> 
> I try to spend as little time as possible looking at the lex rules, so
> I'm just guessing here. Anyhow, you might start by looking at this
> snippet in zconf.l:
>     .       {
>             unput(yytext[0]);
>             BEGIN(COMMAND);
>     }
> 
> 
>     <COMMAND>{
>             {n}+    {
>                     [...]
>             }
>             .
>             \n      {
>                     BEGIN(INITIAL);
>                     current_file->lineno++;
>                     return T_EOL;
>             }
>     }
> 
> Which perhaps translates to:
> - ignore unknown stuff for now and go in COMMAND state;
> - do something if we encounter some text ({n} = [A-Za-z0-9_]);
> - go in INITIAL state if we encounter newlines or unknown stuff.

This is _almost_ true (which I think is the problem). The rule for "."
is empty, and not the same rule as for \n. So what happens here, is that
any unknown characters are simply ignored until something in {n}+ shows up.

If I add something like the following instead:
+	. {
+		fprintf(stderr, "something else: %s\n", yytext);
+		BEGIN(INITIAL);
+	}

then Kconfig prints the message for the "+", but unfortunately also lots
of "-" (which come from the occasional "---help---" instead of "help".
As it looks to me, they are only ignored one step later inside the
<PARAM> case.

So changing it like the above is not the solution, but at least we know
where the silent ignore is coming from...

Any idea how to properly fix this?

Regards,

Andreas

