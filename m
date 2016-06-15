Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:52455 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753119AbcFOPpM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Jun 2016 11:45:12 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 07/11] ARM: hide mach-*/ include for ARM_SINGLE_ARMV7M
Date: Wed, 15 Jun 2016 17:45:49 +0200
Message-Id: <20160615154553.3177021-8-arnd@arndb.de>
In-Reply-To: <20160615154553.3177021-1-arnd@arndb.de>
References: <20160615154553.3177021-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>

The machine specific header files are exported for traditional
platforms, but not for the ones that use ARCH_MULTIPLATFORM, as
they could conflict with one another.

In case of ARM_SINGLE_ARMV7M, we end up also exporting them,
but that appears to be a mistake, and we should treat it the
same way as ARCH_MULTIPLATFORM here.

'make W=1' warns about this because it passes -Wmissing-includes
to gcc and the directories are not actually present.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 510620186ee8..3982c7e2fe55 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -266,12 +266,14 @@ machdirs := $(patsubst %,arch/arm/mach-%/,$(machine-y))
 platdirs := $(patsubst %,arch/arm/plat-%/,$(sort $(plat-y)))
 
 ifneq ($(CONFIG_ARCH_MULTIPLATFORM),y)
+ifneq ($(CONFIG_ARM_SINGLE_ARMV7M),y)
 ifeq ($(KBUILD_SRC),)
 KBUILD_CPPFLAGS += $(patsubst %,-I%include,$(machdirs) $(platdirs))
 else
 KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)/%include,$(machdirs) $(platdirs))
 endif
 endif
+endif
 
 export	TEXT_OFFSET GZFLAGS MMUEXT
 
-- 
2.9.0

