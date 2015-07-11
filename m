Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:35845 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750851AbbGKP4r (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Jul 2015 11:56:47 -0400
Date: Sat, 11 Jul 2015 17:56:37 +0200
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: [PATCH v3 0/2] kconfig: warn of unhandled characters in Kconfig
 commands
Message-ID: <20150711155637.GA25144@huvuddator>
References: <cover.1436516211.git.andreas.ruprecht@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1436516211.git.andreas.ruprecht@fau.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

On Fri, Jul 10, 2015 at 10:25:31AM +0200, Andreas Ruprecht wrote:
> This patchset changes the lexer file to emit a warning if any unhandled
> characters are found in the input. So far, Kconfig options like
> 
>  +config FOO
>     bool
>     [...]
> 
> (note the wrong '+'!) were parsed without a warning. As simply adding a
> warning for '.' produces lots of warnings as occasionally '---help---'
> is used instead of 'help' (and thus '-' is recognized as an unhandled
> character), we need to handle '---help---' separately.
> 
> Changes to v1:
> 	- add '---help---' in zconf.gperf instead of special casing
> 	  it in zconf.l
> 
> Changes to v2:
> 	- Do no constify char parameter to warn_ignored_character
> 	- Shorten rule definitions for '.'
> 
> Andreas Ruprecht (2):
>   kconfig: warn of unhandled characters in Kconfig commands
>   kconfig: Regenerate shipped zconf.{hash,lex}.c files
> 
>  scripts/kconfig/zconf.gperf          |   1 +
>  scripts/kconfig/zconf.hash.c_shipped |  58 ++++---
>  scripts/kconfig/zconf.l              |  20 ++-
>  scripts/kconfig/zconf.lex.c_shipped  | 325 +++++++++++++++++------------------
>  4 files changed, 204 insertions(+), 200 deletions(-)
> 
> -- 
> 1.9.1
> 

Looks good to me.

I ran the Kconfiglib test suite on it too. Since it simply compares the
output of Kconfiglib and the C implementation, it doubles as a good
regression test for the C implementation.

Cheers,
Ulf
