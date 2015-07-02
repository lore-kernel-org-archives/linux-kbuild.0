Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:43943 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753207AbbGBMKK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 08:10:10 -0400
Message-ID: <1435839005.2423.28.camel@tiscali.nl>
Subject: Re: Kconfig: '+config' valid syntax?
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 02 Jul 2015 14:10:05 +0200
In-Reply-To: <55952723.80801@fau.de>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
	 <1435827662.2423.4.camel@tiscali.nl> <55952723.80801@fau.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>, Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

[Spoiler: please start at the end of my reply.]

On do, 2015-07-02 at 13:57 +0200, Andreas Ruprecht wrote:
> On 07/02/2015 11:01, Paul Bolle wrote:
> > On Thu, 2015-07-02 at 10:08 +0200, Valentin Rothberg wrote:
> > Welcome to the wonders of lex and yacc!
> > 
> > I try to spend as little time as possible looking at the lex rules, 
> > so
> > I'm just guessing here. Anyhow, you might start by looking at this
> > snippet in zconf.l:
> >     .       {
> >             unput(yytext[0]);
> >             BEGIN(COMMAND);
> >     }
> > 
> > 
> >     <COMMAND>{
> >             {n}+    {
> >                     [...]
> >             }
> >             .
> >             \n      {
> >                     BEGIN(INITIAL);
> >                     current_file->lineno++;
> >                     return T_EOL;
> >             }
> >     }
> > 
> > Which perhaps translates to:
> > - ignore unknown stuff for now and go in COMMAND state;
> > - do something if we encounter some text ({n} = [A-Za-z0-9_]);
> > - go in INITIAL state if we encounter newlines or unknown stuff.
> 
> This is _almost_ true (which I think is the problem). The rule for "."
> is empty, and not the same rule as for \n.

I see. That's nice to know.

>  So what happens here, is that
> any unknown characters are simply ignored until something in {n}+ 
> shows up.

How can unknown characters be part of {n}+?

> If I add something like the following instead:
> +	. {
> +		fprintf(stderr, "something else: %s\n", yytext);
> +		BEGIN(INITIAL);
> +	}
> 
> then Kconfig prints the message for the "+", but unfortunately also 
> lots
> of "-" (which come from the occasional "---help---" instead of "help".
> As it looks to me, they are only ignored one step later inside the
> <PARAM> case.

(Years ago I submitted a few trivial cleanups for typos regarding "--
-help---". I should have followed up on those cleanups with a patch to
remove the silly lex rule that just ignores "---".

Perhaps we should add an actual definition for "---help---". On the
other hand: last time I checked nothing actually cares about the "---"
markers so adding them achieves nothing. Cleaning all Kconfig files to
get rid of these markers is probably not worth it. Add a checkpatch rule
to warn about their uselessness?)

> So changing it like the above is not the solution, but at least we 
> know
> where the silent ignore is coming from...
> 
> Any idea how to properly fix this?

As I said in my follow up: see commit 2e0d737fc76f ("kconfig: don't
silently ignore unhandled characters").

Thanks,


Paul Bolle
