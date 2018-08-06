Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46176 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730869AbeHFPsM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 11:48:12 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w76DO2w2095821
        for <linux-kbuild@vger.kernel.org>; Mon, 6 Aug 2018 09:39:02 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2kpq550pf4-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Aug 2018 09:39:01 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Mon, 6 Aug 2018 14:39:00 +0100
Date: Mon, 6 Aug 2018 15:38:56 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH] kbuild: add Map option to save vmlinux linker map file(s)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Message-Id: <patch.git-39444503b4d3.your-ad-here.call-01533562662-ext-6094@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Add "Map" kbuild option, so that "make Map=1" would save vmlinux linker
map into vmlinux.map, which is quite useful during making kernel changes
related to how the kernel is composed.

KBUILD_SAVE_LINK_MAP flag is exported and architectures
supporting compressed kernel images might respect it and produce
arch/*/boot/compressed/vmlinux.map for the decompressor code as well.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 .gitignore |  1 +
 Makefile   | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/.gitignore b/.gitignore
index 97ba6b79834c..1d2308e597ad 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,6 +44,7 @@
 *.xz
 Module.symvers
 modules.builtin
+vmlinux.map
 
 #
 # Top-level generic files
diff --git a/Makefile b/Makefile
index 7a3c4548162b..f1790deae03b 100644
--- a/Makefile
+++ b/Makefile
@@ -176,6 +176,14 @@ ifndef KBUILD_CHECKSRC
   KBUILD_CHECKSRC = 0
 endif
 
+# Use 'make Map=1' to enable saving linker map file(s):
+# vmlinux.map for vmlinux,
+# (arch/*/boot/compressed/vmlinux.map for arch/*/boot/compressed/vmlinux)
+
+ifeq ("$(origin Map)", "command line")
+	export KBUILD_SAVE_LINK_MAP := $(Map)
+endif
+
 # Use make M=dir to specify directory of external module to build
 # Old syntax make ... SUBDIRS=$PWD is still supported
 # Setting the environment variable KBUILD_EXTMOD take precedence
@@ -838,6 +846,11 @@ ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
 LDFLAGS_vmlinux	+= $(call ld-option, -X,)
 endif
 
+ifdef KBUILD_SAVE_LINK_MAP
+LDFLAGS_vmlinux	+= -Map=vmlinux.map
+CLEAN_FILES	+= vmlinux.map
+endif
+
 # insure the checker run with the right endianness
 CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
 
@@ -1434,6 +1447,7 @@ help:
 	@echo  '		2: warnings which occur quite often but may still be relevant'
 	@echo  '		3: more obscure warnings, can most likely be ignored'
 	@echo  '		Multiple levels can be combined with W=12 or W=123'
+	@echo  '  make Map=1 [targets] Save vmlinux linker map file(s)'
 	@echo  ''
 	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
 	@echo  'For further info see the ./README file'
-- 
2.18.0.13.gd42ae10

