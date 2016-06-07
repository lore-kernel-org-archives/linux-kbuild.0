Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:48673 "EHLO
	conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263AbcFGFRr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2016 01:17:47 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: do not append NOSTDINC_FLAGS to avoid rebuild in package targets
Date: Tue,  7 Jun 2016 14:18:01 +0900
Message-Id: <1465276681-23700-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rik van Riel <riel@redhat.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

For package building, the scripts/package/Makefile invokes
"$(MAKE) KBUILD_SRC=", so the top Makefile is invoked recursively.

Notice NOSTDINC_FLAGS is exported and assigned with "+=", not ":=".
It means, NOSTDINC_FLAGS is accumulated in the call loop of package
build: top Makefile -> scripts/package/Makefile -> top Makefile.

Before, it was not a big deal because GCC just ignores the repeated
compile options, and $(call if_changed,...) compared the old/new
commands as a set of arguments.

However, the situation was changed by commit 9c8fa9bc08f6 ("kbuild:
fix if_change and friends to consider argument order").  Now Kbuild
compares old/new commands more precisely.

Since then, "make" followed by "make targz-pkg" always rebuilds the
whole kernel.  The NOSTDINC_FLAGS is added just once for "make",
whilst twice for "make targz-pkg" as mentioned above.  So, Kbuild
considers that the build command has changed despite that we want a
tarball straight away if everything is already built.

The easiest way to fix this problem is to change "+=" to ":="
for NOSTDINC_FLAGS assignment.

This effectively reverts commit e8f5bdb02ce0 ("[PATCH] Makefile
include path ordering").  Its log says that the arch Makefile may
override the include path order, but I see no arch Makefile touching
NOSTDINC_FLAGS.  So, this change should have no impact unless
something outside of the kernel needs to override it.

Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

This patch is fixing the problem reported by:
http://www.gossamer-threads.com/lists/linux/kernel/2454440

Paulo,
Thanks for your report!

Rik,
This patch is reverting your commit applied more than a decide ago.
As far as I see the kernel tree, I am not sure if it is still needed.
I am not familiar with Xen at all, so your review is very appreciated.


 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8d1301a..58c06be 100644
--- a/Makefile
+++ b/Makefile
@@ -767,7 +767,7 @@ KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
 endif
 
 # arch Makefile may override CC so keep this after arch Makefile is included
-NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+NOSTDINC_FLAGS := -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
 
 # warn about C99 declaration after statement
-- 
1.9.1

