Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.outflux.net ([198.145.64.163]:33879 "EHLO smtp.outflux.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750905Ab3LQWq5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Dec 2013 17:46:57 -0500
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3] provide -fstack-protector-strong build option
Date: Tue, 17 Dec 2013 14:43:12 -0800
Message-Id: <1387320194-24185-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, James Hogan <james.hogan@imgtec.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Shawn Guo <shawn.guo@linaro.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, keescook@chromium.org

This reorganizes the build options for CONFIG_CC_STACKPROTECTOR so that
the new CONFIG_CC_STACKPROTECTOR_STRONG can be used when building with
a compiler that supports it.

-Kees

