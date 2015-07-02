Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:46676 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752343AbbGBJZh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 05:25:37 -0400
Message-ID: <1435829132.2423.10.camel@tiscali.nl>
Subject: Re: Kconfig: '+config' valid syntax?
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 02 Jul 2015 11:25:32 +0200
In-Reply-To: <1435827662.2423.4.camel@tiscali.nl>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
	 <1435827662.2423.4.camel@tiscali.nl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Ruprecht <andreas.ruprecht@fau.de>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On do, 2015-07-02 at 11:01 +0200, Paul Bolle wrote:
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
> 
> At the end of which we're back where we started before encountering
> the'+'. But there are more references to '.' in the lex rules so it's
> probably more complicated.

All of which is moot after commit 2e0d737fc76f ("kconfig: don't silently
ignore unhandled characters"). That's in linux-next but not (yet) in
v4.1+. It even has my Ack! My memory really must be degrading now...


Paul Bolle
