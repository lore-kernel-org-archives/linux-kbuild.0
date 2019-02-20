Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:26323 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfBTEYF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 23:24:05 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: refactor cc-cross-prefix implementation
Date: Wed, 20 Feb 2019 13:23:56 +0900
Message-Id: <1550636636-25367-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

 - $(word 1, <text>) is equivalent to $(firstword, <text>)

 - hardcode "gcc" instead of $(CC)

 - minimize the shell script part

A little more notes since $(filter-out -%, ...) is not clear.

arch/mips/Makefile passes prefixes depending on the configuration.

CROSS_COMPILE := $(call cc-cross-prefix, $(tool-archpref)-linux- \
    $(tool-archpref)-linux-gnu- $(tool-archpref)-unknown-linux-gnu-)

In the Kconfig stage (e.g. when you run 'make defconfig'), neither
CONFIG_32BIT nor CONFIG_64BIT is defined. So, $(tool-archpref) is
empty. As a result, "-linux -linux-gnu- -unknown-linux-gnu" is passed
into cc-cross-prefix. The command 'which' assumes arguments starting
with a hyphen as command options, then emits the following messages:

  Illegal option -l
  Illegal option -l
  Illegal option -u

I think it is wrong to define CROSS_COMPILE depending on the CONFIG
options since you need to feed $(CC) to Kconfig, but it is how MIPS
Makefile currently works. Anyway, it would not hurt to filter-out
invalid strings beforehand.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index d93250b..c1e15a4 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -71,14 +71,10 @@ endef
 
 # cc-cross-prefix
 # Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
-# Return first prefix where a prefix$(CC) is found in PATH.
-# If no $(CC) found in PATH with listed prefixes return nothing
-cc-cross-prefix =  \
-	$(word 1, $(foreach c,$(1),                                   \
-		$(shell set -e;                                       \
-		if (which $(strip $(c))$(CC)) > /dev/null 2>&1 ; then \
-			echo $(c);                                    \
-		fi)))
+# Return first <prefix> where a <prefix>gcc is found in PATH.
+# If no gcc found in PATH with listed prefixes return nothing
+cc-cross-prefix = $(firstword $(foreach c, $(filter-out -%, $(1)), \
+					$(if $(shell which $(c)gcc), $(c))))
 
 # output directory for tests below
 TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
-- 
2.7.4
