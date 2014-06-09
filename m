Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:59207 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752000AbaFIMb5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 08:31:57 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: rename CONFIG_SHELL to KBUILD_SHELL
Date: Mon,  9 Jun 2014 21:31:22 +0900
Message-Id: <1402317082-21184-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>

All the macros with CONFIG_ prefix are supposed to be defined
in Kconfig. But CONFIG_SHELL is defined in the top Makefile,
violating the namespace rule.

Is is impossible to move CONFIG_SHELL definition to Kconfig.
Configuration rules depend on "outputmakefile" rule where
CONFIG_SHELL is already used.
(Kbuild has to know which shell to use before invoking "make config".)

So, it seems better to rename CONFIG_SHELL.
Because "SHELL" is a special variable for GNU make, we should not
use it. It looks like "KBUILD_SHELL" is a good choice.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>
---
 Kbuild                       |  2 +-
 Makefile                     | 26 +++++++++++++-------------
 arch/arm/boot/Makefile       | 10 +++++-----
 arch/arm64/boot/Makefile     |  4 ++--
 arch/parisc/Makefile         |  4 ++--
 arch/powerpc/boot/Makefile   |  2 +-
 arch/powerpc/kernel/Makefile |  4 ++--
 arch/x86/Makefile            |  4 ++--
 arch/x86/kernel/cpu/Makefile |  2 +-
 arch/x86/syscalls/Makefile   |  4 ++--
 init/Makefile                |  2 +-
 scripts/Kbuild.include       |  4 ++--
 scripts/Makefile.build       |  2 +-
 scripts/Makefile.headersinst |  6 +++---
 scripts/Makefile.lib         |  2 +-
 scripts/kconfig/Makefile     |  8 ++++----
 scripts/link-vmlinux.sh      |  2 +-
 scripts/package/Makefile     | 14 +++++++-------
 usr/Makefile                 |  2 +-
 19 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/Kbuild b/Kbuild
index b8b708a..5d7c729 100644
--- a/Kbuild
+++ b/Kbuild
@@ -92,7 +92,7 @@ always += missing-syscalls
 targets += missing-syscalls
 
 quiet_cmd_syscalls = CALL    $<
-      cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)
+      cmd_syscalls = $(KBUILD_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)
 
 missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
 	$(call cmd,syscalls)
diff --git a/Makefile b/Makefile
index 084a58b0..f691dc2 100644
--- a/Makefile
+++ b/Makefile
@@ -235,7 +235,7 @@ KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
 
 # SHELL used by kbuild
-CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+KBUILD_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
 	  else echo sh; fi ; fi)
 
@@ -404,7 +404,7 @@ KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
 
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
-export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
+export ARCH SRCARCH KBUILD_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP
 export MAKE AWK GENKSYMS INSTALLKERNEL PERL UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
@@ -448,7 +448,7 @@ PHONY += outputmakefile
 outputmakefile:
 ifneq ($(KBUILD_SRC),)
 	$(Q)ln -fsn $(srctree) source
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile \
+	$(Q)$(KBUILD_SHELL) $(srctree)/scripts/mkmakefile \
 	    $(srctree) $(objtree) $(VERSION) $(PATCHLEVEL)
 endif
 
@@ -728,7 +728,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
 KBUILD_ARFLAGS := $(call ar-option,D)
 
 # check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
+ifeq ($(shell $(KBUILD_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
 endif
 
@@ -849,7 +849,7 @@ export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Doc
 vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_INIT) $(KBUILD_VMLINUX_MAIN)
 
 # Final link of vmlinux
-      cmd_link-vmlinux = $(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux)
+      cmd_link-vmlinux = $(KBUILD_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux)
 quiet_cmd_link-vmlinux = LINK    $@
 
 # Include targets which we want to
@@ -881,7 +881,7 @@ $(vmlinux-dirs): prepare scripts
 	$(Q)$(MAKE) $(build)=$@
 
 define filechk_kernel.release
-	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
+	echo "$(KERNELVERSION)$$($(KBUILD_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
 endef
 
 # Store (new) KERNELRELEASE string in include/config/kernel.release
@@ -997,7 +997,7 @@ __headers: $(version_h) scripts_basic asm-generic archheaders archscripts FORCE
 
 PHONY += headers_install_all
 headers_install_all:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/headers.sh install
+	$(Q)$(KBUILD_SHELL) $(srctree)/scripts/headers.sh install
 
 PHONY += headers_install
 headers_install: __headers
@@ -1008,7 +1008,7 @@ headers_install: __headers
 
 PHONY += headers_check_all
 headers_check_all: headers_install_all
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/headers.sh check
+	$(Q)$(KBUILD_SHELL) $(srctree)/scripts/headers.sh check
 
 PHONY += headers_check
 headers_check: headers_install
@@ -1125,7 +1125,7 @@ $(clean-dirs):
 	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
 
 vmlinuxclean:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
+	$(Q)$(KBUILD_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 
 clean: archclean vmlinuxclean
 
@@ -1367,7 +1367,7 @@ clean: $(clean-dirs)
 # Generate tags for editors
 # ---------------------------------------------------------------------------
 quiet_cmd_tags = GEN     $@
-      cmd_tags = $(CONFIG_SHELL) $(srctree)/scripts/tags.sh $@
+      cmd_tags = $(KBUILD_SHELL) $(srctree)/scripts/tags.sh $@
 
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
@@ -1388,7 +1388,7 @@ versioncheck:
 		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
 
 coccicheck:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/$@
+	$(Q)$(KBUILD_SHELL) $(srctree)/scripts/$@
 
 namespacecheck:
 	$(PERL) $(srctree)/scripts/namespace.pl
@@ -1415,7 +1415,7 @@ checkstack:
 	$(PERL) $(src)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
 
 kernelrelease:
-	@echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
+	@echo "$(KERNELVERSION)$$($(KBUILD_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
 
 kernelversion:
 	@echo $(KERNELVERSION)
@@ -1492,7 +1492,7 @@ quiet_cmd_rmfiles = $(if $(wildcard $(rm-files)),CLEAN   $(wildcard $(rm-files))
 
 # Run depmod only if we have System.map and depmod is executable
 quiet_cmd_depmod = DEPMOD  $(KERNELRELEASE)
-      cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
+      cmd_depmod = $(KBUILD_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
                    $(KERNELRELEASE) "$(patsubst y,_,$(CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX))"
 
 # Create temporary dir for module support files
diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index ec2f806..5239c23 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -96,23 +96,23 @@ initrd:
 	(echo You must specify INITRD; exit -1)
 
 install:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
+	$(KBUILD_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
 	$(obj)/Image System.map "$(INSTALL_PATH)"
 
 zinstall:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
+	$(KBUILD_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
 	$(obj)/zImage System.map "$(INSTALL_PATH)"
 
 uinstall:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
+	$(KBUILD_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
 	$(obj)/uImage System.map "$(INSTALL_PATH)"
 
 zi:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
+	$(KBUILD_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
 	$(obj)/zImage System.map "$(INSTALL_PATH)"
 
 i:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
+	$(KBUILD_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
 	$(obj)/Image System.map "$(INSTALL_PATH)"
 
 subdir-	    := bootp compressed dts
diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index 5a0e3ab..7e92e96 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -23,9 +23,9 @@ $(obj)/Image.gz: $(obj)/Image FORCE
 	$(call if_changed,gzip)
 
 install: $(obj)/Image
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(KBUILD_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
 	$(obj)/Image System.map "$(INSTALL_PATH)"
 
 zinstall: $(obj)/Image.gz
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(KBUILD_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
 	$(obj)/Image.gz System.map "$(INSTALL_PATH)"
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 7187664..11fa1d0 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -121,10 +121,10 @@ vmlinuz: vmlinux
 	@gzip -cf -9 $< > $@
 
 install:
-	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
+	$(KBUILD_SHELL) $(src)/arch/parisc/install.sh \
 			$(KERNELRELEASE) vmlinux System.map "$(INSTALL_PATH)"
 zinstall:
-	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
+	$(KBUILD_SHELL) $(src)/arch/parisc/install.sh \
 			$(KERNELRELEASE) vmlinuz System.map "$(INSTALL_PATH)"
 
 CLEAN_FILES	+= lifimage
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index a1f8c7f..4f13565 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -190,7 +190,7 @@ endif
 
 # args (to if_changed): 1 = (this rule), 2 = platform, 3 = dts 4=dtb 5=initrd
 quiet_cmd_wrap	= WRAP    $@
-      cmd_wrap	=$(CONFIG_SHELL) $(wrapper) -c -o $@ -p $2 $(CROSSWRAP) \
+      cmd_wrap	=$(KBUILD_SHELL) $(wrapper) -c -o $@ -p $2 $(CROSSWRAP) \
 		$(if $3, -s $3)$(if $4, -d $4)$(if $5, -i $5) vmlinux
 
 image-$(CONFIG_PPC_PSERIES)		+= zImage.pseries
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index fab19ec..b1e5776 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -149,7 +149,7 @@ extra-y				+= systbl_chk.i
 $(obj)/systbl.o:		systbl_chk
 
 quiet_cmd_systbl_chk = CALL    $<
-      cmd_systbl_chk = $(CONFIG_SHELL) $< $(obj)/systbl_chk.i
+      cmd_systbl_chk = $(KBUILD_SHELL) $< $(obj)/systbl_chk.i
 
 PHONY += systbl_chk
 systbl_chk: $(src)/systbl_chk.sh $(obj)/systbl_chk.i
@@ -159,7 +159,7 @@ ifeq ($(CONFIG_PPC_OF_BOOT_TRAMPOLINE),y)
 $(obj)/built-in.o:		prom_init_check
 
 quiet_cmd_prom_init_check = CALL    $<
-      cmd_prom_init_check = $(CONFIG_SHELL) $< "$(NM)" "$(obj)/prom_init.o"
+      cmd_prom_init_check = $(KBUILD_SHELL) $< "$(NM)" "$(obj)/prom_init.o"
 
 PHONY += prom_init_check
 prom_init_check: $(src)/prom_init_check.sh $(obj)/prom_init.o
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 33f71b0..cd30bfe 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -117,7 +117,7 @@ endif
 # Make sure compiler does not have buggy stack-protector support.
 ifdef CONFIG_CC_STACKPROTECTOR
 	cc_has_sp := $(srctree)/scripts/gcc-x86_$(BITS)-has-stack-protector.sh
-        ifneq ($(shell $(CONFIG_SHELL) $(cc_has_sp) $(CC) $(KBUILD_CPPFLAGS) $(biarch)),y)
+        ifneq ($(shell $(KBUILD_SHELL) $(cc_has_sp) $(CC) $(KBUILD_CPPFLAGS) $(biarch)),y)
                 $(warning stack-protector enabled but compiler support broken)
         endif
 endif
@@ -253,7 +253,7 @@ archclean:
 PHONY += kvmconfig
 kvmconfig:
 	$(if $(wildcard $(objtree)/.config),, $(error You need an existing .config for this target))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m -O $(objtree) $(objtree)/.config $(srctree)/arch/x86/configs/kvm_guest.config
+	$(Q)$(KBUILD_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m -O $(objtree) $(objtree)/.config $(srctree)/arch/x86/configs/kvm_guest.config
 	$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
 
 define archhelp
diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index 7fd54f0..3b2bb8e 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -49,7 +49,7 @@ obj-$(CONFIG_X86_LOCAL_APIC)		+= perfctr-watchdog.o perf_event_amd_ibs.o
 obj-$(CONFIG_HYPERVISOR_GUEST)		+= vmware.o hypervisor.o mshyperv.o
 
 quiet_cmd_mkcapflags = MKCAP   $@
-      cmd_mkcapflags = $(CONFIG_SHELL) $(srctree)/$(src)/mkcapflags.sh $< $@
+      cmd_mkcapflags = $(KBUILD_SHELL) $(srctree)/$(src)/mkcapflags.sh $< $@
 
 cpufeature = $(src)/../../include/asm/cpufeature.h
 
diff --git a/arch/x86/syscalls/Makefile b/arch/x86/syscalls/Makefile
index 3323c27..a308324 100644
--- a/arch/x86/syscalls/Makefile
+++ b/arch/x86/syscalls/Makefile
@@ -12,12 +12,12 @@ syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@' \
+      cmd_syshdr = $(KBUILD_SHELL) '$(syshdr)' '$<' '$@' \
 		   '$(syshdr_abi_$(basetarget))' \
 		   '$(syshdr_pfx_$(basetarget))' \
 		   '$(syshdr_offset_$(basetarget))'
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' $< $@
+      cmd_systbl = $(KBUILD_SHELL) '$(systbl)' $< $@
 
 syshdr_abi_unistd_32 := i386
 $(uapi)/unistd_32.h: $(syscall32) $(syshdr)
diff --git a/init/Makefile b/init/Makefile
index 7bc47ee..609ddb4 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -32,5 +32,5 @@ $(obj)/version.o: include/generated/compile.h
 silent_chk_compile.h = :
 include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@ \
+	$(Q)$(KBUILD_SHELL) $(srctree)/scripts/mkcompile_h $@ \
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)" "$(CC) $(KBUILD_CFLAGS)"
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 122f95c..f027a0f 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -130,11 +130,11 @@ cc-disable-warning = $(call try-run,\
 
 # cc-version
 # Usage gcc-ver := $(call cc-version)
-cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
+cc-version = $(shell $(KBUILD_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
 
 # cc-fullversion
 # Usage gcc-ver := $(call cc-fullversion)
-cc-fullversion = $(shell $(CONFIG_SHELL) \
+cc-fullversion = $(shell $(KBUILD_SHELL) \
 	$(srctree)/scripts/gcc-version.sh -p $(CC))
 
 # cc-ifversion
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index bf3e677..c65ebc0 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -266,7 +266,7 @@ $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
-		     $(CONFIG_SHELL) $(srctree)/scripts/makelst $*.o \
+		     $(KBUILD_SHELL) $(srctree)/scripts/makelst $*.o \
 				     System.map $(OBJDUMP) > $@
 
 $(obj)/%.lst: $(src)/%.c FORCE
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 8ccf830..347df44 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -78,9 +78,9 @@ printdir = $(patsubst $(INSTALL_HDR_PATH)/%/,%,$(dir $@))
 quiet_cmd_install = INSTALL $(printdir) ($(words $(all-files))\
                             file$(if $(word 2, $(all-files)),s))
       cmd_install = \
-        $(CONFIG_SHELL) $< $(installdir) $(srcdir) $(input-files1-name); \
-        $(CONFIG_SHELL) $< $(installdir) $(oldsrcdir) $(input-files2-name); \
-        $(CONFIG_SHELL) $< $(installdir) $(gendir) $(input-files3-name); \
+        $(KBUILD_SHELL) $< $(installdir) $(srcdir) $(input-files1-name); \
+        $(KBUILD_SHELL) $< $(installdir) $(oldsrcdir) $(input-files2-name); \
+        $(KBUILD_SHELL) $< $(installdir) $(gendir) $(input-files3-name); \
         for F in $(wrapper-files); do                                   \
                 echo "\#include <asm-generic/$$F>" > $(installdir)/$$F;    \
         done;                                                           \
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 260bf8a..51beef7 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -347,7 +347,7 @@ UIMAGE_IN ?= $<
 UIMAGE_OUT ?= $@
 
 quiet_cmd_uimage = UIMAGE  $(UIMAGE_OUT)
-      cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
+      cmd_uimage = $(KBUILD_SHELL) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
 			-C $(UIMAGE_COMPRESSION) $(UIMAGE_OPTS-y) \
 			-T $(UIMAGE_TYPE) \
 			-a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 9c4d241..108d819 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -130,7 +130,7 @@ check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
 
 # Use recursively expanded variables so we do not call gcc unless
 # we really need to do so. (Do not call gcc as part of make mrproper)
-HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
+HOST_EXTRACFLAGS += $(shell $(KBUILD_SHELL) $(check-lxdialog) -ccflags) \
                     -DLOCALE
 
 # ===========================================================================
@@ -196,12 +196,12 @@ clean-files     += config.pot linux.pot
 PHONY += $(obj)/dochecklxdialog
 $(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
 $(obj)/dochecklxdialog:
-	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTLOADLIBES_mconf)
+	$(Q)$(KBUILD_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTLOADLIBES_mconf)
 
 always := dochecklxdialog
 
 # Add environment specific flags
-HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
+HOST_EXTRACFLAGS += $(shell $(KBUILD_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
 
 # generated files seem to need this to find local include files
 HOSTCFLAGS_zconf.lex.o	:= -I$(src)
@@ -217,7 +217,7 @@ HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
 HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
                           -Wno-missing-prototypes
 
-HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
+HOSTLOADLIBES_mconf   = $(shell $(KBUILD_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
 HOSTLOADLIBES_nconf	= $(shell \
 				pkg-config --libs menu panel ncurses 2>/dev/null \
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 86a4fe7..0a2adc6 100644
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -102,7 +102,7 @@ kallsyms()
 # See mksymap for additional details
 mksysmap()
 {
-	${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2}
+	${KBUILD_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2}
 }
 
 sortextable()
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 99ca6e7..17190df 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -44,12 +44,12 @@ rpm-pkg rpm: FORCE
 	fi
 	$(MAKE) clean
 	ln -sf $(srctree) $(KERNELPATH)
-	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
-	$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion
+	$(KBUILD_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
+	$(KBUILD_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion
 	tar -cz $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(TAR_CONTENT)
 	rm $(KERNELPATH)
 	rm -f $(objtree)/.scmversion
-	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
+	$(KBUILD_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 	$(RPM) $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
 	rm $(KERNELPATH).tar.gz kernel.spec
@@ -58,8 +58,8 @@ rpm-pkg rpm: FORCE
 # ---------------------------------------------------------------------------
 binrpm-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
-	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
+	$(KBUILD_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
+	$(KBUILD_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
 	$(RPM) $(RPMOPTS) --define "_builddir $(objtree)" --target \
@@ -83,7 +83,7 @@ quiet_cmd_builddeb = BUILDDEB
 		false; \
 	} && \
 	\
-	$$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
+	$$KBUILD_PKG_ROOTCMD $(KBUILD_SHELL) \
 		$(srctree)/scripts/package/builddeb
 
 deb-pkg: FORCE
@@ -97,7 +97,7 @@ clean-dirs += $(objtree)/debian/
 # ---------------------------------------------------------------------------
 tar%pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
+	$(KBUILD_SHELL) $(srctree)/scripts/package/buildtar $@
 
 clean-dirs += $(objtree)/tar-install/
 
diff --git a/usr/Makefile b/usr/Makefile
index e767f01..1667f59 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -38,7 +38,7 @@ $(obj)/initramfs_data.o: $(obj)/initramfs_data.cpio$(suffix_y) FORCE
 # Generate the initramfs cpio archive
 
 hostprogs-y := gen_init_cpio
-initramfs   := $(CONFIG_SHELL) $(srctree)/scripts/gen_initramfs_list.sh
+initramfs   := $(KBUILD_SHELL) $(srctree)/scripts/gen_initramfs_list.sh
 ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
 			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
 ramfs-args  := \
-- 
1.9.1

