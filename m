Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:44482 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751040AbeBJOZT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Feb 2018 09:25:19 -0500
Received: by mail-pg0-f67.google.com with SMTP id j9so4661514pgp.11
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Feb 2018 06:25:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/2] kbuild: remove incremental linking option
Date: Sun, 11 Feb 2018 00:25:03 +1000
Message-Id: <20180210142504.29890-2-npiggin@gmail.com>
In-Reply-To: <20180210142504.29890-1-npiggin@gmail.com>
References: <20180210142504.29890-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

This removes the old `ld -r` incremental link option, which has not
been selected by any architecture since June 2017.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/kbuild/makefiles.txt | 10 ++++-
 arch/Kconfig                       |  6 ---
 scripts/Makefile.build             | 32 +++++---------
 scripts/link-vmlinux.sh            | 91 ++++++++++++++------------------------
 4 files changed, 51 insertions(+), 88 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 71e9feefb63c..750aea9edd35 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -153,8 +153,14 @@ more details, with real examples.
 	configuration.
 
 	Kbuild compiles all the $(obj-y) files.  It then calls
-	"$(LD) -r" to merge these files into one built-in.o file.
-	built-in.o is later linked into vmlinux by the parent Makefile.
+	"$(AR) rcSTP" to merge these files into one built-in.o file.
+	This is a thin archive without a symbol table, which makes it
+	unsuitable as a linker input.
+
+	The scripts/link-vmlinux.sh script later makes an aggregate
+	built-in.o with "${AR} rcsTP", which creates the thin archive
+	with a symbol table and an index, making it a valid input for
+	the final vmlinux link passes.
 
 	The order of files in $(obj-y) is significant.  Duplicates in
 	the lists are allowed: the first instance will be linked into
diff --git a/arch/Kconfig b/arch/Kconfig
index 76c0b54443b1..8e0d665c8d53 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -596,12 +596,6 @@ config CC_STACKPROTECTOR_AUTO
 
 endchoice
 
-config THIN_ARCHIVES
-	def_bool y
-	help
-	  Select this if the architecture wants to use thin archives
-	  instead of ld -r to create the built-in.o files.
-
 config LD_DEAD_CODE_DATA_ELIMINATION
 	bool
 	help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 47cddf32aeba..c43df53c7cce 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -450,15 +450,13 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
 #
 ifdef builtin-target
 
-ifdef CONFIG_THIN_ARCHIVES
-  cmd_make_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
-  cmd_make_empty_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
-  quiet_cmd_link_o_target = AR      $@
-else
-  cmd_make_builtin = $(LD) $(ld_flags) -r -o
-  cmd_make_empty_builtin = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS)
-  quiet_cmd_link_o_target = LD      $@
-endif
+# built-in.o archives are made with no symbol table or index which
+# makes them small and fast, but unable to be used by the linker.
+# scripts/link-vmlinux.sh builds an aggregate built-in.o with a symbol
+# table and index.
+cmd_make_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
+cmd_make_empty_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
+quiet_cmd_link_o_target = AR      $@
 
 # If the list of objects to link is empty, just create an empty built-in.o
 cmd_link_o_target = $(if $(strip $(obj-y)),\
@@ -491,11 +489,8 @@ $(modorder-target): $(subdir-ym) FORCE
 ifdef lib-target
 quiet_cmd_link_l_target = AR      $@
 
-ifdef CONFIG_THIN_ARCHIVES
-  cmd_link_l_target = rm -f $@; $(AR) rcsTP$(KBUILD_ARFLAGS) $@ $(lib-y)
-else
-  cmd_link_l_target = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib-y)
-endif
+# lib target archives do get a symbol table and index
+cmd_link_l_target = rm -f $@; $(AR) rcsTP$(KBUILD_ARFLAGS) $@ $(lib-y)
 
 $(lib-target): $(lib-y) FORCE
 	$(call if_changed,link_l_target)
@@ -543,13 +538,8 @@ $($(subst $(obj)/,,$(@:.o=-m)))), $^)
 
 cmd_link_multi-link = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
 
-ifdef CONFIG_THIN_ARCHIVES
-  quiet_cmd_link_multi-y = AR      $@
-  cmd_link_multi-y = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(link_multi_deps)
-else
-  quiet_cmd_link_multi-y = LD      $@
-  cmd_link_multi-y = $(cmd_link_multi-link)
-endif
+quiet_cmd_link_multi-y = AR      $@
+cmd_link_multi-y = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(link_multi_deps)
 
 quiet_cmd_link_multi-m = LD [M]  $@
 cmd_link_multi-m = $(cmd_link_multi-link)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c0d129d7f430..a55c24a86133 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -55,13 +55,11 @@ info()
 #
 archive_builtin()
 {
-	if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
-		info AR built-in.o
-		rm -f built-in.o;
-		${AR} rcsTP${KBUILD_ARFLAGS} built-in.o			\
-					${KBUILD_VMLINUX_INIT}		\
-					${KBUILD_VMLINUX_MAIN}
-	fi
+	info AR built-in.o
+	rm -f built-in.o;
+	${AR} rcsTP${KBUILD_ARFLAGS} built-in.o			\
+				${KBUILD_VMLINUX_INIT}		\
+				${KBUILD_VMLINUX_MAIN}
 }
 
 # Link of vmlinux.o used for section mismatch analysis
@@ -70,20 +68,13 @@ modpost_link()
 {
 	local objects
 
-	if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
-		objects="--whole-archive				\
-			built-in.o					\
-			--no-whole-archive				\
-			--start-group					\
-			${KBUILD_VMLINUX_LIBS}				\
-			--end-group"
-	else
-		objects="${KBUILD_VMLINUX_INIT}				\
-			--start-group					\
-			${KBUILD_VMLINUX_MAIN}				\
-			${KBUILD_VMLINUX_LIBS}				\
-			--end-group"
-	fi
+	objects="--whole-archive				\
+		built-in.o					\
+		--no-whole-archive				\
+		--start-group					\
+		${KBUILD_VMLINUX_LIBS}				\
+		--end-group"
+
 	${LD} ${LDFLAGS} -r -o ${1} ${objects}
 }
 
@@ -96,46 +87,28 @@ vmlinux_link()
 	local objects
 
 	if [ "${SRCARCH}" != "um" ]; then
-		if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
-			objects="--whole-archive			\
-				built-in.o				\
-				--no-whole-archive			\
-				--start-group				\
-				${KBUILD_VMLINUX_LIBS}			\
-				--end-group				\
-				${1}"
-		else
-			objects="${KBUILD_VMLINUX_INIT}			\
-				--start-group				\
-				${KBUILD_VMLINUX_MAIN}			\
-				${KBUILD_VMLINUX_LIBS}			\
-				--end-group				\
-				${1}"
-		fi
-
-		${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}		\
+		objects="--whole-archive			\
+			built-in.o				\
+			--no-whole-archive			\
+			--start-group				\
+			${KBUILD_VMLINUX_LIBS}			\
+			--end-group				\
+			${1}"
+
+		${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}	\
 			-T ${lds} ${objects}
 	else
-		if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
-			objects="-Wl,--whole-archive			\
-				built-in.o				\
-				-Wl,--no-whole-archive			\
-				-Wl,--start-group			\
-				${KBUILD_VMLINUX_LIBS}			\
-				-Wl,--end-group				\
-				${1}"
-		else
-			objects="${KBUILD_VMLINUX_INIT}			\
-				-Wl,--start-group			\
-				${KBUILD_VMLINUX_MAIN}			\
-				${KBUILD_VMLINUX_LIBS}			\
-				-Wl,--end-group				\
-				${1}"
-		fi
-
-		${CC} ${CFLAGS_vmlinux} -o ${2}				\
-			-Wl,-T,${lds}					\
-			${objects}					\
+		objects="-Wl,--whole-archive			\
+			built-in.o				\
+			-Wl,--no-whole-archive			\
+			-Wl,--start-group			\
+			${KBUILD_VMLINUX_LIBS}			\
+			-Wl,--end-group				\
+			${1}"
+
+		${CC} ${CFLAGS_vmlinux} -o ${2}			\
+			-Wl,-T,${lds}				\
+			${objects}				\
 			-lutil -lrt -lpthread
 		rm -f linux
 	fi
-- 
2.15.1

