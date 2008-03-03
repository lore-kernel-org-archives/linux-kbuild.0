Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:49985 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754287AbYCCXBQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 3 Mar 2008 18:01:16 -0500
Date: Mon, 3 Mar 2008 15:01:05 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] kbuild doc: move smart-config.txt to Doc/kbuild/
Message-Id: <20080303150105.d8f68bc1.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: samr <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

I'm trying to clean up some of the Documentation diretory.
What do you think about this one?

Move smart-config.txt to Documentation/kbuild/ since it is
build/config-related.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 Documentation/kbuild/smart-config.txt |   98 ++++++++++++++++++++++++
 Documentation/smart-config.txt        |   98 ------------------------
 2 files changed, 98 insertions(+), 98 deletions(-)

--- /dev/null
+++ linux-2.6.25-rc3-git4/Documentation/kbuild/smart-config.txt
@@ -0,0 +1,98 @@
+Smart CONFIG_* Dependencies
+1 August 1999
+
+Michael Chastain   <mec@shout.net>
+Werner Almesberger <almesber@lrc.di.epfl.ch>
+Martin von Loewis  <martin@mira.isdn.cs.tu-berlin.de>
+
+Here is the problem:
+
+    Suppose that drivers/net/foo.c has the following lines:
+
+	#include <linux/config.h>
+
+	...
+
+	#ifdef CONFIG_FOO_AUTOFROB
+	    /* Code for auto-frobbing */
+	#else
+	    /* Manual frobbing only */
+	#endif
+
+	...
+
+	#ifdef CONFIG_FOO_MODEL_TWO
+	    /* Code for model two */
+	#endif
+
+    Now suppose the user (the person building kernels) reconfigures the
+    kernel to change some unrelated setting.  This will regenerate the
+    file include/linux/autoconf.h, which will cause include/linux/config.h
+    to be out of date, which will cause drivers/net/foo.c to be recompiled.
+
+    Most kernel sources, perhaps 80% of them, have at least one CONFIG_*
+    dependency somewhere.  So changing _any_ CONFIG_* setting requires
+    almost _all_ of the kernel to be recompiled.
+
+Here is the solution:
+
+    We've made the dependency generator, mkdep.c, smarter.  Instead of
+    generating this dependency:
+
+	drivers/net/foo.c: include/linux/config.h
+
+    It now generates these dependencies:
+
+	drivers/net/foo.c: \
+	    include/config/foo/autofrob.h \
+	    include/config/foo/model/two.h
+
+    So drivers/net/foo.c depends only on the CONFIG_* lines that
+    it actually uses.
+
+    A new program, split-include.c, runs at the beginning of
+    compilation (make bzImage or make zImage).  split-include reads
+    include/linux/autoconf.h and updates the include/config/ tree,
+    writing one file per option.  It updates only the files for options
+    that have changed.
+
+Flag Dependencies
+
+    Martin Von Loewis contributed another feature to this patch:
+    'flag dependencies'.  The idea is that a .o file depends on
+    the compilation flags used to build it.  The file foo.o has
+    its flags stored in .flags.foo.o.
+
+    Suppose the user changes the foo driver from resident to modular.
+    'make' will notice that the current foo.o was not compiled with
+    -DMODULE and will recompile foo.c.
+
+    All .o files made from C source have flag dependencies.  So do .o
+    files made with ld, and .a files made with ar.  However, .o files
+    made from assembly source do not have flag dependencies (nobody
+    needs this yet, but it would be good to fix).
+
+Per-source-file Flags
+
+    Flag dependencies also work with per-source-file flags.
+    You can specify compilation flags for individual source files
+    like this:
+
+	CFLAGS_foo.o = -DSPECIAL_FOO_DEFINE
+
+    This helps clean up drivers/net/Makefile, drivers/scsi/Makefile,
+    and several other Makefiles.
+
+Credit
+
+    Werner Almesberger had the original idea and wrote the first
+    version of this patch.
+    
+    Michael Chastain picked it up and continued development.  He is
+    now the principal author and maintainer.  Please report any bugs
+    to him.
+
+    Martin von Loewis wrote flag dependencies, with some modifications
+    by Michael Chastain.
+
+    Thanks to all of the beta testers.
--- linux-2.6.25-rc3-git4.orig/Documentation/smart-config.txt
+++ /dev/null
@@ -1,98 +0,0 @@
-Smart CONFIG_* Dependencies
-1 August 1999
-
-Michael Chastain   <mec@shout.net>
-Werner Almesberger <almesber@lrc.di.epfl.ch>
-Martin von Loewis  <martin@mira.isdn.cs.tu-berlin.de>
-
-Here is the problem:
-
-    Suppose that drivers/net/foo.c has the following lines:
-
-	#include <linux/config.h>
-
-	...
-
-	#ifdef CONFIG_FOO_AUTOFROB
-	    /* Code for auto-frobbing */
-	#else
-	    /* Manual frobbing only */
-	#endif
-
-	...
-
-	#ifdef CONFIG_FOO_MODEL_TWO
-	    /* Code for model two */
-	#endif
-
-    Now suppose the user (the person building kernels) reconfigures the
-    kernel to change some unrelated setting.  This will regenerate the
-    file include/linux/autoconf.h, which will cause include/linux/config.h
-    to be out of date, which will cause drivers/net/foo.c to be recompiled.
-
-    Most kernel sources, perhaps 80% of them, have at least one CONFIG_*
-    dependency somewhere.  So changing _any_ CONFIG_* setting requires
-    almost _all_ of the kernel to be recompiled.
-
-Here is the solution:
-
-    We've made the dependency generator, mkdep.c, smarter.  Instead of
-    generating this dependency:
-
-	drivers/net/foo.c: include/linux/config.h
-
-    It now generates these dependencies:
-
-	drivers/net/foo.c: \
-	    include/config/foo/autofrob.h \
-	    include/config/foo/model/two.h
-
-    So drivers/net/foo.c depends only on the CONFIG_* lines that
-    it actually uses.
-
-    A new program, split-include.c, runs at the beginning of
-    compilation (make bzImage or make zImage).  split-include reads
-    include/linux/autoconf.h and updates the include/config/ tree,
-    writing one file per option.  It updates only the files for options
-    that have changed.
-
-Flag Dependencies
-
-    Martin Von Loewis contributed another feature to this patch:
-    'flag dependencies'.  The idea is that a .o file depends on
-    the compilation flags used to build it.  The file foo.o has
-    its flags stored in .flags.foo.o.
-
-    Suppose the user changes the foo driver from resident to modular.
-    'make' will notice that the current foo.o was not compiled with
-    -DMODULE and will recompile foo.c.
-
-    All .o files made from C source have flag dependencies.  So do .o
-    files made with ld, and .a files made with ar.  However, .o files
-    made from assembly source do not have flag dependencies (nobody
-    needs this yet, but it would be good to fix).
-
-Per-source-file Flags
-
-    Flag dependencies also work with per-source-file flags.
-    You can specify compilation flags for individual source files
-    like this:
-
-	CFLAGS_foo.o = -DSPECIAL_FOO_DEFINE
-
-    This helps clean up drivers/net/Makefile, drivers/scsi/Makefile,
-    and several other Makefiles.
-
-Credit
-
-    Werner Almesberger had the original idea and wrote the first
-    version of this patch.
-    
-    Michael Chastain picked it up and continued development.  He is
-    now the principal author and maintainer.  Please report any bugs
-    to him.
-
-    Martin von Loewis wrote flag dependencies, with some modifications
-    by Michael Chastain.
-
-    Thanks to all of the beta testers.
