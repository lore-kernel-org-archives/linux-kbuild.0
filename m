Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.outflux.net ([198.145.64.163]:37333 "EHLO smtp.outflux.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755354Ab3LRSVK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Dec 2013 13:21:10 -0500
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v4] provide -fstack-protector-strong build option
Date: Wed, 18 Dec 2013 10:19:54 -0800
Message-Id: <1387390796-5860-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, James Hogan <james.hogan@imgtec.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Shawn Guo <shawn.guo@linaro.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, keescook@chromium.org

This reorganizes the build options for CONFIG_CC_STACKPROTECTOR so that
the new CONFIG_CC_STACKPROTECTOR_STRONG can be used when building with
a compiler that supports it.

Now with objdump analysis.

-Kees

