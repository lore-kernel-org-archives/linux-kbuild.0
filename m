Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:48418 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfEaP07 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 11:26:59 -0400
From: "George G. Davis" <george_davis@mentor.com>
Subject: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown architecture
Date: Fri, 31 May 2019 11:26:11 -0400
Message-ID: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Cc: "George G. Davis" <george_davis@mentor.com>

The following error occurs for the `make ARCH=arm64 checkstack` case:

aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
perl ./scripts/checkstack.pl arm64
wrong or unknown architecture "arm64"

Fix the above error by setting `CHECKSTACK_ARCH := aarch64` for the
ARCH=arm64 case.

Signed-off-by: George G. Davis <george_davis@mentor.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 11358153d8f2..3e615e8553c0 100644
--- a/Makefile
+++ b/Makefile
@@ -1695,7 +1695,11 @@ PHONY += checkstack kernelrelease kernelversion image_name
 ifeq ($(ARCH), um)
 CHECKSTACK_ARCH := $(SUBARCH)
 else
-CHECKSTACK_ARCH := $(ARCH)
+	ifeq ($(ARCH), arm64)
+		CHECKSTACK_ARCH := aarch64
+	else
+		CHECKSTACK_ARCH := $(ARCH)
+	endif
 endif
 checkstack:
 	$(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
-- 
2.7.4
