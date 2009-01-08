Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:16947 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753250AbZAHTAW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Jan 2009 14:00:22 -0500
Date: Thu, 8 Jan 2009 10:59:34 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] kbuild: fix kbuild.txt typos
Message-Id: <20090108105934.e02d4404.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: samr <sam@ravnborg.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix typos in the new kbuild.txt file.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 Documentation/kbuild/kbuild.txt |   29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

--- linux-next-20090108.orig/Documentation/kbuild/kbuild.txt
+++ linux-next-20090108/Documentation/kbuild/kbuild.txt
@@ -3,7 +3,7 @@ Environment variables
 KCPPFLAGS
 --------------------------------------------------
 Additional options to pass when preprocessing. The preprocessing options
-will be used in all cases where kbuild do preprocessing including
+will be used in all cases where kbuild does preprocessing including
 building C files and assembler files.
 
 KAFLAGS
@@ -16,7 +16,7 @@ Additional options to the C compiler.
 
 KBUILD_VERBOSE
 --------------------------------------------------
-Set the kbuild verbosity. Can be assinged same values as "V=...".
+Set the kbuild verbosity. Can be assigned same values as "V=...".
 See make help for the full list.
 Setting "V=..." takes precedence over KBUILD_VERBOSE.
 
@@ -35,14 +35,14 @@ KBUILD_OUTPUT
 --------------------------------------------------
 Specify the output directory when building the kernel.
 The output directory can also be specificed using "O=...".
-Setting "O=..." takes precedence over KBUILD_OUTPUT
+Setting "O=..." takes precedence over KBUILD_OUTPUT.
 
 ARCH
 --------------------------------------------------
 Set ARCH to the architecture to be built.
 In most cases the name of the architecture is the same as the
 directory name found in the arch/ directory.
-But some architectures suach as x86 and sparc has aliases.
+But some architectures such as x86 and sparc have aliases.
 x86: i386 for 32 bit, x86_64 for 64 bit
 sparc: sparc for 32 bit, sparc64 for 64 bit
 
@@ -63,7 +63,7 @@ CF is often used on the command-line lik
 INSTALL_PATH
 --------------------------------------------------
 INSTALL_PATH specifies where to place the updated kernel and system map
-images. Default is /boot, but you can set it to other values
+images. Default is /boot, but you can set it to other values.
 
 
 MODLIB
@@ -90,7 +90,7 @@ INSTALL_MOD_STRIP will used as the optio
 
 INSTALL_FW_PATH
 --------------------------------------------------
-INSTALL_FW_PATH specify where to install the firmware blobs.
+INSTALL_FW_PATH specifies where to install the firmware blobs.
 The default value is:
 
     $(INSTALL_MOD_PATH)/lib/firmware
@@ -99,7 +99,7 @@ The value can be overridden in which cas
 
 INSTALL_HDR_PATH
 --------------------------------------------------
-INSTALL_HDR_PATH specify where to install user space headers when
+INSTALL_HDR_PATH specifies where to install user space headers when
 executing "make headers_*".
 The default value is:
 
@@ -112,22 +112,23 @@ The value can be overridden in which cas
 
 KBUILD_MODPOST_WARN
 --------------------------------------------------
-KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
-symbols in the final module linking stage.
+KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
+symbols in the final module linking stage. It changes such errors
+into warnings.
 
-KBUILD_MODPOST_FINAL
+KBUILD_MODPOST_NOFINAL
 --------------------------------------------------
 KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
-This is solely usefull to speed up test compiles.
+This is solely useful to speed up test compiles.
 
 KBUILD_EXTRA_SYMBOLS
 --------------------------------------------------
-For modules use symbols from another modules.
+For modules that use symbols from other modules.
 See more details in modules.txt.
 
 ALLSOURCE_ARCHS
 --------------------------------------------------
-For tags/TAGS/cscope targets, you can specify more than one archs
-to be included in the databases, separated by blankspace. e.g.
+For tags/TAGS/cscope targets, you can specify more than one arch
+to be included in the databases, separated by blank space. E.g.:
 
     $ make ALLSOURCE_ARCHS="x86 mips arm" tags
