Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews05.kpnxchange.com ([213.75.39.8]:57605 "EHLO
	cpsmtpb-ews05.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756479AbbAPQSX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jan 2015 11:18:23 -0500
Message-ID: <1421425101.8562.25.camel@x220>
Subject: Re: [PATCH v2 2/2] kconfig: allow use of relations other than
 (in)equality
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 16 Jan 2015 17:18:21 +0100
In-Reply-To: <54B934AC.3070402@suse.cz>
References: <54B940060200007800055E87@mail.emea.novell.com>
	 <54B934AC.3070402@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jan Beulich <JBeulich@suse.com>, linux-kbuild@vger.kernel.org, akpm@linux-foundation.org

On Fri, 2015-01-16 at 16:56 +0100, Michal Marek wrote:
> On 2015-01-16 16:44, Jan Beulich wrote:
> > Over the years I found it desirable to be able to use all sorts of
> > relations, not just (in)equality. And apparently I'm not the only one,
> > as there's at least one example in the tree where the programmer
> > assumed this would work (see DEBUG_UART_8250_WORD in
> > arch/arm/Kconfig.debug). Another possibly use would e.g. be to fold the
> > two SMP/NR_CPUS prompt into one: SMP could be promptless, simply
> > depending on NR_CPUS > 1.
> 
> Nice.
> 
> 
> > A (desirable) side effect of this change - resulting from numeric
> > values now necessarily being compared as numbers rather than as
> > strings - is that comparing hex values now works as expected: Other
> > than int ones (which aren't allowed to have leading zeroes), zeroes
> > following the 0x prefix made them compare unequal even if their values
> > were equal.
> > 
> > Question: Should "<>" and/or "==" then perhaps also be permitted?
> 
> Maybe == for the similarity with C expressions, but certainly not <>.

There's a series in linux-next that disallows "boolean" (leaving only
"bool"). And now another alias will be introduced. Some people might
even get confused and think "=" is for assignment. Anyhow, I'm not in
favor of adding either alias. 

> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > v2: Drop stray debugging printf()s.
> > ---
> >  scripts/kconfig/expr.c              |  167 ++++++++++-
> >  scripts/kconfig/expr.h              |    4 
> >  scripts/kconfig/symbol.c            |    4 
> >  scripts/kconfig/zconf.l             |    4 
> >  scripts/kconfig/zconf.lex.c_shipped |  291 +++++++++++--------
> >  scripts/kconfig/zconf.tab.c_shipped |  524 +++++++++++++++++++-----------------
> 
> Can you please split it into two patches, first patching the human
> readable files and then the generated files?

Please add the tool, its version, and the command line you used in the
commit explanation. (Unless things like that end up in the generate
code, that is.) I hat it when I have to remember once again how this is
done.

The first time this series was sent I wondered a bit how to test it.
(Especially whether it could break current Kconfig files.) I didn't came
up with a definite answer. The code is tricky enough that code analysis
by itself might not catch everything. And I'm not (yet) brave enough to
review it.

Besides, should we perhaps add a few patches that actually _use_ the new
relations to see whether they work as designed?


Paul Bolle

