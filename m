Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:39036 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753995AbYFVWH7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Jun 2008 18:07:59 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 5/5] kbuild: add arch/$ARCH/include to search path
Date: Mon, 23 Jun 2008 00:08:44 +0200
Message-Id: <1214172524-9043-5-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080622220508.GA8957@uranus.ravnborg.org>
References: <20080622220508.GA8957@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>

This patch conclude the support for

   arch/$ARCH/include

Note: The individual architectures will most likely require
      a few minor patches to support locating header files in
      arch/$ARCH/include

Testing shows that it worked out-of-the-box for sparc,
but x86 requireds a few trivial changes in the
arch specific Makefile (and one include path needs to be adjusted).

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index aac0ae0..2628295 100644
--- a/Makefile
+++ b/Makefile
@@ -329,7 +329,8 @@ AFLAGS_KERNEL	=
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := -Iinclude \
                    $(if $(KBUILD_SRC),-Iinclude2 -I$(srctree)/include) \
-		   -include include/linux/autoconf.h
+                   -I$(srctree)/arch/$(hdr-arch)/include               \
+                   -include include/linux/autoconf.h
 
 KBUILD_CPPFLAGS := -D__KERNEL__ $(LINUXINCLUDE)
 
-- 
1.5.4.1.143.ge7e51

