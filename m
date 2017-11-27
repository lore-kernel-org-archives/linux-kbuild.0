Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:35216 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752493AbdK0Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:32 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 20/21] Kbuild, lto: Add Link Time Optimization support
Date: Mon, 27 Nov 2017 13:34:22 -0800
Message-Id: <20171127213423.27218-21-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

With LTO gcc will do whole program optimizations for
the whole kernel and each module. This increases compile time,
and makes incremential builds slower, but can generate faster and
smaller code and allows the compiler to do some global checking.

gcc can complain now about type mismatches for symbols between
different files.

The main advantage is that it allows cross file inlining, which
enables a range of new optimizations. It also allows the compiler
to throw away unused functions, which typically shrinks the kernel
somewhat.

It also enables a range of advanced and future optimizations
in the compiler.

Unlike earlier, this version doesn't require special
binutils, but relies on THIN_ARCHIVES instead.

This adds the basic Kbuild plumbing for LTO:

- In Kbuild add a new scripts/Makefile.lto that checks
the tool chain and when the tests pass sets the LTO options
We enable it only for gcc 5.0+ and reasonable new binutils

- Add a new LDFINAL variable that controls the final link
for vmlinux or module. In this case we call gcc-ld instead
of ld, to run the LTO step.

- Kconfigs:
Since LTO with allyesconfig needs more than 4G of memory (~8G)
and has the potential to makes people's system swap to death.
Smaller configs typically work with 4G.
I used a nested config that ensures that a simple
allyesconfig disables LTO. It has to be explicitely
enabled.

- This version runs modpost on the LTO object files.
This currently breaks MODVERSIONS and causes some warnings
and requires disabling the module resolution checks.
MODVERSIONS is excluded with LTO here. Solution would be to
reorganize the linking step to do a LDFINAL -r link
on all modules before running modpost

- Since this kernel version links the final kernel two-three
times for kallsyms all optimization steps are done multiple
times.

Thanks to HJ Lu, Joe Mario, Honza Hubicka, Richard Guenther,
Don Zickus, Changlong Xie, Gleb Schukin who helped with this project
(and probably some more who I forgot, sorry)

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 Documentation/lto-build  | 76 ++++++++++++++++++++++++++++++++++++++
 Makefile                 |  6 ++-
 init/Kconfig             | 68 ++++++++++++++++++++++++++++++++++
 scripts/Makefile.lto     | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.modpost |  7 ++--
 scripts/gcc-ld           |  4 +-
 scripts/link-vmlinux.sh  |  6 +--
 7 files changed, 252 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/lto-build
 create mode 100644 scripts/Makefile.lto

diff --git a/Documentation/lto-build b/Documentation/lto-build
new file mode 100644
index 000000000000..f33f008b23db
--- /dev/null
+++ b/Documentation/lto-build
@@ -0,0 +1,76 @@
+Link time optimization (LTO) for the Linux kernel
+
+This is an experimental feature.
+
+Link Time Optimization allows the compiler to optimize the complete program
+instead of just each file.
+
+The compiler can inline functions between files and do various other global
+optimizations, like specializing functions for common parameters,
+determing when global variables are clobbered, making functions pure/const,
+propagating constants globally, removing unneeded data and others.
+
+It will also drop unused functions which can make the kernel
+image smaller in some circumstances, in particular for small kernel
+configurations.
+
+For small monolithic kernels it can throw away unused code very effectively
+(especially when modules are disabled) and usually shrinks
+the code size.
+
+Build time and memory consumption at build time will increase, depending
+on the size of the largest binary. Modular kernels are less affected.
+With LTO incremental builds are less incremental, as always the whole
+binary needs to be re-optimized (but not re-parsed)
+
+Oops can be somewhat more difficult to read, due to the more aggressive
+inlining (it helps to use scripts/faddr2line)
+
+Normal "reasonable" builds work with less than 4GB of RAM, but very large
+configurations like allyesconfig typically need more memory. The actual
+memory needed depends on the available memory (gcc sizes its garbage
+collector pools based on that or on the ulimit -m limits) and
+the compiler version.
+
+Configuration:
+- Enable CONFIG_LTO_MENU and then disable CONFIG_LTO_DISABLE.
+This is mainly to not have allyesconfig default to LTO.
+
+Requirements:
+- Enough memory: 4GB for a standard build, more for allyesconfig
+The peak memory usage happens single threaded (when lto-wpa merges types),
+so dialing back -j options will not help much.
+
+A 32bit compiler is unlikely to work due to the memory requirements.
+You can however build a kernel targeted at 32bit on a 64bit host.
+
+FAQs:
+
+Q: I get a section type attribute conflict
+A: Usually because of someone doing
+const __initdata (should be const __initconst) or const __read_mostly
+(should be just const). Check both symbols reported by gcc.
+
+Q: What's up with .XXXXX numeric post fixes
+A: This is due LTO turning (near) all symbols to static
+Use gcc 4.9, it avoids them in most cases. They are also filtered out
+in kallsyms. There are still some .lto_priv left.
+
+References:
+
+Presentation on Kernel LTO
+(note, performance numbers/details outdated.  In particular gcc 4.9 fixed
+most of the build time problems):
+http://halobates.de/kernel-lto.pdf
+
+Generic gcc LTO:
+http://www.ucw.cz/~hubicka/slides/labs2013.pdf
+http://www.hipeac.net/system/files/barcelona.pdf
+
+Somewhat outdated too:
+http://gcc.gnu.org/projects/lto/lto.pdf
+http://gcc.gnu.org/projects/lto/whopr.pdf
+
+Happy Link-Time-Optimizing!
+
+Andi Kleen
diff --git a/Makefile b/Makefile
index f761bf475ba5..685a638bc3cd 100644
--- a/Makefile
+++ b/Makefile
@@ -370,6 +370,7 @@ HOST_LOADLIBES := $(HOST_LFS_LIBS)
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
 LD		= $(CROSS_COMPILE)ld
+LDFINAL		= $(LD)
 CC		= $(CROSS_COMPILE)gcc
 CPP		= $(CC) -E
 AR		= $(CROSS_COMPILE)ar
@@ -427,7 +428,7 @@ KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
 GCC_PLUGINS_CFLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
+export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES LDFINAL
 export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
@@ -813,6 +814,7 @@ KBUILD_ARFLAGS := $(call ar-option,D)
 include scripts/Makefile.kasan
 include scripts/Makefile.extrawarn
 include scripts/Makefile.ubsan
+include scripts/Makefile.lto
 
 # Add any arch overrides and user supplied CPPFLAGS, AFLAGS and CFLAGS as the
 # last assignments
@@ -986,7 +988,7 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
 cmd_link-vmlinux =                                                 \
-	$(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux) ;    \
+	$(CONFIG_SHELL) $< $(LDFINAL) $(LDFLAGS) $(LDFLAGS_vmlinux) ;    \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 vmlinux: scripts/link-vmlinux.sh vmlinux_prereq $(vmlinux-deps) FORCE
diff --git a/init/Kconfig b/init/Kconfig
index 2934249fba46..36f79d2bbcdb 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1034,6 +1034,73 @@ config CC_OPTIMIZE_FOR_SIZE
 
 endchoice
 
+config ARCH_SUPPORTS_LTO
+	bool
+
+config LTO_MENU
+	bool "Enable gcc link time optimization (LTO)"
+	depends on ARCH_SUPPORTS_LTO
+	help
+	  With this option gcc will do whole program optimizations for
+	  the whole kernel and module. This increases compile time, but can
+	  lead to better code. It allows gcc to inline functions between
+	  different files and do other optimization.  It might also trigger
+	  bugs due to more aggressive optimization. It allows gcc to drop unused
+	  code. On smaller monolithic kernel configurations
+	  it usually leads to smaller kernels, especially when modules
+	  are disabled.
+
+	  With this option gcc will also do some global checking over
+	  different source files. It also disables a number of kernel
+	  features.
+
+	  This option is recommended for release builds. With LTO
+	  the kernel always has to be re-optimized (but not re-parsed)
+	  on each build.
+
+	  This requires a gcc 5.0 or later compiler, or 6.0 or later
+	  if UBSAN is used.
+
+	  On larger configurations this may need more than 4GB of RAM.
+	  It will likely not work on those with a 32bit compiler.
+
+	  When the toolchain support is not available this will (hopefully)
+	  be automatically disabled.
+
+	  For more information see Documentation/lto-build
+
+config LTO_DISABLE
+         bool "Disable LTO again"
+         depends on LTO_MENU
+         default n
+         help
+           This option is merely here so that allyesconfig or allmodconfig do
+           not enable LTO. If you want to actually use LTO do not enable.
+
+config LTO
+	bool
+	default y
+	depends on LTO_MENU && !LTO_DISABLE
+
+config LTO_DEBUG
+	bool "Enable LTO compile time debugging"
+	depends on LTO
+	help
+	  Enable LTO debugging in the compiler. The compiler dumps
+	  some log files that make it easier to figure out LTO
+	  behavior. The log files also allow to reconstruct
+	  the global inlining and a global callgraph.
+	  They however add some (single threaded) cost to the
+	  compilation.  When in doubt do not enable.
+
+config LTO_CP_CLONE
+	bool "Allow aggressive cloning for function specialization"
+	depends on LTO
+	help
+	  Allow the compiler to clone and specialize functions for specific
+	  arguments when it determines these arguments are very commonly
+	  called.  Experimential. Will increase text size.
+
 config SYSCTL
 	bool
 
@@ -1716,6 +1783,7 @@ config MODULE_FORCE_UNLOAD
 
 config MODVERSIONS
 	bool "Module versioning support"
+	depends on !LTO
 	help
 	  Usually, you have to use modules compiled with your kernel.
 	  Saying Y here makes it sometimes possible to use modules
diff --git a/scripts/Makefile.lto b/scripts/Makefile.lto
new file mode 100644
index 000000000000..2d6995ba7d0b
--- /dev/null
+++ b/scripts/Makefile.lto
@@ -0,0 +1,95 @@
+#
+# Support for gcc link time optimization
+#
+
+DISABLE_LTO :=
+LTO_CFLAGS :=
+
+export DISABLE_LTO
+export LTO_CFLAGS
+
+ifdef CONFIG_LTO
+ifdef CONFIG_UBSAN
+ifeq ($(call cc-ifversion,-lt,0600,y),y)
+        # work around compiler asserts due to UBSAN
+        $(warning Disabling LTO for gcc 5.x because UBSAN is active)
+        undefine CONFIG_LTO
+endif
+endif
+endif
+
+ifdef CONFIG_LTO
+# 4.7 works mostly, but it sometimes loses symbols on large builds
+# This can be worked around by marking those symbols visible,
+# but that is fairly ugly and the problem is gone with 4.8
+# 4.8 was very slow
+# 4.9 was missing __attribute__((noreorder)) for ordering initcalls,
+# and needed -fno-toplevel-reorder, which can lead to missing symbols
+# so only support 5.0+
+ifeq ($(call cc-ifversion, -ge, 0500,y),y)
+# is the compiler compiled with LTO?
+ifneq ($(call cc-option,${LTO_CFLAGS},n),n)
+# binutils before 2.27 has various problems with plugins
+ifeq ($(call ld-ifversion,-ge,227000000,y),y)
+
+	LTO_CFLAGS := -flto $(DISABLE_TL_REORDER)
+	LTO_FINAL_CFLAGS := -fuse-linker-plugin
+
+# would be needed to support < 5.0
+#	LTO_FINAL_CFLAGS += -fno-toplevel-reorder
+
+	LTO_FINAL_CFLAGS += -flto=jobserver
+
+	# don't compile everything twice
+	# requires plugin ar
+	LTO_CFLAGS += -fno-fat-lto-objects
+
+	# Used to disable LTO for specific files (e.g. vdso)
+	DISABLE_LTO := -fno-lto
+
+	# shut up lots of warnings for the compat syscalls
+	LTO_CFLAGS += $(call cc-disable-warning,attribute-alias,)
+
+	LTO_FINAL_CFLAGS += ${LTO_CFLAGS} -fwhole-program
+
+	# most options are passed through implicitely in the LTO
+	# files per function, but not all.
+	# should not pass any that may need to be disabled for
+	# individual files.
+	LTO_FINAL_CFLAGS += $(filter -pg,${KBUILD_CFLAGS})
+	LTO_FINAL_CFLAGS += $(filter -fno-strict-aliasing,${KBUILD_CFLAGS})
+
+ifdef CONFIG_LTO_DEBUG
+	LTO_FINAL_CFLAGS += -fdump-ipa-cgraph -fdump-ipa-inline-details
+	# add for debugging compiler crashes:
+	# LTO_FINAL_CFLAGS += -dH -save-temps
+endif
+ifdef CONFIG_LTO_CP_CLONE
+	LTO_FINAL_CFLAGS += -fipa-cp-clone
+	LTO_CFLAGS += -fipa-cp-clone
+endif
+
+	KBUILD_CFLAGS += ${LTO_CFLAGS}
+
+	LDFINAL := ${CONFIG_SHELL} ${srctree}/scripts/gcc-ld \
+                  ${LTO_FINAL_CFLAGS}
+
+	# LTO gcc creates a lot of files in TMPDIR, and with /tmp as tmpfs
+	# it's easy to drive the machine OOM. Use the object directory
+	# instead.
+	TMPDIR ?= $(objtree)
+	export TMPDIR
+
+	# use plugin aware tools
+	AR = $(CROSS_COMPILE)gcc-ar
+	NM = $(CROSS_COMPILE)gcc-nm
+else
+        $(warning WARNING old binutils. LTO disabled)
+endif
+else
+        $(warning "WARNING: Compiler/Linker does not support LTO/WHOPR with linker plugin. CONFIG_LTO disabled.")
+endif
+else
+        $(warning "WARNING: GCC $(call cc-version) too old for LTO/WHOPR. CONFIG_LTO disabled")
+endif
+endif
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index df4174405feb..d1d3b2cfc9ce 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -79,7 +79,8 @@ modpost = scripts/mod/modpost                    \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
- $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
+ $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w) \
+ $(if $(CONFIG_LTO),-w)
 
 MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
@@ -118,9 +119,9 @@ targets += $(modules:.ko=.mod.o)
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Step 6), final link of the modules with optional arch pass after final link
-quiet_cmd_ld_ko_o = LD [M]  $@
+quiet_cmd_ld_ko_o = LDFINAL [M]  $@
       cmd_ld_ko_o =                                                     \
-	$(LD) -r $(LDFLAGS)                                             \
+	$(LDFINAL) -r $(LDFLAGS)                                             \
                  $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)             \
                  -o $@ $(filter-out FORCE,$^) ;                         \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
diff --git a/scripts/gcc-ld b/scripts/gcc-ld
index 997b818c3962..d95dd0be38e7 100755
--- a/scripts/gcc-ld
+++ b/scripts/gcc-ld
@@ -8,7 +8,7 @@ ARGS="-nostdlib"
 
 while [ "$1" != "" ] ; do
 	case "$1" in
-	-save-temps|-m32|-m64) N="$1" ;;
+	-save-temps*|-m32|-m64) N="$1" ;;
 	-r) N="$1" ;;
 	-[Wg]*) N="$1" ;;
 	-[olv]|-[Ofd]*|-nostdlib) N="$1" ;;
@@ -19,7 +19,7 @@ while [ "$1" != "" ] ; do
 -rpath-link|--sort-section|--section-start|-Tbss|-Tdata|-Ttext|\
 --version-script|--dynamic-list|--version-exports-symbol|--wrap|-m)
 		A="$1" ; shift ; N="-Wl,$A,$1" ;;
-	-[m]*) N="$1" ;;
+	-[mp]*) N="$1" ;;
 	-*) N="-Wl,$1" ;;
 	*)  N="$1" ;;
 	esac
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c0d129d7f430..964b2ee855dd 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -84,7 +84,7 @@ modpost_link()
 			${KBUILD_VMLINUX_LIBS}				\
 			--end-group"
 	fi
-	${LD} ${LDFLAGS} -r -o ${1} ${objects}
+	${LDFINAL} ${LDFLAGS} -r -o ${1} ${objects}
 }
 
 # Link of vmlinux
@@ -113,7 +113,7 @@ vmlinux_link()
 				${1}"
 		fi
 
-		${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}		\
+		${LDFINAL} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}		\
 			-T ${lds} ${objects}
 	else
 		if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
@@ -309,7 +309,7 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	fi
 fi
 
-info LD vmlinux
+info LDFINAL vmlinux
 vmlinux_link "${kallsymso}" vmlinux
 
 if [ -n "${CONFIG_BUILDTIME_EXTABLE_SORT}" ]; then
-- 
2.13.6

