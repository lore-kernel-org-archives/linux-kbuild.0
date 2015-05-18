Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43558 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752135AbbERHgL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 May 2015 03:36:11 -0400
Message-ID: <55599663.6080203@suse.cz>
Date: Mon, 18 May 2015 15:36:03 +0800
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3] Kconfig: Remove bad inference rules expr_eliminate_dups2()
References: <6333557.fobqH0bixi@tacticalops>
In-Reply-To: <6333557.fobqH0bixi@tacticalops>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org

Dne 17.5.2015 v 10:14 Martin Walch napsal(a):
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

Are you able to construct a testcase that triggers this bug? I haven't
been successful:


$ cat Kconfig.test
config MODULES
	def_bool y
	option modules

config FOO
	def_tristate m

config BAR
	def_tristate m

config TEST1
	def_tristate (FOO || BAR) && (!FOO && !BAR)

if TEST1 != m
comment "TEST1 broken"
endif

config TEST2
	def_tristate (FOO && BAR) || (!FOO || !BAR)

if TEST2 != m
comment "TEST2 broken"
endif
$ ./scripts/kconfig/conf Kconfig.test && cat .config
*
* Linux Kernel Configuration
*
#
# configuration written to .config
#
#
# Automatically generated file; DO NOT EDIT.
# Linux Kernel Configuration
#
CONFIG_MODULES=y
CONFIG_FOO=m
CONFIG_BAR=m
CONFIG_TEST1=m
CONFIG_TEST2=m


I'm all for eliminating unneeded code, but if it's meant to fix a bug as
well, I'd like to understand the bug.

thanks,
Michal
