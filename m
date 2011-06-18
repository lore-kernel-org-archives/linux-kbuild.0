Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:55916 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752741Ab1FRVeb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Jun 2011 17:34:31 -0400
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] um: Reinstate kernel version in generated .config
Date: Sat, 18 Jun 2011 23:34:25 +0200
Message-Id: <1308432865-9730-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Arnaud Lacombe <lacombar@gmail.com>
Cc: user-mode-linux-devel@lists.sourceforge.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

commit 0954828fcbf3bd13d593499b16b901a4e801b0b9 ("kconfig: replace
KERNELVERSION usage by the mainmenu's prompt") made the kernel version
disappear from the generated .config file when configuring for UML.
As UML's Kconfig doesn't have a mainmenu, kconfig falls back to the
default string "Linux Kernel Configuration".

Add a suitable mainmenu to the main UML Kconfig file to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/um/Kconfig.x86 |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/um/Kconfig.x86 b/arch/um/Kconfig.x86
index 8aae429..d31ecf3 100644
--- a/arch/um/Kconfig.x86
+++ b/arch/um/Kconfig.x86
@@ -1,3 +1,5 @@
+mainmenu "User Mode Linux/$SUBARCH $KERNELVERSION Kernel Configuration"
+
 source "arch/um/Kconfig.common"
 
 menu "UML-specific options"
-- 
1.7.0.4

