Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37437 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759037AbYAXWDy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:54 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 26/77] CRIS: Remove 'TOPDIR' from Makefiles
Date: Thu, 24 Jan 2008 23:03:07 +0100
Message-Id: <1201212238-4369-26-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: WANG Cong <xiyou.wangcong@gmail.com>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Andreas Schwab <schwab@suse.de>, Sam Ravnborg <sam@ravnborg.org>

From: WANG Cong <xiyou.wangcong@gmail.com>

This patch removes TOPDIR from Cris Makefiles.

Cc: Mikael Starvik <starvik@axis.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Andreas Schwab <schwab@suse.de>
Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
 arch/cris/arch-v32/boot/compressed/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/cris/arch-v32/boot/compressed/Makefile b/arch/cris/arch-v32/boot/compressed/Makefile
index 9f77eda..609692f 100644
--- a/arch/cris/arch-v32/boot/compressed/Makefile
+++ b/arch/cris/arch-v32/boot/compressed/Makefile
@@ -7,7 +7,7 @@
 target = $(target_compressed_dir)
 src    = $(src_compressed_dir)
 
-CC = gcc-cris -mlinux -march=v32 -I $(TOPDIR)/include
+CC = gcc-cris -mlinux -march=v32 $(LINUXINCLUDE)
 CFLAGS = -O2
 LD = gcc-cris -mlinux -march=v32 -nostdlib
 OBJCOPY = objcopy-cris
-- 
1.5.4.rc3.14.g44397

