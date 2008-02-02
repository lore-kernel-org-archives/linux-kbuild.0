Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:60011 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1764314AbYBBUql (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:41 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] Add HAVE_KPROBES
Date: Sat,  2 Feb 2008 21:46:43 +0100
Message-Id: <1201985204-26589-9-git-send-email-sam@ravnborg.org>
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

        config KPROBES_SUPPORT
                def_bool y

instead, which is a bit denser.

We seem to use both kinds of syntax for these things, but this is really
what "def_bool" is there for...

- Use HAVE_KPROBES
- Use a select

- Yet another update :
Moving to HAVE_* now.

- Update ARM for kprobes support.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/arm/Kconfig               |    1 +
 arch/avr32/Kconfig             |    1 +
 arch/ia64/Kconfig              |    1 +
 arch/powerpc/Kconfig           |    1 +
 arch/ppc/Kconfig               |    1 +
 arch/s390/Kconfig              |    1 +
 arch/sparc64/Kconfig           |    1 +
 arch/x86/Kconfig               |    1 +
 kernel/Kconfig.instrumentation |    5 ++++-
 9 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3b3eb4e..ea45eef 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -11,6 +11,7 @@ config ARM
 	select RTC_LIB
 	select SYS_SUPPORTS_APM_EMULATION
 	select HAVE_OPROFILE
+	select HAVE_KPROBES if (!XIP_KERNEL)
 	help
 	  The ARM series is a line of low-power-consumption RISC chip designs
 	  licensed by ARM Ltd and targeted at embedded applications and
diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
index b46932c..0e56e96 100644
--- a/arch/avr32/Kconfig
+++ b/arch/avr32/Kconfig
@@ -11,6 +11,7 @@ config AVR32
 	# that we usually don't need on AVR32.
 	select EMBEDDED
 	select HAVE_OPROFILE
+	select HAVE_KPROBES
 	help
 	  AVR32 is a high-performance 32-bit RISC microprocessor core,
 	  designed for cost-sensitive embedded applications, with particular
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 5e410f2..8db6324 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -16,6 +16,7 @@ config IA64
 	select PM if (!IA64_HP_SIM)
 	select ARCH_SUPPORTS_MSI
 	select HAVE_OPROFILE
+	select HAVE_KPROBES
 	default y
 	help
 	  The Itanium Processor Family is Intel's 64-bit successor to
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3c29e7..c6f3eb5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -88,6 +88,7 @@ config PPC
 	bool
 	default y
 	select HAVE_OPROFILE
+	select HAVE_KPROBES
 
 config EARLY_PRINTK
 	bool
diff --git a/arch/ppc/Kconfig b/arch/ppc/Kconfig
index ea9eb48..92e37f5 100644
--- a/arch/ppc/Kconfig
+++ b/arch/ppc/Kconfig
@@ -43,6 +43,7 @@ config PPC
 	bool
 	default y
 	select HAVE_OPROFILE
+	select HAVE_KPROBES
 
 config PPC32
 	bool
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index c561f6f..272c6c8 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -52,6 +52,7 @@ mainmenu "Linux Kernel Configuration"
 config S390
 	def_bool y
 	select HAVE_OPROFILE
+	select HAVE_KPROBES
 
 source "init/Kconfig"
 
diff --git a/arch/sparc64/Kconfig b/arch/sparc64/Kconfig
index ca14d88..cbdc80d 100644
--- a/arch/sparc64/Kconfig
+++ b/arch/sparc64/Kconfig
@@ -9,6 +9,7 @@ config SPARC
 	bool
 	default y
 	select HAVE_OPROFILE
+	select HAVE_KPROBES
 
 config SPARC64
 	bool
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 6559488..72db31c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -19,6 +19,7 @@ config X86_64
 config X86
 	def_bool y
 	select HAVE_OPROFILE
+	select HAVE_KPROBES
 
 config GENERIC_LOCKBREAK
 	def_bool n
diff --git a/kernel/Kconfig.instrumentation b/kernel/Kconfig.instrumentation
index d9d010a..2195b65 100644
--- a/kernel/Kconfig.instrumentation
+++ b/kernel/Kconfig.instrumentation
@@ -35,7 +35,7 @@ config HAVE_OPROFILE
 config KPROBES
 	bool "Kprobes"
 	depends on KALLSYMS && MODULES && !UML
-	depends on X86_32 || IA64 || PPC || S390 || SPARC64 || X86_64 || AVR32 || (ARM && !XIP_KERNEL)
+	depends on HAVE_KPROBES
 	help
 	  Kprobes allows you to trap at almost any kernel address and
 	  execute a callback function.  register_kprobe() establishes
@@ -43,6 +43,9 @@ config KPROBES
 	  for kernel debugging, non-intrusive instrumentation and testing.
 	  If in doubt, say "N".
 
+config HAVE_KPROBES
+	def_bool n
+
 config MARKERS
 	bool "Activate markers"
 	help
-- 
1.5.4.rc3.14.g44397

