Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:59084 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756517AbZINVth (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:37 -0400
Message-Id: <200909142149.n8ELnD6D018753@imap1.linux-foundation.org>
Subject: [patch 12/18] kbuild: fix cc1 options check to ensure we do not use -fPIC when compiling
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, anarchy@gentoo.org, hpa@zytor.com, johansson_fredric@hotmail.com, zorry@ume.nu

From: "Jory A. Pratt" <anarchy@gentoo.org>

The arch/*/boot/Makefile use cc-options to check for GCC command options
and cc-options use the hardened specs when checking for GCC command
options.  When -fPIE is pass to cc1 it can't use -ffreestanding or
-fno-toplevel-reorder.  Then it fail to build stuff with -ffreestanding
and -fno-toplevel-reorder.

Thanks to Fredric Johansson for finding the main problem behind a failed
build using a hardened toolchain.

Signed-off-by: Magnus Granberg <zorry@ume.nu>
Signed-off-by: Jory A. Pratt <anarchy@gentoo.org>
Cc: Fredric Johansson <johansson_fredric@hotmail.com> 
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/Kbuild.include |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/Kbuild.include~kbuild-fix-cc1-options-check-to-ensure-we-do-not-use-fpic-when-compiling scripts/Kbuild.include
--- a/scripts/Kbuild.include~kbuild-fix-cc1-options-check-to-ensure-we-do-not-use-fpic-when-compiling
+++ a/scripts/Kbuild.include
@@ -105,12 +105,12 @@ as-instr = $(call try-run,\
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
 
 cc-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -xc /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -xc /dev/null -o "$$TMP",$(1),$(2))
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -xc /dev/null -o "$$TMP",y,n)
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -xc /dev/null -o "$$TMP",y,n)
 
 # cc-option-align
 # Prefix align with either -falign or -malign
_
