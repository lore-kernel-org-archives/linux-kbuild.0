Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f196.google.com ([209.85.217.196]:35667 "EHLO
	mail-lb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755387AbbGTIyY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jul 2015 04:54:24 -0400
Date: Mon, 20 Jul 2015 10:54:15 +0200
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: [PATCH v4 0/2] kconfig: warn of unhandled characters in Kconfig
 commands
Message-ID: <20150720085414.GA32583@huvuddator>
References: <cover.1436686646.git.andreas.ruprecht@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1436686646.git.andreas.ruprecht@fau.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

On Sun, Jul 12, 2015 at 09:41:49AM +0200, Andreas Ruprecht wrote:
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
> Changes to v3:
> 	- spaces -> tabs in zconf.gperf
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

For what it's worth:

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
Tested-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
