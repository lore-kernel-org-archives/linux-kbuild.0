Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:31572 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbeLaIYc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Dec 2018 03:24:32 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] kbuild: make LINUX_VERSION_CODE in <linux/version.h> more readable
Date: Mon, 31 Dec 2018 17:24:11 +0900
Message-Id: <1546244651-10447-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1546244651-10447-1-git-send-email-yamada.masahiro@socionext.com>
References: <1546244651-10447-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Makefile does not need to calculate LINUX_VERSION_CODE.
Let's leave it to the preprocessor.

This commit changes include/generated/uapi/linux/version.h as follows:

Before:

  #define LINUX_VERSION_CODE 267264
  #define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))

After:

  #define LINUX_VERSION_CODE KERNEL_VERSION(4, 20, 0)
  #define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))

The latter is more human-readable in my opinion.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 437d603..1ebf5ed 100644
--- a/Makefile
+++ b/Makefile
@@ -1131,8 +1131,7 @@ define filechk_utsrelease.h
 endef
 
 define filechk_version.h
-	echo \#define LINUX_VERSION_CODE $(shell                         \
-	expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
+	echo '#define LINUX_VERSION_CODE KERNEL_VERSION($(VERSION), $(PATCHLEVEL), $(SUBLEVEL))'; \
 	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
 endef
 
-- 
2.7.4
