Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46061 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab3LKXel (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Dec 2013 18:34:41 -0500
Message-Id: <cef1ba27f4070a4ae78c77c8d43165c48e3e6c1f.1386804405.git.geoff@infradead.org>
In-Reply-To: <cover.1386804405.git.geoff@infradead.org>
References: <cover.1386804405.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Subject: [PATCH 1/3] kbuild: Fix debugging info generation for .S files
Date: Wed, 11 Dec 2013 23:34:40 +0000
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Change the debuging info generation flag in KBUILD_AFLAGS from '-gdwarf-2' to
'-Wa,--gdwarf-2'.  This will properly generate the debugging info for .S files
when CONFIG_DEBUG_INFO=y.

It seems current gcc does not pass a '--gdwarf-2' option on to the assembler
when '-gdwarf-2' is on its command line (note the differece in the gcc and as
flags).  This change provides the correct assembler flag to gcc, and so does
not rely on gcc to emit a flag for the assembler.

Signed-off-by: Geoff Levand <geoff@infradead.org> for Huawei, Linaro
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 890392f..7308a6f 100644
--- a/Makefile
+++ b/Makefile
@@ -619,7 +619,7 @@ endif
 
 ifdef CONFIG_DEBUG_INFO
 KBUILD_CFLAGS	+= -g
-KBUILD_AFLAGS	+= -gdwarf-2
+KBUILD_AFLAGS	+= -Wa,--gdwarf-2
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
-- 
1.8.1.2


