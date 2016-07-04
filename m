Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:60852 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbcGDOhB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jul 2016 10:37:01 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kbuild: make samples depend on headers_install
Date: Mon,  4 Jul 2016 16:39:35 +0200
Message-Id: <20160704143949.2357806-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Peter Foley <pefoley2@pefoley.com>, Jiri Kosina <jkosina@suse.cz>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Olof's build test setup keeps failing to compile arm64 kernels
because of a toolchain that uses outdated kernel headers:

/work/build/batch/samples/seccomp/bpf-fancy.c:13:27: fatal error: linux/seccomp.h: No such file or directory

This is of course something he could change, but it also indicates
that others may run into the same problem. Running 'make headers_install'
avoids the issue by ensuring that the kernel headers are put into
the $(objdir)/usr/include path before we build the samples.

The same problem happened for the Documentation build in the
past and was fixed up with commit 8e2faea877eb ("Make Documenation
depend on headers_install"). This adds an identical Makefile dependency
for the samples/ subdirectory.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ec355167cf36..4a44055e3433 100644
--- a/Makefile
+++ b/Makefile
@@ -1633,7 +1633,7 @@ endif
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
 	$(build)=$(build-dir)
 # Make sure the latest headers are built for Documentation
-Documentation/: headers_install
+Documentation/ samples/: headers_install
 %/: prepare scripts FORCE
 	$(cmd_crmodverdir)
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
-- 
2.9.0

