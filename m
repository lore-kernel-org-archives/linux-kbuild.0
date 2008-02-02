Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52606 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933664AbYBBUqm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:42 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] Fix ARM to play nicely with generic Instrumentation menu
Date: Sat,  2 Feb 2008 21:46:40 +0100
Message-Id: <1201985204-26589-6-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

The conflicting commit for
move-kconfiginstrumentation-to-arch-kconfig-and-init-kconfig.patch
is the ARM fix from Linus :

commit 38ad9aebe70dc72df08851bbd1620d89329129ba

He just seemed to agree that my approach (just putting the missing ARM
config options in arch/arm/Kconfig) works too. The main advantage it has
is that it is smaller, does not need a cleanup in the future and does
not break the following patches unnecessarily.

It's just been discussed here

http://lkml.org/lkml/2008/1/15/267

However, Linus might prefer to stay with his own patch and I would
totally understand it that late in the release cycle. Therefore I submit
this for the next release cycle.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
CC: Russell King <rmk+lkml@arm.linux.org.uk>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/arm/Kconfig                 |   19 +++++++++++-
 arch/arm/Kconfig.instrumentation |   62 --------------------------------------
 kernel/Kconfig.instrumentation   |    2 +-
 3 files changed, 19 insertions(+), 64 deletions(-)
 delete mode 100644 arch/arm/Kconfig.instrumentation

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4b1a8e3..623eaa1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -135,6 +135,23 @@ config FIQ
 config ARCH_MTD_XIP
 	bool
 
+if OPROFILE
+
+config OPROFILE_ARMV6
+	def_bool y
+	depends on CPU_V6 && !SMP
+	select OPROFILE_ARM11_CORE
+
+config OPROFILE_MPCORE
+	def_bool y
+	depends on CPU_V6 && SMP
+	select OPROFILE_ARM11_CORE
+
+config OPROFILE_ARM11_CORE
+	bool
+
+endif
+
 config VECTORS_BASE
 	hex
 	default 0xffff0000 if MMU || CPU_HIGH_VECTOR
@@ -1128,7 +1145,7 @@ endmenu
 
 source "fs/Kconfig"
 
-source "arch/arm/Kconfig.instrumentation"
+source "kernel/Kconfig.instrumentation"
 
 source "arch/arm/Kconfig.debug"
 
diff --git a/arch/arm/Kconfig.instrumentation b/arch/arm/Kconfig.instrumentation
deleted file mode 100644
index 453ad8e..0000000
--- a/arch/arm/Kconfig.instrumentation
+++ /dev/null
@@ -1,62 +0,0 @@
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
-	help
-	  OProfile is a profiling system capable of profiling the
-	  whole system, include the kernel, kernel modules, libraries,
-	  and applications.
-
-	  If unsure, say N.
-
-config OPROFILE_ARMV6
-	bool
-	depends on OPROFILE && CPU_V6 && !SMP
-	default y
-	select OPROFILE_ARM11_CORE
-
-config OPROFILE_MPCORE
-	bool
-	depends on OPROFILE && CPU_V6 && SMP
-	default y
-	select OPROFILE_ARM11_CORE
-
-config OPROFILE_ARM11_CORE
-	bool
-
-config KPROBES
-	bool "Kprobes"
-	depends on KALLSYMS && MODULES && !UML && !XIP_KERNEL
-	help
-	  Kprobes allows you to trap at almost any kernel address and
-	  execute a callback function.  register_kprobe() establishes
-	  a probepoint and specifies the callback.  Kprobes is useful
-	  for kernel debugging, non-intrusive instrumentation and testing.
-	  If in doubt, say "N".
-
-config MARKERS
-	bool "Activate markers"
-	help
-	  Place an empty function call at each marker site. Can be
-	  dynamically changed for a probe function.
-
-endif # INSTRUMENTATION
diff --git a/kernel/Kconfig.instrumentation b/kernel/Kconfig.instrumentation
index 468f47a..a00dcb6 100644
--- a/kernel/Kconfig.instrumentation
+++ b/kernel/Kconfig.instrumentation
@@ -32,7 +32,7 @@ config OPROFILE
 config KPROBES
 	bool "Kprobes"
 	depends on KALLSYMS && MODULES && !UML
-	depends on X86_32 || IA64 || PPC || S390 || SPARC64 || X86_64 || AVR32
+	depends on X86_32 || IA64 || PPC || S390 || SPARC64 || X86_64 || AVR32 || (ARM && !XIP_KERNEL)
 	help
 	  Kprobes allows you to trap at almost any kernel address and
 	  execute a callback function.  register_kprobe() establishes
-- 
1.5.4.rc3.14.g44397

