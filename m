Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52592 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754697AbYBBUqk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:40 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] Remove __INIT_REFOK and __INITDATA_REFOK
Date: Sat,  2 Feb 2008 21:46:35 +0100
Message-Id: <1201985204-26589-1-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>

From: Ralf Baechle <ralf@linux-mips.org>

Commit 312b1485fb509c9bc32eda28ad29537896658cb8 made __INIT_REFOK expand
into .section .section ".ref.text", "ax".  Since the assembler doesn't
tolerate stuttering in the source that broke all MIPS builds.

Since with this change Sam downgraded __INIT_REFOK to just a backward
compat thing and there being only a single use in the MIPS arch code the
best solution is to delete both of __INIT_REFOK and __INITDATA_REFOK (which
was equally broken) being unused anyway these can be deleted.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/linux/init.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index 2efbda0..90cdbbb 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -124,9 +124,6 @@
 #define __REF            .section       ".ref.text", "ax"
 #define __REFDATA        .section       ".ref.data", "aw"
 #define __REFCONST       .section       ".ref.rodata", "aw"
-/* backward compatibility */
-#define __INIT_REFOK     .section	__REF
-#define __INITDATA_REFOK .section	__REFDATA
 
 #ifndef __ASSEMBLY__
 /*
-- 
1.5.4.rc3.14.g44397

