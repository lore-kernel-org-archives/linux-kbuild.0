Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:36098 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752873AbbC3Ltn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 07:49:43 -0400
Received: by wibg7 with SMTP id g7so99794732wib.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2015 04:49:42 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [RFC PATCH 2/2] Kbuild: avoid partial linking of drivers/built-in.o
Date: Mon, 30 Mar 2015 13:49:27 +0200
Message-Id: <1427716167-25078-3-git-send-email-ard.biesheuvel@linaro.org>
In-Reply-To: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, mmarek@suse.cz, linux@arm.linux.org.uk
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>

The recursive partial linking of vmlinux can result in a
drivers/built-in.o that is so huge that it interferes with
the ability of the linker to emit veneers in the final link
stage if the symbols are out of reach. This is caused by the
fact that those veneers, which should be emitted close enough
to the original call site, can only be emitted after the .text
section of drivers/built-in.o, whose size pushes those veneers
out of range.

So instead, avoid building drivers/built-in.o, and instead, add
the constituent parts to the command line of the final link.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 Makefile | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e734965b1604..1eb6c246a586 100644
--- a/Makefile
+++ b/Makefile
@@ -558,7 +558,7 @@ scripts: scripts_basic include/config/auto.conf include/config/tristate.conf \
 
 # Objects we will link into vmlinux / subdirs we need to visit
 init-y		:= init/
-drivers-y	:= drivers/ sound/ firmware/
+drivers-y	:= sound/ firmware/
 net-y		:= net/
 libs-y		:= lib/
 core-y		:= usr/
@@ -569,6 +569,16 @@ ifeq ($(dot-config),1)
 -include include/config/auto.conf
 
 ifeq ($(KBUILD_EXTMOD),)
+
+# drivers/built-in.o can become huge, which interferes with the linker's
+# ability to emit stubs for branch targets that are out of reach for the
+# ordinary relative branch instructions
+include $(srctree)/drivers/Makefile
+drivers-y += $(addprefix drivers/,$(sort $(obj-y)))
+drivers-m += $(addprefix drivers/,$(sort $(obj-m)))
+obj-y :=
+obj-m :=
+
 # Read in dependencies to all Kconfig* files, make sure to run
 # oldconfig if changes are detected.
 -include include/config/auto.conf.cmd
-- 
1.8.3.2

