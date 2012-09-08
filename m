Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:44709 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754320Ab2IHMAY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Sep 2012 08:00:24 -0400
From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [kbuild bug] /bin/sh: -c: line 0: syntax error near unexpected token `;'
References: <20120908014208.GA19345@localhost>
Date: Sat, 08 Sep 2012 14:00:13 +0200
In-Reply-To: <20120908014208.GA19345@localhost> (Fengguang Wu's message of
	"Sat, 8 Sep 2012 09:42:08 +0800")
Message-ID: <m2bohgybaq.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> /usr/bin/make -f /c/kernel-tests/src/next/scripts/Makefile.modbuiltin obj=arch/ia64/kvm

The problem is that Makefile.modbuiltin is executed before
Makefile.build has been executed in arch/ia64/kvm, and the rule in
arch/ia64/kvm/Makefile uses cmd_cc_s_c which is only defined in
Makefile.build.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
