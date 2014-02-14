Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:58150 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752895AbaBNVWu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Feb 2014 16:22:50 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 11/19] Kbuild, lto: Add a gcc-ld script to let run gcc as ld
Date: Fri, 14 Feb 2014 22:21:35 +0100
Message-Id: <1392412903-25733-12-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
References: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

For LTO we need to run the link step with gcc, not ld.
Since there are a lot of linker options passed to it, add a gcc-ld wrapper
that wraps them as -Wl,

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/gcc-ld | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 scripts/gcc-ld

diff --git a/scripts/gcc-ld b/scripts/gcc-ld
new file mode 100644
index 0000000..1e71ef3
--- /dev/null
+++ b/scripts/gcc-ld
@@ -0,0 +1,34 @@
+#!/bin/sh
+# run gcc with ld options
+# used as a wrapper to execute link time optimizations
+# yes virginia, this is not pretty
+
+case "${KBUILD_VERBOSE}" in
+*1*) set -x ;;
+esac
+
+ARGS="-nostdlib"
+
+while [ "$1" != "" ] ; do
+	case "$1" in
+	-save-temps|-m32|-m64) N="$1" ;;
+	-r) N="$1" ;;
+	-[Wg]*) N="$1" ;;
+	-[olv]|-[Ofd]*|-nostdlib) N="$1" ;;
+	--end-group|--start-group)
+		 N="-Wl,$1" ;;
+	-[RTFGhIezcbyYu]*|\
+--script|--defsym|-init|-Map|--oformat|-rpath|\
+-rpath-link|--sort-section|--section-start|-Tbss|-Tdata|-Ttext|\
+--version-script|--dynamic-list|--version-exports-symbol|--wrap|-m)
+		A="$1" ; shift ; N="-Wl,$A,$1" ;;
+	--param) shift ; N="--param $1" ;;
+	-[m]*) N="$1" ;;
+	-*) N="-Wl,$1" ;;
+	*)  N="$1" ;;
+	esac
+	ARGS="$ARGS $N"
+	shift
+done
+
+exec $CC $ARGS
-- 
1.8.5.2

