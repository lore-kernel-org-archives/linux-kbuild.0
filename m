Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52607 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933728AbYBBUqm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:42 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] Move Kconfig.instrumentation to arch/Kconfig and init/Kconfig
Date: Sat,  2 Feb 2008 21:46:44 +0100
Message-Id: <1201985204-26589-10-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

Move the instrumentation Kconfig to

arch/Kconfig for architecture dependent options
  - oprofile
  - kprobes

and

init/Kconfig for architecture independent options
  - profiling
  - markers

Remove the "Instrumentation Support" menu. Everything moves to "General setup".
Delete the kernel/Kconfig.instrumentation file.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <linux-arch@vger.kernel.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/Kconfig                   |   28 ++++++++++++++++++++
 arch/alpha/Kconfig             |    2 -
 arch/arm/Kconfig               |    2 -
 arch/blackfin/Kconfig          |    2 -
 arch/cris/Kconfig              |    2 -
 arch/frv/Kconfig               |    2 -
 arch/h8300/Kconfig             |    2 -
 arch/ia64/Kconfig              |    2 -
 arch/m32r/Kconfig              |    2 -
 arch/m68k/Kconfig              |    2 -
 arch/m68knommu/Kconfig         |    2 -
 arch/mips/Kconfig              |    2 -
 arch/parisc/Kconfig            |    2 -
 arch/powerpc/Kconfig           |    2 -
 arch/ppc/Kconfig               |    2 -
 arch/s390/Kconfig              |    2 -
 arch/sh/Kconfig                |    2 -
 arch/sparc/Kconfig             |    2 -
 arch/sparc64/Kconfig           |    2 -
 arch/um/Kconfig                |    2 -
 arch/v850/Kconfig              |    2 -
 arch/x86/Kconfig               |    2 -
 arch/xtensa/Kconfig            |    2 -
 init/Kconfig                   |   12 ++++++++
 kernel/Kconfig.instrumentation |   55 ----------------------------------------
 25 files changed, 40 insertions(+), 99 deletions(-)
 delete mode 100644 kernel/Kconfig.instrumentation

diff --git a/arch/Kconfig b/arch/Kconfig
index 2491714..3d72dc3 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1,3 +1,31 @@
 #
 # General architecture dependent options
 #
+
+config OPROFILE
+	tristate "OProfile system profiling (EXPERIMENTAL)"
+	depends on PROFILING
+	depends on HAVE_OPROFILE
+	help
+	  OProfile is a profiling system capable of profiling the
+	  whole system, include the kernel, kernel modules, libraries,
+	  and applications.
+
+	  If unsure, say N.
+
+config HAVE_OPROFILE
+	def_bool n
+
+config KPROBES
+	bool "Kprobes"
+	depends on KALLSYMS && MODULES
+	depends on HAVE_KPROBES
+	help
+	  Kprobes allows you to trap at almost any kernel address and
+	  execute a callback function.  register_kprobe() establishes
+	  a probepoint and specifies the callback.  Kprobes is useful
+	  for kernel debugging, non-intrusive instrumentation and testing.
+	  If in doubt, say "N".
+
+config HAVE_KPROBES
+	def_bool n
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 0ff5572..9abcd5f 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -650,8 +650,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/alpha/Kconfig.debug"
 
 # DUMMY_CONSOLE may be defined in drivers/video/console/Kconfig
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ea45eef..36176f4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1147,8 +1147,6 @@ endmenu
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/arm/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
index 3ba89dc..ba21e33 100644
--- a/arch/blackfin/Kconfig
+++ b/arch/blackfin/Kconfig
@@ -974,8 +974,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/blackfin/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index 222da15..7f0be4c 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -213,8 +213,6 @@ source "drivers/pci/Kconfig"
 
 source "drivers/usb/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/cris/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/frv/Kconfig b/arch/frv/Kconfig
index e3f965c..68380cb 100644
--- a/arch/frv/Kconfig
+++ b/arch/frv/Kconfig
@@ -375,8 +375,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/frv/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index ff6a871..dc61222 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -223,8 +223,6 @@ endmenu
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/h8300/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 8db6324..a0740fb 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -602,8 +602,6 @@ config IRQ_PER_CPU
 
 source "arch/ia64/hp/sim/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/ia64/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/m32r/Kconfig b/arch/m32r/Kconfig
index b93897d..1225975 100644
--- a/arch/m32r/Kconfig
+++ b/arch/m32r/Kconfig
@@ -427,8 +427,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/m32r/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 24e6bc0..8236e42 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -678,8 +678,6 @@ endmenu
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/m68k/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/m68knommu/Kconfig b/arch/m68knommu/Kconfig
index bd92137..6abbbb8 100644
--- a/arch/m68knommu/Kconfig
+++ b/arch/m68knommu/Kconfig
@@ -711,8 +711,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/m68knommu/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index eb8be54..d38ebd3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2096,8 +2096,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/mips/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index e1a2f77..25c10fa 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -273,8 +273,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/parisc/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c6f3eb5..b94d450 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -715,8 +715,6 @@ source "arch/powerpc/sysdev/qe_lib/Kconfig"
 
 source "lib/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/powerpc/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/ppc/Kconfig b/arch/ppc/Kconfig
index 92e37f5..531156f 100644
--- a/arch/ppc/Kconfig
+++ b/arch/ppc/Kconfig
@@ -1258,8 +1258,6 @@ endmenu
 
 source "lib/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/ppc/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 272c6c8..974f9c3 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -528,8 +528,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/s390/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index f868691..bfbd54a 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -897,8 +897,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/sh/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 3d9bc2f..51008a2 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -321,8 +321,6 @@ endmenu
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/sparc/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/sparc64/Kconfig b/arch/sparc64/Kconfig
index cbdc80d..a7739b5 100644
--- a/arch/sparc64/Kconfig
+++ b/arch/sparc64/Kconfig
@@ -467,8 +467,6 @@ source "drivers/sbus/char/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/sparc64/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index dd1689b..55945db 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -289,6 +289,4 @@ config INPUT
 	bool
 	default n
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/um/Kconfig.debug"
diff --git a/arch/v850/Kconfig b/arch/v850/Kconfig
index b6a50b8..ace479a 100644
--- a/arch/v850/Kconfig
+++ b/arch/v850/Kconfig
@@ -331,8 +331,6 @@ source "sound/Kconfig"
 
 source "drivers/usb/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/v850/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 72db31c..3162cb4 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1595,8 +1595,6 @@ source "drivers/firmware/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/x86/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 844721e..5d5546c 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -246,8 +246,6 @@ config EMBEDDED_RAMDISK_IMAGE
 	  provide one yourself.
 endmenu
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/xtensa/Kconfig.debug"
 
 source "security/Kconfig"
diff --git a/init/Kconfig b/init/Kconfig
index 8de6c48..b2acdeb 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -665,6 +665,18 @@ config SLOB
 
 endchoice
 
+config PROFILING
+	bool "Profiling support (EXPERIMENTAL)"
+	help
+	  Say Y here to enable the extended profiling support mechanisms used
+	  by profilers such as OProfile.
+
+config MARKERS
+	bool "Activate markers"
+	help
+	  Place an empty function call at each marker site. Can be
+	  dynamically changed for a probe function.
+
 source "arch/Kconfig"
 
 endmenu		# General setup
diff --git a/kernel/Kconfig.instrumentation b/kernel/Kconfig.instrumentation
deleted file mode 100644
index 2195b65..0000000
--- a/kernel/Kconfig.instrumentation
+++ /dev/null
@@ -1,55 +0,0 @@
-menuconfig INSTRUMENTATION
-	bool "Instrumentation Support"
-	default y
-	---help---
-	  Say Y here to get to see options related to performance measurement,
-	  system-wide debugging, and testing. This option alone does not add any
-	  kernel code.
-
-	  If you say N, all options in this submenu will be skipped and
-	  disabled. If you're trying to debug the kernel itself, go see the
-	  Kernel Hacking menu.
-
-if INSTRUMENTATION
-
-config PROFILING
-	bool "Profiling support (EXPERIMENTAL)"
-	help
-	  Say Y here to enable the extended profiling support mechanisms used
-	  by profilers such as OProfile.
-
-config OPROFILE
-	tristate "OProfile system profiling (EXPERIMENTAL)"
-	depends on PROFILING && !UML
-	depends on HAVE_OPROFILE
-	help
-	  OProfile is a profiling system capable of profiling the
-	  whole system, include the kernel, kernel modules, libraries,
-	  and applications.
-
-	  If unsure, say N.
-
-config HAVE_OPROFILE
-	def_bool n
-
-config KPROBES
-	bool "Kprobes"
-	depends on KALLSYMS && MODULES && !UML
-	depends on HAVE_KPROBES
-	help
-	  Kprobes allows you to trap at almost any kernel address and
-	  execute a callback function.  register_kprobe() establishes
-	  a probepoint and specifies the callback.  Kprobes is useful
-	  for kernel debugging, non-intrusive instrumentation and testing.
-	  If in doubt, say "N".
-
-config HAVE_KPROBES
-	def_bool n
-
-config MARKERS
-	bool "Activate markers"
-	help
-	  Place an empty function call at each marker site. Can be
-	  dynamically changed for a probe function.
-
-endif # INSTRUMENTATION
-- 
1.5.4.rc3.14.g44397

