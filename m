Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41263 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751784AbbEYIFY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 May 2015 04:05:24 -0400
Message-ID: <5562D7BC.3050604@suse.cz>
Date: Mon, 25 May 2015 16:05:16 +0800
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v4] Kconfig: Remove bad inference rules expr_eliminate_dups2()
References: <6333557.fobqH0bixi@tacticalops> <5729946.JOCDOEaf0S@tacticalops> <555D7D9C.7010701@suse.cz> <47745287.pcmKhRVW0u@tacticalops>
In-Reply-To: <47745287.pcmKhRVW0u@tacticalops>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: linux-kbuild@vger.kernel.org

Dne 22.5.2015 v 19:41 Martin Walch napsal(a):
> From: Martin Walch <walch.martin@web.de>
> 
> expr_eliminate_dups2() in scripts/kconfig/expr.c applies two invalid
> inference rules:
> 
> (FOO || BAR) && (!FOO && !BAR) -> n
> (FOO && BAR) || (!FOO || !BAR) -> y
> 
> They would be correct in propositional logic, but this is a three-valued
> logic, and here it is wrong in that it changes semantics. It becomes
> immediately visible when assigning the value 1 to both, FOO and BAR:
> 
> (FOO || BAR) && (!FOO && !BAR)
> -> min(max(1, 1), min(2-1, 2-1)) = min(1, 1) = 1
> 
> while n evaluates to 0 and
> 
> (FOO && BAR) || (!FOO || !BAR)
> -> max(min(1, 1), max(2-1, 2-1)) = max(1, 1) = 1
> 
> with y evaluating to 2.
> 
> Fix it by removing expr_eliminate_dups2() and the functions that have no
> use anywhere else: expr_extract_eq_and(), expr_extract_eq_or(),
> and expr_extract_eq() from scripts/kconfig/expr.c
> 
> Currently the bug is not triggered in mainline, so this patch does not
> modify the configuration space there. To observe the bug consider this
> example:
> 
> config MODULES
>         def_bool y
>         option modules
> 
> config FOO
>         def_tristate m
> 
> config BAR
>         def_tristate m
> 
> config TEST1
>         def_tristate y
>         depends on (FOO || BAR) && (!FOO && !BAR)
> 
> if TEST1 = n
> comment "TEST1 broken"
> endif
> 
> config TEST2
>         def_tristate y
>         depends on (FOO && BAR) || (!FOO || !BAR)
> 
> if TEST2 = y
> comment "TEST2 broken"
> endif
> 
> config TEST3
>         def_tristate y
>         depends on m && !m
> 
> if TEST3 = n
> comment "TEST3 broken"
> endif
> 
> TEST1, TEST2 and TEST3 should all evaluate to m, but without the patch,
> none of them does. It is probably not obvious that TEST3 is the same bug,
> but it becomes clear when considering what happens internally to the
> expression
> m && !m": 
> First it expands to
> (m && MODULES) && !(m && MODULES),
> then it is transformed into
> (m && MODULES) && (!m || !MODULES),
> and finally due to the bug it is replaced with n.
> 
> As a side effect, this patch reduces code size in expr.c by roughly 10%
> and slightly improves startup time for all configuration frontends.
> 
> Signed-off-by: Martin Walch <walch.martin@web.de>
> ---
> Version 3:
> Earlier versions fixed some comments, too. Remove those bits and focus
> on the logical problem.
> 
> Version 4:
> Add test case to commit description.

Thanks, applied now!

Michal
