Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:60203 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806Ab1G3XCc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 Jul 2011 19:02:32 -0400
Subject: [PATCH 3/5] um: Always use -m32 when building for i386.
From: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 31 Jul 2011 00:02:08 +0100
In-Reply-To: <1312066693.22074.50.camel@i7.infradead.org>
References: <1312066693.22074.50.camel@i7.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1312066930.22074.54.camel@i7.infradead.org>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net

If the compiler doesn't understand it, cc-option will deal with that.

Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
---
 arch/um/Makefile-i386 |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/um/Makefile-i386 b/arch/um/Makefile-i386
index 75b3309..d65e316 100644
--- a/arch/um/Makefile-i386
+++ b/arch/um/Makefile-i386
@@ -11,16 +11,12 @@ OBJCOPYFLAGS  		:= -O binary -R .note -R .comment -S
 HEADER_ARCH		:= x86
 CHECKFLAGS	+= -D__i386__
 
-ifeq ("$(origin SUBARCH)", "command line")
-ifneq ("$(shell uname -m | sed -e s/i.86/i386/)", "$(SUBARCH)")
 KBUILD_CFLAGS		+= $(call cc-option,-m32)
 KBUILD_AFLAGS		+= $(call cc-option,-m32)
 LINK-y			+= $(call cc-option,-m32)
 UML_OBJCOPYFLAGS	+= -F $(ELF_FORMAT)
 
 export LDFLAGS HOSTCFLAGS HOSTLDFLAGS UML_OBJCOPYFLAGS
-endif
-endif
 
 # First of all, tune CFLAGS for the specific CPU. This actually sets cflags-y.
 include $(srctree)/arch/x86/Makefile_32.cpu
-- 
1.7.6



