Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40001 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 17/37] modpost: generate vmlinux.symvers and reuse it for the second modpost
Date: Mon,  1 Jun 2020 14:57:11 +0900
Message-Id: <20200601055731.3006266-17-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

The full build runs modpost twice, first for vmlinux.o and second for
modules.

The first pass dumps all the vmlinux symbols into Module.symvers, but
the second pass parses vmlinux again instead of reusing the dump file,
presumably because it needs to avoid accumulating stale symbols.

Loading symbol info from a dump file is faster than parsing an ELF object.
Besides, modpost deals with various issues to parse vmlinux in the second
pass.

A solution is to make the first pass dumps symbols into a separate file,
vmlinux.symvers. The second pass reads it, and parses module .o files.
The merged symbol information is dumped into Module.symvers in the same
way as before.

This makes further modpost cleanups possible.

Also, it fixes the problem of 'make vmlinux', which previously overwrote
Module.symvers, throwing away module symbols.

I slightly touched scripts/link-vmlinux.sh so that vmlinux is re-linked
when you cross this commit. Otherwise, vmlinux.symvers would not be
generated.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitignore               | 1 +
 Documentation/dontdiff   | 1 +
 Makefile                 | 2 +-
 scripts/Makefile.modpost | 7 ++++---
 scripts/link-vmlinux.sh  | 2 --
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index 2258e906f01c..87b9dd8a163b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -56,6 +56,7 @@ modules.order
 /linux
 /vmlinux
 /vmlinux.32
+/vmlinux.symvers
 /vmlinux-gdb.py
 /vmlinuz
 /System.map
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 72fc2e9e2b63..ef9519c32c55 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -251,6 +251,7 @@ vmlinux-*
 vmlinux.aout
 vmlinux.bin.all
 vmlinux.lds
+vmlinux.symvers
 vmlinuz
 voffset.h
 vsyscall.lds
diff --git a/Makefile b/Makefile
index b40420a0b991..6280c7597a2d 100644
--- a/Makefile
+++ b/Makefile
@@ -1416,7 +1416,7 @@ endif # CONFIG_MODULES
 # make distclean Remove editor backup files, patch leftover files and the like
 
 # Directories & files removed with 'make clean'
-CLEAN_FILES += include/ksym \
+CLEAN_FILES += include/ksym vmlinux.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps
 
 # Directories & files removed with 'make mrproper'
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 6808086075b6..6db692a5d547 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -55,10 +55,10 @@ ifdef MODPOST_VMLINUX
 quiet_cmd_modpost = MODPOST $@
       cmd_modpost = $(MODPOST) $<
 
-Module.symvers: vmlinux.o
+vmlinux.symvers: vmlinux.o
 	$(call cmd,modpost)
 
-__modpost: Module.symvers
+__modpost: vmlinux.symvers
 
 else
 
@@ -66,7 +66,8 @@ MODPOST += -s \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
-MODPOST += $(wildcard vmlinux)
+
+input-symdump := vmlinux.symvers
 output-symdump := Module.symvers
 
 else
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d09ab4afbda4..d5af6be50b50 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -218,8 +218,6 @@ on_signals()
 }
 trap on_signals HUP INT QUIT TERM
 
-#
-#
 # Use "make V=1" to debug this script
 case "${KBUILD_VERBOSE}" in
 *1*)
-- 
2.25.1
