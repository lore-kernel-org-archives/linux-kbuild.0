Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:43767 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751049AbeBJOZX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Feb 2018 09:25:23 -0500
Received: by mail-pf0-f193.google.com with SMTP id b62so2408462pfk.10
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Feb 2018 06:25:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] kbuild: rename built-in.o to built-in.a
Date: Sun, 11 Feb 2018 00:25:04 +1000
Message-Id: <20180210142504.29890-3-npiggin@gmail.com>
In-Reply-To: <20180210142504.29890-1-npiggin@gmail.com>
References: <20180210142504.29890-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

Incremental linking is gone, so rename built-in.o to built-in.a, which
is the usual extension for archive files.

This patch does two things, first is a simple search/replace:

git grep -l 'built-in\.o' | xargs sed -i 's/built-in\.o/built-in\.a/g'

The second is to invert nesting of nested text manipulations to avoid
filtering built-in.a out from libs-y2:

-libs-y2 := $(filter-out %.a, $(patsubst %/, %/built-in.a, $(libs-y)))
+libs-y2 := $(patsubst %/, %/built-in.a, $(filter-out %.a, $(libs-y)))

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/kbuild/makefiles.txt | 16 ++++++++--------
 Documentation/process/changes.rst  |  2 +-
 Makefile                           | 14 +++++++-------
 arch/blackfin/kernel/bfin_ksyms.c  |  2 +-
 arch/powerpc/kernel/Makefile       |  2 +-
 drivers/s390/Makefile              |  2 +-
 lib/Kconfig.debug                  |  4 ++--
 scripts/Makefile.build             | 10 +++++-----
 scripts/Makefile.lib               |  6 +++---
 scripts/link-vmlinux.sh            | 20 ++++++++++----------
 scripts/namespace.pl               |  2 +-
 usr/initramfs_data.S               |  2 +-
 12 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 750aea9edd35..667cd899ada8 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -153,18 +153,18 @@ more details, with real examples.
 	configuration.
 
 	Kbuild compiles all the $(obj-y) files.  It then calls
-	"$(AR) rcSTP" to merge these files into one built-in.o file.
+	"$(AR) rcSTP" to merge these files into one built-in.a file.
 	This is a thin archive without a symbol table, which makes it
 	unsuitable as a linker input.
 
 	The scripts/link-vmlinux.sh script later makes an aggregate
-	built-in.o with "${AR} rcsTP", which creates the thin archive
+	built-in.a with "${AR} rcsTP", which creates the thin archive
 	with a symbol table and an index, making it a valid input for
 	the final vmlinux link passes.
 
 	The order of files in $(obj-y) is significant.  Duplicates in
 	the lists are allowed: the first instance will be linked into
-	built-in.o and succeeding instances will be ignored.
+	built-in.a and succeeding instances will be ignored.
 
 	Link order is significant, because certain functions
 	(module_init() / __initcall) will be called during boot in the
@@ -228,7 +228,7 @@ more details, with real examples.
 	Note: Of course, when you are building objects into the kernel,
 	the syntax above will also work. So, if you have CONFIG_EXT2_FS=y,
 	kbuild will build an ext2.o file for you out of the individual
-	parts and then link this into built-in.o, as you would expect.
+	parts and then link this into built-in.a, as you would expect.
 
 --- 3.4 Objects which export symbols
 
@@ -238,7 +238,7 @@ more details, with real examples.
 --- 3.5 Library file goals - lib-y
 
 	Objects listed with obj-* are used for modules, or
-	combined in a built-in.o for that specific directory.
+	combined in a built-in.a for that specific directory.
 	There is also the possibility to list objects that will
 	be included in a library, lib.a.
 	All objects listed with lib-y are combined in a single
@@ -250,7 +250,7 @@ more details, with real examples.
 
 	Note that the same kbuild makefile may list files to be built-in
 	and to be part of a library. Therefore the same directory
-	may contain both a built-in.o and a lib.a file.
+	may contain both a built-in.a and a lib.a file.
 
 	Example:
 		#arch/x86/lib/Makefile
@@ -992,7 +992,7 @@ When kbuild executes, the following steps are followed (roughly):
 
 	$(head-y) lists objects to be linked first in vmlinux.
 	$(libs-y) lists directories where a lib.a archive can be located.
-	The rest list directories where a built-in.o object file can be
+	The rest list directories where a built-in.a object file can be
 	located.
 
 	$(init-y) objects will be located after $(head-y).
@@ -1077,7 +1077,7 @@ When kbuild executes, the following steps are followed (roughly):
 		extra-y := head.o init_task.o
 
 	In this example, extra-y is used to list object files that
-	shall be built, but shall not be linked as part of built-in.o.
+	shall be built, but shall not be linked as part of built-in.a.
 
 
 --- 6.7 Commands useful for building a boot image
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 81cdb528ad46..4f19a9725f76 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -78,7 +78,7 @@ Binutils
 --------
 
 The build system has, as of 4.13, switched to using thin archives (`ar T`)
-rather than incremental linking (`ld -r`) for built-in.o intermediate steps.
+rather than incremental linking (`ld -r`) for built-in.a intermediate steps.
 This requires binutils 2.20 or newer.
 
 Flex
diff --git a/Makefile b/Makefile
index cd9145c0878d..174ec0addf92 100644
--- a/Makefile
+++ b/Makefile
@@ -35,7 +35,7 @@ unexport GREP_OPTIONS
 # Most importantly: sub-Makefiles should only ever modify files in
 # their own directory. If in some directory we have a dependency on
 # a file in another dir (which doesn't happen often, but it's often
-# unavoidable when linking the built-in.o targets which finally
+# unavoidable when linking the built-in.a targets which finally
 # turn into vmlinux), we will call a sub make in that other dir, and
 # after that we are sure that everything which is in that other dir
 # is now up to date.
@@ -979,13 +979,13 @@ vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 vmlinux-alldirs	:= $(sort $(vmlinux-dirs) $(patsubst %/,%,$(filter %/, \
 		     $(init-) $(core-) $(drivers-) $(net-) $(libs-) $(virt-))))
 
-init-y		:= $(patsubst %/, %/built-in.o, $(init-y))
-core-y		:= $(patsubst %/, %/built-in.o, $(core-y))
-drivers-y	:= $(patsubst %/, %/built-in.o, $(drivers-y))
-net-y		:= $(patsubst %/, %/built-in.o, $(net-y))
+init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
+core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
+drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
+net-y		:= $(patsubst %/, %/built-in.a, $(net-y))
 libs-y1		:= $(patsubst %/, %/lib.a, $(libs-y))
-libs-y2		:= $(filter-out %.a, $(patsubst %/, %/built-in.o, $(libs-y)))
-virt-y		:= $(patsubst %/, %/built-in.o, $(virt-y))
+libs-y2		:= $(patsubst %/, %/built-in.a, $(filter-out %.a, $(libs-y)))
+virt-y		:= $(patsubst %/, %/built-in.a, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
 export KBUILD_VMLINUX_INIT := $(head-y) $(init-y)
diff --git a/arch/blackfin/kernel/bfin_ksyms.c b/arch/blackfin/kernel/bfin_ksyms.c
index 68096e8f787f..c0038eeb9e29 100644
--- a/arch/blackfin/kernel/bfin_ksyms.c
+++ b/arch/blackfin/kernel/bfin_ksyms.c
@@ -36,7 +36,7 @@ EXPORT_SYMBOL(memchr);
 /*
  * Because string functions are both inline and exported functions and
  * folder arch/blackfin/lib is configured as a library path in Makefile,
- * symbols exported in folder lib  is not linked into built-in.o but
+ * symbols exported in folder lib  is not linked into built-in.a but
  * inlined only. In order to export string symbols to kernel module
  * properly, they should be exported here.
  */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 1b6bc7fba996..2358f97d62ec 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -165,7 +165,7 @@ systbl_chk: $(src)/systbl_chk.sh $(obj)/systbl_chk.i
 	$(call cmd,systbl_chk)
 
 ifeq ($(CONFIG_PPC_OF_BOOT_TRAMPOLINE),y)
-$(obj)/built-in.o:		prom_init_check
+$(obj)/built-in.a:		prom_init_check
 
 quiet_cmd_prom_init_check = CALL    $<
       cmd_prom_init_check = $(CONFIG_SHELL) $< "$(NM)" "$(obj)/prom_init.o"
diff --git a/drivers/s390/Makefile b/drivers/s390/Makefile
index 2fdab400c1fe..a863b0462b43 100644
--- a/drivers/s390/Makefile
+++ b/drivers/s390/Makefile
@@ -5,5 +5,5 @@
 
 obj-y += cio/ block/ char/ crypto/ net/ scsi/ virtio/
 
-drivers-y += drivers/s390/built-in.o
+drivers-y += drivers/s390/built-in.a
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6088408ef26c..7c66b7152578 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -324,11 +324,11 @@ config DEBUG_SECTION_MISMATCH
 	    the analysis would not catch the illegal reference.
 	    This option tells gcc to inline less (but it does result in
 	    a larger kernel).
-	  - Run the section mismatch analysis for each module/built-in.o file.
+	  - Run the section mismatch analysis for each module/built-in.a file.
 	    When we run the section mismatch analysis on vmlinux.o, we
 	    lose valuable information about where the mismatch was
 	    introduced.
-	    Running the analysis for each module/built-in.o file
+	    Running the analysis for each module/built-in.a file
 	    tells where the mismatch happens much closer to the
 	    source. The drawback is that the same mismatch is
 	    reported at least twice.
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index c43df53c7cce..03c2c2964d22 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -77,7 +77,7 @@ obj-y += $(obj)/lib-ksyms.o
 endif
 
 ifneq ($(strip $(obj-y) $(need-builtin)),)
-builtin-target := $(obj)/built-in.o
+builtin-target := $(obj)/built-in.a
 endif
 
 modorder-target := $(obj)/modules.order
@@ -104,7 +104,7 @@ ifneq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
   cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $< ;
 endif
 
-# Do section mismatch analysis for each module/built-in.o
+# Do section mismatch analysis for each module/built-in.a
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
   cmd_secanalysis = ; scripts/mod/modpost $@
 endif
@@ -450,15 +450,15 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
 #
 ifdef builtin-target
 
-# built-in.o archives are made with no symbol table or index which
+# built-in.a archives are made with no symbol table or index which
 # makes them small and fast, but unable to be used by the linker.
-# scripts/link-vmlinux.sh builds an aggregate built-in.o with a symbol
+# scripts/link-vmlinux.sh builds an aggregate built-in.a with a symbol
 # table and index.
 cmd_make_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
 cmd_make_empty_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
 quiet_cmd_link_o_target = AR      $@
 
-# If the list of objects to link is empty, just create an empty built-in.o
+# If the list of objects to link is empty, just create an empty built-in.a
 cmd_link_o_target = $(if $(strip $(obj-y)),\
 		      $(cmd_make_builtin) $@ $(filter $(obj-y), $^) \
 		      $(cmd_secanalysis),\
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5589bae34af6..3b151bb390cb 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -27,7 +27,7 @@ modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko
 
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
-# o if we encounter foo/ in $(obj-y), replace it by foo/built-in.o
+# o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
 #   and add the directory to the list of dirs to descend into: $(subdir-y)
 # o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
 #   and add the directory to the list of dirs to descend into: $(subdir-m)
@@ -35,7 +35,7 @@ __subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
 subdir-y	+= $(__subdir-y)
 __subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
 subdir-m	+= $(__subdir-m)
-obj-y		:= $(patsubst %/, %/built-in.o, $(obj-y))
+obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
 obj-m		:= $(filter-out %/, $(obj-m))
 
 # Subdirectories we need to descend into
@@ -54,7 +54,7 @@ multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
 
 # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
 # tell kbuild to descend
-subdir-obj-y := $(filter %/built-in.o, $(obj-y))
+subdir-obj-y := $(filter %/built-in.a, $(obj-y))
 
 # Replace multi-part objects by their individual parts, look at local dir only
 real-objs-y := $(foreach m, $(filter-out $(subdir-obj-y), $(obj-y)), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a55c24a86133..bf9a24e51b9b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -4,7 +4,7 @@
 # link vmlinux
 #
 # vmlinux is linked from the objects selected by $(KBUILD_VMLINUX_INIT) and
-# $(KBUILD_VMLINUX_MAIN) and $(KBUILD_VMLINUX_LIBS). Most are built-in.o files
+# $(KBUILD_VMLINUX_MAIN) and $(KBUILD_VMLINUX_LIBS). Most are built-in.a files
 # from top-level directories in the kernel tree, others are specified in
 # arch/$(ARCH)/Makefile. Ordering when linking is important, and
 # $(KBUILD_VMLINUX_INIT) must be first. $(KBUILD_VMLINUX_LIBS) are archives
@@ -18,7 +18,7 @@
 #   |   +--< init/version.o + more
 #   |
 #   +--< $(KBUILD_VMLINUX_MAIN)
-#   |    +--< drivers/built-in.o mm/built-in.o + more
+#   |    +--< drivers/built-in.a mm/built-in.a + more
 #   |
 #   +--< $(KBUILD_VMLINUX_LIBS)
 #   |    +--< lib/lib.a + more
@@ -51,13 +51,13 @@ info()
 #
 # Traditional incremental style of link does not require this step
 #
-# built-in.o output file
+# built-in.a output file
 #
 archive_builtin()
 {
-	info AR built-in.o
-	rm -f built-in.o;
-	${AR} rcsTP${KBUILD_ARFLAGS} built-in.o			\
+	info AR built-in.a
+	rm -f built-in.a;
+	${AR} rcsTP${KBUILD_ARFLAGS} built-in.a			\
 				${KBUILD_VMLINUX_INIT}		\
 				${KBUILD_VMLINUX_MAIN}
 }
@@ -69,7 +69,7 @@ modpost_link()
 	local objects
 
 	objects="--whole-archive				\
-		built-in.o					\
+		built-in.a					\
 		--no-whole-archive				\
 		--start-group					\
 		${KBUILD_VMLINUX_LIBS}				\
@@ -88,7 +88,7 @@ vmlinux_link()
 
 	if [ "${SRCARCH}" != "um" ]; then
 		objects="--whole-archive			\
-			built-in.o				\
+			built-in.a				\
 			--no-whole-archive			\
 			--start-group				\
 			${KBUILD_VMLINUX_LIBS}			\
@@ -99,7 +99,7 @@ vmlinux_link()
 			-T ${lds} ${objects}
 	else
 		objects="-Wl,--whole-archive			\
-			built-in.o				\
+			built-in.a				\
 			-Wl,--no-whole-archive			\
 			-Wl,--start-group			\
 			${KBUILD_VMLINUX_LIBS}			\
@@ -164,7 +164,7 @@ cleanup()
 	rm -f .tmp_System.map
 	rm -f .tmp_kallsyms*
 	rm -f .tmp_vmlinux*
-	rm -f built-in.o
+	rm -f built-in.a
 	rm -f System.map
 	rm -f vmlinux
 	rm -f vmlinux.o
diff --git a/scripts/namespace.pl b/scripts/namespace.pl
index 729c547fc9e1..6135574a6f39 100755
--- a/scripts/namespace.pl
+++ b/scripts/namespace.pl
@@ -164,7 +164,7 @@ sub linux_objects
 	s:^\./::;
 	if (/.*\.o$/ &&
 		! (
-		m:/built-in.o$:
+		m:/built-in.a$:
 		|| m:arch/x86/vdso/:
 		|| m:arch/x86/boot/:
 		|| m:arch/ia64/ia32/ia32.o$:
diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
index 10d325e24566..b28da799f6a6 100644
--- a/usr/initramfs_data.S
+++ b/usr/initramfs_data.S
@@ -10,7 +10,7 @@
 
   ld -m elf_i386  --format binary --oformat elf32-i386 -r \
   -T initramfs_data.scr initramfs_data.cpio.gz -o initramfs_data.o
-   ld -m elf_i386  -r -o built-in.o initramfs_data.o
+   ld -m elf_i386  -r -o built-in.a initramfs_data.o
 
   For including the .init.ramfs sections, see include/asm-generic/vmlinux.lds.
 
-- 
2.15.1

