Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:18057 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751600AbdFIId2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2017 04:33:28 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: replace genhdr-y with generated-y, deprecating genhdr-y
Date: Fri,  9 Jun 2017 17:29:52 +0900
Message-Id: <1496996992-17857-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Michal Marek <mmarek@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@redhat.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org

Prior to commit fcc8487d477a ("uapi: export all headers under uapi
directories"), genhdr-y was meant to specify generated UAPI headers.

- generated-y: generated headers (other than asm-generic wrappers)
- header-y   : headers to be exported
- genhdr-y   : generated headers to be exported (generated-y + header-y)

Now headers under UAPI directories are all exported.  So, there is no
more difference between generated-y and genhdr-y.

We see two users of genhdr-y, arch/{arm,x86}/include/uapi/asm/Kbuild.
They generate some headers in arch/{arm,x86}/include/uapi/generated/
directories, which are obviously exported.

Replace genhdr-y with generated-y, and deprecate genhdr-y.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.txt | 25 ++++++-------------------
 arch/arm/include/uapi/asm/Kbuild   |  6 +++---
 arch/x86/include/uapi/asm/Kbuild   |  6 +++---
 scripts/Makefile.asm-generic       |  2 +-
 4 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index e18daca65ccd..1c49e87cea4f 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -45,10 +45,9 @@ This document describes the Linux kernel Makefiles.
 
 	=== 7 Kbuild syntax for exported headers
 		--- 7.1 no-export-headers
-		--- 7.2 genhdr-y
-		--- 7.3 generic-y
-		--- 7.4 generated-y
-		--- 7.5 mandatory-y
+		--- 7.2 generic-y
+		--- 7.3 generated-y
+		--- 7.4 mandatory-y
 
 	=== 8 Kbuild Variables
 	=== 9 Makefile language
@@ -1277,18 +1276,7 @@ See subsequent chapter for the syntax of the Kbuild file.
 	avoid exporting specific headers (e.g. kvm.h) on architectures that do
 	not support it. It should be avoided as much as possible.
 
-	--- 7.2 genhdr-y
-
-	genhdr-y specifies asm files to be generated.
-
-		Example:
-			#arch/x86/include/uapi/asm/Kbuild
-			genhdr-y += unistd_32.h
-			genhdr-y += unistd_64.h
-			genhdr-y += unistd_x32.h
-
-
-	--- 7.3 generic-y
+	--- 7.2 generic-y
 
 	If an architecture uses a verbatim copy of a header from
 	include/asm-generic then this is listed in the file
@@ -1315,11 +1303,10 @@ See subsequent chapter for the syntax of the Kbuild file.
 		Example: termios.h
 			#include <asm-generic/termios.h>
 
-	--- 7.4 generated-y
+	--- 7.3 generated-y
 
 	If an architecture generates other header files alongside generic-y
-	wrappers, and not included in genhdr-y, then generated-y specifies
-	them.
+	wrappers, generated-y specifies them.
 
 	This prevents them being treated as stale asm-generic wrappers and
 	removed.
diff --git a/arch/arm/include/uapi/asm/Kbuild b/arch/arm/include/uapi/asm/Kbuild
index 607f702c2d62..424935e4515d 100644
--- a/arch/arm/include/uapi/asm/Kbuild
+++ b/arch/arm/include/uapi/asm/Kbuild
@@ -1,6 +1,6 @@
 # UAPI Header export list
 include include/uapi/asm-generic/Kbuild.asm
 
-genhdr-y += unistd-common.h
-genhdr-y += unistd-oabi.h
-genhdr-y += unistd-eabi.h
+generated-y += unistd-common.h
+generated-y += unistd-oabi.h
+generated-y += unistd-eabi.h
diff --git a/arch/x86/include/uapi/asm/Kbuild b/arch/x86/include/uapi/asm/Kbuild
index 83b6e9a0dce4..da1489cb64dc 100644
--- a/arch/x86/include/uapi/asm/Kbuild
+++ b/arch/x86/include/uapi/asm/Kbuild
@@ -1,6 +1,6 @@
 # UAPI Header export list
 include include/uapi/asm-generic/Kbuild.asm
 
-genhdr-y += unistd_32.h
-genhdr-y += unistd_64.h
-genhdr-y += unistd_x32.h
+generated-y += unistd_32.h
+generated-y += unistd_64.h
+generated-y += unistd_x32.h
diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index e4d017d53819..95f7d8090152 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -15,7 +15,7 @@ _dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
 
 # Stale wrappers when the corresponding files are removed from generic-y
 # need removing.
-generated-y   := $(generic-y) $(genhdr-y) $(generated-y)
+generated-y   := $(generic-y) $(generated-y)
 all-files     := $(patsubst %, $(obj)/%, $(generated-y))
 old-headers   := $(wildcard $(obj)/*.h)
 unwanted      := $(filter-out $(all-files),$(old-headers))
-- 
2.7.4

