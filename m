Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:56119 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdGZNhT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Jul 2017 09:37:19 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] Kbuild: use -fshort-wchar globally
Date: Wed, 26 Jul 2017 15:36:23 +0200
Message-Id: <20170726133655.2137437-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Vrabel <david.vrabel@citrix.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org

A previous patch added the --no-wchar-size-warning to the Makefile to
avoid this harmless warning:

arm-linux-gnueabi-ld: warning: drivers/xen/efi.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail

Changing kbuild to use thin archives instead of recursive linking
unfortunately brings the same warning back during the final link.

The kernel does not use wchar_t string literals at this point, and
xen does not use wchar_t at all (only efi_char16_t), so the flag
has no effect, but as pointed out by Jan Beulich, adding a wchar_t
string literal would be bad here.

Since wchar_t is always defined as u16, independent of the toolchain
default, always passing -fshort-wchar is correct and lets us
remove the Xen specific hack along with fixing the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 971a69db7dc0 ("Xen: don't warn about 2-byte wchar_t in efi")
Acked-by: David Vrabel <david.vrabel@citrix.com>
Link: https://patchwork.kernel.org/patch/9275217/
---
I submitted an earlier patch in August 2016, simply removing the
flag in xen, but there seems to be no harm in enabling it globally
---
 Makefile             | 2 +-
 drivers/xen/Makefile | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f1533423094f..0fe63a47fd52 100644
--- a/Makefile
+++ b/Makefile
@@ -396,7 +396,7 @@ LINUXINCLUDE    := \
 KBUILD_CPPFLAGS := -D__KERNEL__
 
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
-		   -fno-strict-aliasing -fno-common \
+		   -fno-strict-aliasing -fno-common -fshort-wchar \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
 		   -std=gnu89 $(call cc-option,-fno-PIE)
diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
index 8feab810aed9..7f188b8d0c67 100644
--- a/drivers/xen/Makefile
+++ b/drivers/xen/Makefile
@@ -7,9 +7,6 @@ obj-y	+= xenbus/
 nostackp := $(call cc-option, -fno-stack-protector)
 CFLAGS_features.o			:= $(nostackp)
 
-CFLAGS_efi.o				+= -fshort-wchar
-LDFLAGS					+= $(call ld-option, --no-wchar-size-warning)
-
 dom0-$(CONFIG_ARM64) += arm-device.o
 dom0-$(CONFIG_PCI) += pci.o
 dom0-$(CONFIG_USB_SUPPORT) += dbgp.o
-- 
2.9.0

