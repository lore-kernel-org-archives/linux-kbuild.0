Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:52911 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751409AbbGBJBL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 05:01:11 -0400
Message-ID: <1435827662.2423.4.camel@tiscali.nl>
Subject: Re: Kconfig: '+config' valid syntax?
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 02 Jul 2015 11:01:02 +0200
In-Reply-To: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Ruprecht <andreas.ruprecht@fau.de>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

[Dropped Yann. You already know Yann disappeared.]

On Thu, 2015-07-02 at 10:08 +0200, Valentin Rothberg wrote:
> commit ed013214afa7 ("ACPI / init: Make it possible to override _REV")
> is in today's linux-next tree (i.e., next-20150702) adding the
> following hunk to drivers/acpi/Kconfig:
> 
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -428,6 +428,26 @@ config XPOWER_PMIC_OPREGION
>         help
>           This config adds ACPI operation region support for XPower 
> AXP288 PMIC.
> 
> ++config ACPI_REV_OVERRIDE_POSSIBLE

(Odd. Botched conflict resolution?)

> +       bool "Allow supported ACPI revision to be overriden"
> +       depends on X86
> +       default y
> [...]
> 
> By having a close look at the first added line, we can see that
> '+config ACPI_...' is added.  To my great surprise, it's valid Kconfig
> syntax.

I played a bit with this. It seems you can basically add a '+' anywhere
you like and kconfig will just ignore it.

> How is that possible?  IMHO it's an invalid token, such that
> Kconfig should complain about it.  Or do I miss something?

Welcome to the wonders of lex and yacc!

I try to spend as little time as possible looking at the lex rules, so
I'm just guessing here. Anyhow, you might start by looking at this
snippet in zconf.l:
    .       {
            unput(yytext[0]);
            BEGIN(COMMAND);
    }


    <COMMAND>{
            {n}+    {
                    [...]
            }
            .
            \n      {
                    BEGIN(INITIAL);
                    current_file->lineno++;
                    return T_EOL;
            }
    }

Which perhaps translates to:
- ignore unknown stuff for now and go in COMMAND state;
- do something if we encounter some text ({n} = [A-Za-z0-9_]);
- go in INITIAL state if we encounter newlines or unknown stuff.

At the end of which we're back where we started before encountering
the'+'. But there are more references to '.' in the lex rules so it's
probably more complicated.

Hope this helps,


Paul Bolle
