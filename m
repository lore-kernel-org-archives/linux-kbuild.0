Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:56614 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750799AbbGEJYd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jul 2015 05:24:33 -0400
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH 0/2] kconfig: allow use of relations other than (in)equality
Date: Sat, 04 Jul 2015 17:47:23 +0200
Message-ID: <3429435.blxdgi52Pe@tacticalops>
In-Reply-To: <559599C2.6090505@suse.cz>
References: <557EDA310200007800084C43@mail.emea.novell.com> <6743206.QpmKW5snMP@tacticalops> <559599C2.6090505@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jan Beulich <JBeulich@suse.com>, pebolle@tiscali.nl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 02 July 2015 22:06:26 Michal Marek wrote:
> The patch just adds four new binary operations of the same order as the
> existing == and !=, with a the semantics that everybody expects. And the
> grammar for kconfig expressions is so simplistic that you cannot even
> write things like (A && B) == (C && D). So turing completeness is not a
> topic here, neither before nor after this patch.

I am not trying to say that the patch results in Turing completeness. The
point of mentioning that the language is *not* Turing complete is that the
language is simple enough to encode the configuration with formal methods,
i.e. in particular with the means of propositional logic and SAT solving.
This is also done by the VAMOS project [1] and has uncovered hundreds of
bugs leading to more than 100 applied patches.

Encoding equality in propositional logic is viable, while the new relations
are predicates that are quite hard to capture in propositional logic. I do
not say that there is no way at all to get this done, but "less than" and
"greater than" are much more difficult in propositional logic than "equal to"
and "not equal to".

On Friday 03 July 2015 11:18:23 Paul Bolle wrote:
> Actually, since
> DEBUG_UART_8250_WORD already uses ">=", and that's now become legal,
> perhaps the downsides can already be demonstrated.

Thanks for the hint. That particular case is actually not that bad:
>	depends on DEBUG_UART_8250_SHIFT >= 2
The 2 is treated as the integer 2 (as long as there is no "config 2"
floating around somewhere). So it is a relation between a symbol of type int
and a constant integer. Getting this right in general in propositional
logic will require some work, but it is feasible: From a propositional point
of view, DEBUG_UART_8250_SHIFT >= 2 is either true or false, and if somewhere
else it says DEBUG_UART_8250_SHIFT <= 1 then the two propositions exclude
each other. Both are simple propositions that can be added to a formula and
their exclusiveness is easy to encode. No matter how many "less than" or
"greater than" relations there are with DEBUG_UART_8250_SHIFT and constant
integer values: is it not too hard to add implications accordingly.

However, if the relation is used with two (not constant) symbols of type int,
things become hard due to the transitivity. Imagine something like this

> ...
> depends on A >= B
> ...
> depends on B >= C
> ...
> depends on C > A
> ...
> depends on B = 1
> ...
> depends on C = 1
> ...

It is possible to define a propositional variable for each of these
propositions. But now if B = 1 and C = 1 hold true, then B >= C is also true
and A >= B may be true. But if A >= B is true, then C > A is not. If vice
versa A >= B is false then C > A must be true. (Of course still provided that
B = 1 and C = 1.) Next, there is the case that B = 1 is true and C = 1 is
false and the resulting implications and the same with B = 1 false and C = 1
true and with both of them false. And it probably needs even more constraints
to get the first three propositions consistent in general.

Yes, it is possible to get this right in propositional logic, but it is really
cumbersome and lots of new code will be necessary.

Regards,
Martin Walch

[1] https://www4.cs.fau.de/Research/VAMOS/
-- 

