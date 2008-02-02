Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52600 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1764147AbYBBUql (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:41 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] Add HAVE_OPROFILE
Date: Sat,  2 Feb 2008 21:46:42 +0100
Message-Id: <1201985204-26589-8-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

Linus:
On the per-architecture side, I do think it would be better to *not* have
internal architecture knowledge in a generic file, and as such a line like

        depends on X86_32 || IA64 || PPC || S390 || SPARC64 || X86_64 || AVR32

really shouldn't exist in a file like kernel/Kconfig.instrumentation.

It would be much better to do

        depends on ARCH_SUPPORTS_KPROBES

in that generic file, and then architectures that do support it would just
have a

        bool ARCH_SUPPORTS_KPROBES
                default y

in *their* architecture files. That would seem to be much more logical,
and is readable both for arch maintainers *and* for people who have no
clue - and don't care - about which architecture is supposed to support
which interface...

Changelog:

Actually, I know I gave this as the magic incantation, but now that I see
it, I realize that I should have told you to just use

        config ARCH_SUPPORTS_KPROBES
                def_bool y

instead, which is a bit denser.

We seem to use both kinds of syntax for these things, but this is really
what "def_bool" is there for...

Changelog :

- Moving to HAVE_*.
- Add AVR32 oprofile.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/alpha/Kconfig             |    1 +
 arch/arm/Kconfig               |    1 +
 arch/avr32/Kconfig             |    4 +---
 arch/blackfin/Kconfig          |    1 +
 arch/ia64/Kconfig              |    1 +
 arch/m32r/Kconfig              |    1 +
 arch/mips/Kconfig              |    1 +
 arch/parisc/Kconfig            |    1 +
 arch/powerpc/Kconfig           |    1 +
 arch/ppc/Kconfig               |    1 +
 arch/s390/Kconfig              |    1 +
 arch/sh/Kconfig                |    1 +
 arch/sparc/Kconfig             |    1 +
 arch/sparc64/Kconfig           |    1 +
 arch/x86/Kconfig               |    5 +----
 kernel/Kconfig.instrumentation |    5 ++++-
 16 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index c613d5f..0ff5572 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -5,6 +5,7 @@
 config ALPHA
 	bool
 	default y
+	select HAVE_OPROFILE
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 623eaa1..3b3eb4e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -10,6 +10,7 @@ config ARM
 	default y
 	select RTC_LIB
 	select SYS_SUPPORTS_APM_EMULATION
+	select HAVE_OPROFILE
 	help
 	  The ARM series is a line of low-power-consumption RISC chip designs
 	  licensed by ARM Ltd and targeted at embedded applications and
diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
index e34e2c9..b46932c 100644
--- a/arch/avr32/Kconfig
+++ b/arch/avr32/Kconfig
@@ -10,6 +10,7 @@ config AVR32
 	# With EMBEDDED=n, we get lots of stuff automatically selected
 	# that we usually don't need on AVR32.
 	select EMBEDDED
+	select HAVE_OPROFILE
 	help
 	  AVR32 is a high-performance 32-bit RISC microprocessor core,
 	  designed for cost-sensitive embedded applications, with particular
@@ -54,9 +55,6 @@ config ARCH_HAS_ILOG2_U32
 config ARCH_HAS_ILOG2_U64
 	def_bool n
 
-config ARCH_SUPPORTS_OPROFILE
-	def_bool y
-
 config GENERIC_HWEIGHT
 	def_bool y
 
diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
index 4802eb7..3ba89dc 100644
--- a/arch/blackfin/Kconfig
+++ b/arch/blackfin/Kconfig
@@ -24,6 +24,7 @@ config RWSEM_XCHGADD_ALGORITHM
 config BLACKFIN
 	bool
 	default y
+	select HAVE_OPROFILE
 
 config ZONE_DMA
 	bool
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index c9307c9..5e410f2 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -15,6 +15,7 @@ config IA64
 	select ACPI if (!IA64_HP_SIM)
 	select PM if (!IA64_HP_SIM)
 	select ARCH_SUPPORTS_MSI
+	select HAVE_OPROFILE
 	default y
 	help
 	  The Itanium Processor Family is Intel's 64-bit successor to
diff --git a/arch/m32r/Kconfig b/arch/m32r/Kconfig
index 49326e9..b93897d 100644
--- a/arch/m32r/Kconfig
+++ b/arch/m32r/Kconfig
@@ -8,6 +8,7 @@ mainmenu "Linux/M32R Kernel Configuration"
 config M32R
 	bool
 	default y
+	select HAVE_OPROFILE
 
 config SBUS
 	bool
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 36a4018..eb8be54 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1,6 +1,7 @@
 config MIPS
 	bool
 	default y
+	select HAVE_OPROFILE
 	# Horrible source of confusion.  Die, die, die ...
 	select EMBEDDED
 	select RTC_LIB
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 2b649c4..e1a2f77 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -7,6 +7,7 @@ mainmenu "Linux/PA-RISC Kernel Configuration"
 
 config PARISC
 	def_bool y
+	select HAVE_OPROFILE
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
 	  in many of their workstations & servers (HP9000 700 and 800 series,
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4a22c99..c3c29e7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -87,6 +87,7 @@ config ARCH_NO_VIRT_TO_BUS
 config PPC
 	bool
 	default y
+	select HAVE_OPROFILE
 
 config EARLY_PRINTK
 	bool
diff --git a/arch/ppc/Kconfig b/arch/ppc/Kconfig
index db5934c..ea9eb48 100644
--- a/arch/ppc/Kconfig
+++ b/arch/ppc/Kconfig
@@ -42,6 +42,7 @@ config GENERIC_CALIBRATE_DELAY
 config PPC
 	bool
 	default y
+	select HAVE_OPROFILE
 
 config PPC32
 	bool
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 6ef54d2..c561f6f 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -51,6 +51,7 @@ mainmenu "Linux Kernel Configuration"
 
 config S390
 	def_bool y
+	select HAVE_OPROFILE
 
 source "init/Kconfig"
 
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index b30c4c3..f868691 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -8,6 +8,7 @@ mainmenu "Linux/SuperH Kernel Configuration"
 config SUPERH
 	def_bool y
 	select EMBEDDED
+	select HAVE_OPROFILE
 	help
 	  The SuperH is a RISC processor targeted for use in embedded systems
 	  and consumer electronics; it was also used in the Sega Dreamcast
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 527adc8..3d9bc2f 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -63,6 +63,7 @@ config NR_CPUS
 config SPARC
 	bool
 	default y
+	select HAVE_OPROFILE
 
 # Identify this as a Sparc32 build
 config SPARC32
diff --git a/arch/sparc64/Kconfig b/arch/sparc64/Kconfig
index 158522f..ca14d88 100644
--- a/arch/sparc64/Kconfig
+++ b/arch/sparc64/Kconfig
@@ -8,6 +8,7 @@ mainmenu "Linux/UltraSPARC Kernel Configuration"
 config SPARC
 	bool
 	default y
+	select HAVE_OPROFILE
 
 config SPARC64
 	bool
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7109037..6559488 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -18,6 +18,7 @@ config X86_64
 ### Arch settings
 config X86
 	def_bool y
+	select HAVE_OPROFILE
 
 config GENERIC_LOCKBREAK
 	def_bool n
@@ -106,10 +107,6 @@ config GENERIC_TIME_VSYSCALL
 config HAVE_SETUP_PER_CPU_AREA
 	def_bool X86_64
 
-config ARCH_SUPPORTS_OPROFILE
-	bool
-	default y
-
 select HAVE_KVM
 
 config ARCH_HIBERNATION_POSSIBLE
diff --git a/kernel/Kconfig.instrumentation b/kernel/Kconfig.instrumentation
index a00dcb6..d9d010a 100644
--- a/kernel/Kconfig.instrumentation
+++ b/kernel/Kconfig.instrumentation
@@ -21,7 +21,7 @@ config PROFILING
 config OPROFILE
 	tristate "OProfile system profiling (EXPERIMENTAL)"
 	depends on PROFILING && !UML
-	depends on ARCH_SUPPORTS_OPROFILE || ALPHA || ARM || BLACKFIN || IA64 || M32R || PARISC || PPC || S390 || SUPERH || SPARC
+	depends on HAVE_OPROFILE
 	help
 	  OProfile is a profiling system capable of profiling the
 	  whole system, include the kernel, kernel modules, libraries,
@@ -29,6 +29,9 @@ config OPROFILE
 
 	  If unsure, say N.
 
+config HAVE_OPROFILE
+	def_bool n
+
 config KPROBES
 	bool "Kprobes"
 	depends on KALLSYMS && MODULES && !UML
-- 
1.5.4.rc3.14.g44397

