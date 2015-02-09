Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:39784 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932339AbbBILBQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Feb 2015 06:01:16 -0500
From: Kiran Raparthy <kumarsharma.r@gmail.com>
Subject: [RFC] kbuild: make it possible to specify the module output dir
Date: Mon,  9 Feb 2015 16:28:48 +0530
Message-Id: <1423479528-27027-1-git-send-email-kumarsharma.r@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Rom Lemarchand <romlem@android.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Android Kernel Team <kernel-team@android.com>, Kiran Raparthy <kumarsharma.r@gmail.com>

From: Rom Lemarchand <romlem@android.com>

kbuild: make it possible to specify the module output dir

Make modinst_dir user-defined on the command line.

This allows to do things like:
make MODLIB=output/ modinst_dir=. modules_install

to ensure all the .ko are in the output/ directory.

Cc: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Android Kernel Team <kernel-team@android.com>
Signed-off-by: Rom Lemarchand <romlem@android.com>
[Kiran: Added context to commit message]
Signed-off-by: Kiran Raparthy <kumarsharma.r@gmail.com>
---
This is one of the number of patches from the Android AOSP common.git tree,
which is used on Android devices. I wanted to submit it for review
to see if it should go upstream.

 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index e48a4e9..9b7b280 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -29,7 +29,7 @@ quiet_cmd_modules_install = INSTALL $@
 INSTALL_MOD_DIR ?= extra
 ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst %/,%,$(KBUILD_EXTMOD)),,$(@D))
 
-modinst_dir = $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
+modinst_dir ?= $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
 
 $(modules):
 	$(call cmd,modules_install,$(MODLIB)/$(modinst_dir))
-- 
1.8.2.1

