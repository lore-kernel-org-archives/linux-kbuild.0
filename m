Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:33410 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119AbbATMvR convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Tue, 20 Jan 2015 07:51:17 -0500
Message-Id: <54BE5D52020000780005705C@mail.emea.novell.com>
Date: Tue, 20 Jan 2015 12:51:14 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 0/3] kconfig: enhance parsing and operator
 recognition
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, pebolle@tiscali.nl

There being at least one case (DEBUG_UART_8250_WORD in
arch/arm/Kconfig.debug) where the utility silently behaves other than
what the programmer expects tells us that (a) we shouldn't silently
ignore unrecognized characters and (b) it's not just me always having
wanted to be able to use comparisons other than (in)equality ones.

1: trivial: sound/soc/intel/Kconfig: use single backslash for line continuation
2: kconfig: don't silently ignore unhandled characters
3: kconfig: allow use of relations other than (in)equality

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Split off sound/soc/intel/Kconfig change from patch 1 (now 2).
v2: printf() -> fprintf(stderr, ) upon Paul Bolle's request. Replace
    two instances of double backslash line continuations with single
    ones in sound/soc/intel/Kconfig. Drop stray debugging printf()s
    from patch 2.


