Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44360 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751682AbbAPP4b (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jan 2015 10:56:31 -0500
Message-ID: <54B934AC.3070402@suse.cz>
Date: Fri, 16 Jan 2015 16:56:28 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] kconfig: allow use of relations other than (in)equality
References: <54B940060200007800055E87@mail.emea.novell.com>
In-Reply-To: <54B940060200007800055E87@mail.emea.novell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>, linux-kbuild@vger.kernel.org
Cc: akpm@linux-foundation.org, pebolle@tiscali.nl

On 2015-01-16 16:44, Jan Beulich wrote:
> Over the years I found it desirable to be able to use all sorts of
> relations, not just (in)equality. And apparently I'm not the only one,
> as there's at least one example in the tree where the programmer
> assumed this would work (see DEBUG_UART_8250_WORD in
> arch/arm/Kconfig.debug). Another possibly use would e.g. be to fold the
> two SMP/NR_CPUS prompt into one: SMP could be promptless, simply
> depending on NR_CPUS > 1.

Nice.


> A (desirable) side effect of this change - resulting from numeric
> values now necessarily being compared as numbers rather than as
> strings - is that comparing hex values now works as expected: Other
> than int ones (which aren't allowed to have leading zeroes), zeroes
> following the 0x prefix made them compare unequal even if their values
> were equal.
> 
> Question: Should "<>" and/or "==" then perhaps also be permitted?

Maybe == for the similarity with C expressions, but certainly not <>.


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

Can you please split it into two patches, first patching the human
readable files and then the generated files?

Thanks,
Michal
