Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fallback-out1.mxes.net ([216.86.168.180]:55018 "EHLO
	fallback-in1.mxes.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750862AbZKCKRG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2009 05:17:06 -0500
Received: from mxout-08.mxes.net (mxout-08.mxes.net [216.86.168.183])
	by fallback-in1.mxes.net (Postfix) with ESMTP id 0B4C5864F9
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2009 05:07:40 -0500 (EST)
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Subject: [PATCH 01/10] ARM: use unified discard definition in linker script
Date: Tue,  3 Nov 2009 10:06:13 +0000
Message-Id: <1257242782-10496-2-git-send-email-alan-jenkins@tuffmail.co.uk>
In-Reply-To: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au, Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Commit 023bf6f "linker script: unify usage of discard definition"
changed the linker scripts for all architectures except for ARM.
I can find no discussion about this ommision, so here are the changes
for ARM.

These changes are exactly parallel to the ia64 case.

"ia64 is notable because it first throws away some ia64 specific
 subsections and then include the rest of the sections into the final
 image, so those sections must be discarded before the inclusion."

Not boot-tested.  In build testing, the modified linker script generated
an identical vmlinux file.

[I would like to be able to rely on this unified discard definition.
 I want to sort the kernel symbol tables to allow faster symbol
 resolution during module loading. The simplest way appears to be
 to generate sorted versions from vmlinux.o, link them in to vmlinux,
 _and discard the original unsorted tables_.

 This work is driven by my x86 netbook, but it is implemented at a
 generic level. It is possible it will benefit some ARM systems also.]

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
Acked-by-without-testing: Tejun Heo <tj@kernel.org>
---
 arch/arm/kernel/vmlinux.lds.S |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index aecf87d..ec511d4 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -79,11 +79,11 @@ SECTIONS
 #endif
 	}
 
-	/DISCARD/ : {			/* Exit code and data		*/
-		EXIT_TEXT
-		EXIT_DATA
-		*(.exitcall.exit)
-		*(.discard)
+	/*
+	 * unwind exit sections must be discarded before the rest of the
+	 * unwind sections get included.
+	 */
+	/DISCARD/ : {
 		*(.ARM.exidx.exit.text)
 		*(.ARM.extab.exit.text)
 #ifndef CONFIG_HOTPLUG_CPU
@@ -271,6 +271,9 @@ SECTIONS
 	.stab.index 0 : { *(.stab.index) }
 	.stab.indexstr 0 : { *(.stab.indexstr) }
 	.comment 0 : { *(.comment) }
+
+	/* Default discards */
+	DISCARDS
 }
 
 /*
-- 
1.6.3.2

