Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:42188 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752931AbYECXQg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 May 2008 19:16:36 -0400
Date: Sun, 4 May 2008 02:15:35 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] kconfig-language.txt: remove bogus hint
Message-ID: <20080503231535.GY5838@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

This kconfig construct described here is required in a different and 
much more complicated situation.

For the use case the hint claimed it would be a simple dependency is 
enough.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
8e3fd4a5e77c9cd1b52989cd72e984b47ad426b4 diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 00b950d..c412c24 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -377,27 +377,3 @@ config FOO
 
 limits FOO to module (=m) or disabled (=n).
 
-
-Build limited by a third config symbol which may be =y or =m
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-A common idiom that we see (and sometimes have problems with) is this:
-
-When option C in B (module or subsystem) uses interfaces from A (module
-or subsystem), and both A and B are tristate (could be =y or =m if they
-were independent of each other, but they aren't), then we need to limit
-C such that it cannot be built statically if A is built as a loadable
-module.  (C already depends on B, so there is no dependency issue to
-take care of here.)
-
-If A is linked statically into the kernel image, C can be built
-statically or as loadable module(s).  However, if A is built as loadable
-module(s), then C must be restricted to loadable module(s) also.  This
-can be expressed in kconfig language as:
-
-config C
-	depends on A = y || A = B
-
-or for real examples, use this command in a kernel tree:
-
-$ find . -name Kconfig\* | xargs grep -ns "depends on.*=.*||.*=" | grep -v orig
-

