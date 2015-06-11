Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45923 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752448AbbFKMoe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jun 2015 08:44:34 -0400
Message-ID: <557982B0.2070504@suse.cz>
Date: Thu, 11 Jun 2015 14:44:32 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/3] kconfig: allow use of relations other than (in)equality
References: <54BE5DD10200007800057065@mail.emea.novell.com>
In-Reply-To: <54BE5DD10200007800057065@mail.emea.novell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, pebolle@tiscali.nl

On 2015-01-20 13:53, Jan Beulich wrote:
> Over the years I found it desirable to be able to use all sorts of
> relations, not just (in)equality. And apparently I'm not the only one,
> as there's at least one example in the tree where the programmer
> assumed this would work (see DEBUG_UART_8250_WORD in
> arch/arm/Kconfig.debug). Another possible use would e.g. be to fold the
> two SMP/NR_CPUS prompts into one: SMP could be promptless, simply
> depending on NR_CPUS > 1.
> 
> A (desirable) side effect of this change - resulting from numeric
> values now necessarily being compared as numbers rather than as
> strings - is that comparing hex values now works as expected: Other
> than int ones (which aren't allowed to have leading zeroes), zeroes
> following the 0x prefix made them compare unequal even if their values
> were equal.
> 
> Question: Should "<>" and/or "==" then perhaps also be permitted?
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Drop stray debugging printf()s.
> ---
>  scripts/kconfig/expr.c              |  167 ++++++++++-
>  scripts/kconfig/expr.h              |    4 
>  scripts/kconfig/symbol.c            |    4 
>  scripts/kconfig/zconf.l             |    4 
>  scripts/kconfig/zconf.lex.c_shipped |  291 +++++++++++--------
>  scripts/kconfig/zconf.tab.c_shipped |  524 +++++++++++++++++++-----------------
>  scripts/kconfig/zconf.y             |    9 

Again, sorry for the extremely late reply.

Please submit the update of the _shipped files as a another patch,
referencing this one. Having ~800 generated edits among original changes
makes the whole patch hard to read, both for me and for anyone browsing
the git history in the future.

Michal
