Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:48022 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751025AbcFXWms (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jun 2016 18:42:48 -0400
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v4 1/2] kbuild, x86: Track generated headers with generated-y
Date: Fri, 24 Jun 2016 23:42:23 +0100
Message-ID: <1466808144-23209-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1466808144-23209-1-git-send-email-james.hogan@imgtec.com>
References: <1466808144-23209-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Michal Marek <mmarek@suse.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org

Track generated header files which aren't already in genhdr-y, alongside
generic-y wrappers in the */include/generated/[uapi/]asm/ directories.
Currently only x86 generates extra headers in these directories, for the
purposes of enumerating system calls for different ABIs, and xen
hypercalls.

This will allow the asm-generic wrapper handling code to remove stale
wrappers when files are removed from generic-y, without also removing
these headers which are generated separately.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-doc@vger.kernel.org
---
Changes in v4:
- None (resend).

Changes in v2:
- New patch (thanks to kbuild test robot).
---
 Documentation/kbuild/makefiles.txt | 14 ++++++++++++++
 arch/x86/include/asm/Kbuild        |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 13f888a02a3d..385a5ef41c17 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -47,6 +47,7 @@ This document describes the Linux kernel Makefiles.
 		--- 7.2 genhdr-y
 		--- 7.3 destination-y
 		--- 7.4 generic-y
+		--- 7.5 generated-y
 
 	=== 8 Kbuild Variables
 	=== 9 Makefile language
@@ -1319,6 +1320,19 @@ See subsequent chapter for the syntax of the Kbuild file.
 		Example: termios.h
 			#include <asm-generic/termios.h>
 
+	--- 7.5 generated-y
+
+	If an architecture generates other header files alongside generic-y
+	wrappers, and not included in genhdr-y, then generated-y specifies
+	them.
+
+	This prevents them being treated as stale asm-generic wrappers and
+	removed.
+
+		Example:
+			#arch/x86/include/asm/Kbuild
+			generated-y += syscalls_32.h
+
 === 8 Kbuild Variables
 
 The top Makefile exports the following variables:
diff --git a/arch/x86/include/asm/Kbuild b/arch/x86/include/asm/Kbuild
index aeac434c9feb..2cfed174e3c9 100644
--- a/arch/x86/include/asm/Kbuild
+++ b/arch/x86/include/asm/Kbuild
@@ -1,5 +1,11 @@
 
 
+generated-y += syscalls_32.h
+generated-y += syscalls_64.h
+generated-y += unistd_32_ia32.h
+generated-y += unistd_64_x32.h
+generated-y += xen-hypercalls.h
+
 genhdr-y += unistd_32.h
 genhdr-y += unistd_64.h
 genhdr-y += unistd_x32.h
-- 
2.4.10

