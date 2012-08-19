Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:14941 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754000Ab2HSC5q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:46 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 64/74] Kbuild, lto: Add a gcc-ld script to let run gcc as ld
Date: Sat, 18 Aug 2012 19:57:00 -0700
Message-Id: <1345345030-22211-65-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

For LTO we need to run the link step with gcc, not ld.
Since there are a lot of linker options passed to it, add a gcc-ld wrapper
that wraps them as -Wl,

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/gcc-ld |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 scripts/gcc-ld

diff --git a/scripts/gcc-ld b/scripts/gcc-ld
new file mode 100644
index 0000000..cadab9a
--- /dev/null
+++ b/scripts/gcc-ld
@@ -0,0 +1,29 @@
+#!/bin/sh
+# run gcc with ld options
+# used as a wrapper to execute link time optimizations
+# yes virginia, this is not pretty
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
1.7.7.6

