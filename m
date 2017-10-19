Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:27800 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751099AbdJSDRm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 23:17:42 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild doc: a bundle of fixes on makefiles.txt
Date: Thu, 19 Oct 2017 11:17:05 +0800
Message-ID: <1508383025-24222-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: corbet@lwn.net, mmarek@suse.com, yamada.masahiro@socionext.com

It does several fixes:
1. move the displaced ld example to its reasonale place.
2. add new example for command gzip.
3. fix 2 number errors.
4. fix format of chapter 7.x, make it looks the same as other chapters.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 Documentation/kbuild/makefiles.txt | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 329e740..f6f8038 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1108,14 +1108,6 @@ When kbuild executes, the following steps are followed (roughly):
     ld
 	Link target. Often, LDFLAGS_$@ is used to set specific options to ld.
 
-    objcopy
-	Copy binary. Uses OBJCOPYFLAGS usually specified in
-	arch/$(ARCH)/Makefile.
-	OBJCOPYFLAGS_$@ may be used to set additional options.
-
-    gzip
-	Compress target. Use maximum compression to compress target.
-
 	Example:
 		#arch/x86/boot/Makefile
 		LDFLAGS_bootsect := -Ttext 0x0 -s --oformat binary
@@ -1139,6 +1131,19 @@ When kbuild executes, the following steps are followed (roughly):
 	      resulting in the target file being recompiled for no
 	      obvious reason.
 
+    objcopy
+	Copy binary. Uses OBJCOPYFLAGS usually specified in
+	arch/$(ARCH)/Makefile.
+	OBJCOPYFLAGS_$@ may be used to set additional options.
+
+    gzip
+	Compress target. Use maximum compression to compress target.
+
+	Example:
+		#arch/x86/boot/compressed/Makefile
+		$(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
+			$(call if_changed,gzip)
+
     dtc
 	Create flattened device tree blob object suitable for linking
 	into vmlinux. Device tree blobs linked into vmlinux are placed
@@ -1219,7 +1224,7 @@ When kbuild executes, the following steps are followed (roughly):
 	that may be shared between individual architectures.
 	The recommended approach how to use a generic header file is
 	to list the file in the Kbuild file.
-	See "7.3 generic-y" for further info on syntax etc.
+	See "7.2 generic-y" for further info on syntax etc.
 
 --- 6.11 Post-link pass
 
@@ -1254,13 +1259,13 @@ A Kbuild file may be defined under arch/<arch>/include/uapi/asm/ and
 arch/<arch>/include/asm/ to list asm files coming from asm-generic.
 See subsequent chapter for the syntax of the Kbuild file.
 
-	--- 7.1 no-export-headers
+--- 7.1 no-export-headers
 
 	no-export-headers is essentially used by include/uapi/linux/Kbuild to
 	avoid exporting specific headers (e.g. kvm.h) on architectures that do
 	not support it. It should be avoided as much as possible.
 
-	--- 7.2 generic-y
+--- 7.2 generic-y
 
 	If an architecture uses a verbatim copy of a header from
 	include/asm-generic then this is listed in the file
@@ -1287,7 +1292,7 @@ See subsequent chapter for the syntax of the Kbuild file.
 		Example: termios.h
 			#include <asm-generic/termios.h>
 
-	--- 7.3 generated-y
+--- 7.3 generated-y
 
 	If an architecture generates other header files alongside generic-y
 	wrappers, generated-y specifies them.
@@ -1299,7 +1304,7 @@ See subsequent chapter for the syntax of the Kbuild file.
 			#arch/x86/include/asm/Kbuild
 			generated-y += syscalls_32.h
 
-	--- 7.5 mandatory-y
+--- 7.4 mandatory-y
 
 	mandatory-y is essentially used by include/uapi/asm-generic/Kbuild.asm
 	to define the minimum set of headers that must be exported in
-- 
2.1.0



