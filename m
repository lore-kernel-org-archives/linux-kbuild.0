Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:62280 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161057AbcFOPpR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Jun 2016 11:45:17 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 03/11] Kbuild: always prefix objtree in LINUXINCLUDE
Date: Wed, 15 Jun 2016 17:45:45 +0200
Message-Id: <20160615154553.3177021-4-arnd@arndb.de>
In-Reply-To: <20160615154553.3177021-1-arnd@arndb.de>
References: <20160615154553.3177021-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>

When $(LINUXINCLUDE) is added to the cflags of a target that
normall doesn't have it (e.g. HOSTCFLAGS), each entry in the
list is expanded so that we search both $(objtree) and $(srctree),
which is a bit silly, as we already know which of the two we
want for each entry in LINUXINCLUDE.

Also, a follow-up patch changes the behavior so we only look in
$(srctree) for manually added include path, and that breaks finding
the generated headers.

This adds an explicit $(objtree) for each tree that we want to
look for generated files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 45159861e645..969924783543 100644
--- a/Makefile
+++ b/Makefile
@@ -377,19 +377,19 @@ CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
 		-I$(srctree)/arch/$(hdr-arch)/include/uapi \
-		-Iarch/$(hdr-arch)/include/generated/uapi \
+		-I$(objtree)/arch/$(hdr-arch)/include/generated/uapi \
 		-I$(srctree)/include/uapi \
-		-Iinclude/generated/uapi \
+		-I$(objtree)/include/generated/uapi \
                 -include $(srctree)/include/linux/kconfig.h
 
 # Use LINUXINCLUDE when you must reference the include/ directory.
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := \
 		-I$(srctree)/arch/$(hdr-arch)/include \
-		-Iarch/$(hdr-arch)/include/generated/uapi \
-		-Iarch/$(hdr-arch)/include/generated \
+		-I$(objtree)/arch/$(hdr-arch)/include/generated/uapi \
+		-I$(objtree)/arch/$(hdr-arch)/include/generated \
 		$(if $(KBUILD_SRC), -I$(srctree)/include) \
-		-Iinclude
+		-I$(objtree)/include
 
 LINUXINCLUDE	+= $(filter-out $(LINUXINCLUDE),$(USERINCLUDE))
 
-- 
2.9.0

