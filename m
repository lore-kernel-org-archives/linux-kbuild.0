Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42137 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964815AbcKDSju (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 14:39:50 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/3] kbuild: add -fno-PIE
Date: Fri,  4 Nov 2016 19:39:38 +0100
Message-Id: <20161104183940.30692-2-bigeasy@linutronix.de>
In-Reply-To: <20161104183940.30692-1-bigeasy@linutronix.de>
References: <20161104183940.30692-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>

Debian started to build the gcc with -fPIE by default so the kernel
build ends before it starts properly with:
|kernel/bounds.c:1:0: error: code model kernel does not support PIC mode

Also add to KBUILD_AFLAGS due to:

|gcc -Wp,-MD,arch/x86/entry/vdso/vdso32/.note.o.d … -mfentry -DCC_USING_FENTRY … vdso/vdso32/note.S
|arch/x86/entry/vdso/vdso32/note.S:1:0: sorry, unimplemented: -mfentry isn’t supported for 32-bit in combination with -fpic

Tagging it stable so it is possible to compile recent stable kernels as
well.

Cc: stable@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index a2650f9c6a25..d61145ebf498 100644
--- a/Makefile
+++ b/Makefile
@@ -622,6 +622,8 @@ include arch/$(SRCARCH)/Makefile
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
+KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
+KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
 
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
 KBUILD_CFLAGS	+= $(call cc-option,-ffunction-sections,)
-- 
2.10.2

