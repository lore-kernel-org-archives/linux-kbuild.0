Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60273 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932526AbcKBRVS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 13:21:18 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/2] kbuild: add -fno-PIE
Date: Wed,  2 Nov 2016 18:20:58 +0100
Message-Id: <20161102172058.13641-2-bigeasy@linutronix.de>
In-Reply-To: <20161102172058.13641-1-bigeasy@linutronix.de>
References: <20161102172058.13641-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, ben@decadent.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Debian started to build the gcc with -fPIE by default so the kernel
build ends before it starts properly with:
|kernel/bounds.c:1:0: error: code model kernel does not support PIC mode

Also add to KBUILD_AFLAGSi due to:

|gcc -Wp,-MD,arch/x86/entry/vdso/vdso32/.note.o.d … -mfentry -DCC_USING_FENTRY … vdso/vdso32/note.S
|arch/x86/entry/vdso/vdso32/note.S:1:0: sorry, unimplemented: -mfentry isn’t supported for 32-bit in c ombination with -fpic

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 93beca4312c4..3e0a9afa428f 100644
--- a/Makefile
+++ b/Makefile
@@ -398,12 +398,12 @@ KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common \
 		   -Werror-implicit-function-declaration \
-		   -Wno-format-security \
+		   -Wno-format-security -fno-PIE \
 		   -std=gnu89
 
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
-KBUILD_AFLAGS   := -D__ASSEMBLY__
+KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
 KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
-- 
2.10.2

