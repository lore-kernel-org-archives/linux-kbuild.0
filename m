Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:38352 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756142AbZKRVGf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2009 16:06:35 -0500
From: Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH 1/3] powerpc: Use scripts/mkuboot.sh instead of 'mkimage'
Date: Wed, 18 Nov 2009 14:57:12 -0600
Message-Id: <1258577834-26006-2-git-send-email-ptyser@xes-inc.com>
In-Reply-To: <1258577834-26006-1-git-send-email-ptyser@xes-inc.com>
References: <1258577834-26006-1-git-send-email-ptyser@xes-inc.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: linux-kbuild@vger.kernel.org, Peter Tyser <ptyser@xes-inc.com>

mkuboot.sh provides a basic wrapper for the 'mkimage' utility.  Using
mkuboot.sh provides clearer error reporting and allows a toolchain to
use its own 'mkimage' executable specified by ${CROSS_COMPILE}mkimage.
Additionally, this brings PowerPC in line with other architectures
which already call mkimage via mkuboot.sh.

Signed-off-by: Peter Tyser <ptyser@xes-inc.com>
---
 arch/powerpc/boot/wrapper |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index ac9e9a5..1ee9448 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -43,6 +43,9 @@ gzip=.gz
 # cross-compilation prefix
 CROSS=
 
+# mkimage wrapper script
+MKIMAGE=$srctree/scripts/mkuboot.sh
+
 # directory for object and other files used by this script
 object=arch/powerpc/boot
 objbin=$object
@@ -263,7 +266,7 @@ membase=`${CROSS}objdump -p "$kernel" | grep -m 1 LOAD | awk '{print $7}'`
 case "$platform" in
 uboot)
     rm -f "$ofile"
-    mkimage -A ppc -O linux -T kernel -C gzip -a $membase -e $membase \
+    ${MKIMAGE} -A ppc -O linux -T kernel -C gzip -a $membase -e $membase \
 	$uboot_version -d "$vmz" "$ofile"
     if [ -z "$cacheit" ]; then
 	rm -f "$vmz"
@@ -323,7 +326,7 @@ coff)
     ;;
 cuboot*)
     gzip -f -9 "$ofile"
-    mkimage -A ppc -O linux -T kernel -C gzip -a "$base" -e "$entry" \
+    ${MKIMAGE} -A ppc -O linux -T kernel -C gzip -a "$base" -e "$entry" \
             $uboot_version -d "$ofile".gz "$ofile"
     ;;
 treeboot*)
-- 
1.6.2.1

