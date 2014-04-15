Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:63607 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129AbaDOLwK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Apr 2014 07:52:10 -0400
Received: by mail-la0-f44.google.com with SMTP id c6so6773245lan.17
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Apr 2014 04:52:09 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH v2] builddeb: fix missing headers in linux-headers package
Date: Tue, 15 Apr 2014 14:51:48 +0300
Message-Id: <1397562708-7531-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Maximilian Attems <maks@debian.org>, Fathi Boudra <fathi.boudra@linaro.org>

The kernel headers package (linux-headers) doesn't include several
header files required to build out-of-tree modules.

It makes the package unusable on e.g. ARM architecture:
 /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
 fatal error: mach/memory.h: No such file or directory
 #include <mach/memory.h>
 ^
 compilation terminated.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 Changes from v1:
 - add missing module.lds, mips/Kbuild.platforms and Platform files
 - generically look for all include directories in arch/$SRCARCH

 scripts/package/builddeb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..42b1e20 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -287,9 +287,11 @@ EOF
 
 fi
 
-# Build header package
+# Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
+(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform >> "$objtree/debian/hdrsrcfiles")
+(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f >> "$objtree/debian/hdrsrcfiles")
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-- 
1.9.1
