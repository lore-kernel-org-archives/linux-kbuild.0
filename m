Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews09.kpnxchange.com ([213.75.39.14]:60229 "EHLO
	cpsmtpb-ews09.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753985AbbCLMe0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 08:34:26 -0400
Message-ID: <1426163664.5304.49.camel@x220>
Subject: Re: [PATCH v3 0/3] kconfig: enhance parsing and operator recognition
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 12 Mar 2015 13:34:24 +0100
In-Reply-To: <54BE5D52020000780005705C@mail.emea.novell.com>
References: <54BE5D52020000780005705C@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>

On Tue, 2015-01-20 at 12:51 +0000, Jan Beulich wrote:
> There being at least one case (DEBUG_UART_8250_WORD in
> arch/arm/Kconfig.debug) where the utility silently behaves other than
> what the programmer expects tells us that (a) we shouldn't silently
> ignore unrecognized characters and (b) it's not just me always having
> wanted to be able to use comparisons other than (in)equality ones.
> 
> 1: trivial: sound/soc/intel/Kconfig: use single backslash for line continuation

This turned out to be already fixed by commit 34084a436703 ("ASoC:
intel: Remove superfluous backslash in Kconfig"), which was added in
v4.0-rc1.

> 2: kconfig: don't silently ignore unhandled characters
> 3: kconfig: allow use of relations other than (in)equality
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

What's the status on 2: and 3:? Is everyone waiting on someone else to
do something? (One thing I remember is that Michal wanted the changes to
the _shipped files separately. Is that correct?)

For my part I still think 2: should go in.

And for 3: I would like to see related changes to Kconfig files
submitted too. But, of course, whether that is actually needed is mostly
Michal's call.

> v3: Split off sound/soc/intel/Kconfig change from patch 1 (now 2).
> v2: printf() -> fprintf(stderr, ) upon Paul Bolle's request. Replace
>     two instances of double backslash line continuations with single
>     ones in sound/soc/intel/Kconfig. Drop stray debugging printf()s
>     from patch 2.


Paul Bolle

