Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37615 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfCDMzg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Mar 2019 07:55:36 -0500
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] kbuild: use -Werror=implicit-... instead of -Werror-implicit-...
Date: Mon,  4 Mar 2019 13:55:20 +0100
Message-Id: <20190304125520.17794-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

The flag '-Werror-implicit-function-declaration', present in GCC 2.95,
stopped to be documented in GCC 4.3, replaced by the more generic
'-Werror=...' form.

So, use the equivalent '-Werror=implicit-function-declaration' instead.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d5713e7b1e50..253e5ede92e7 100644
--- a/Makefile
+++ b/Makefile
@@ -429,7 +429,7 @@ LINUXINCLUDE    := \
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
-		   -Werror-implicit-function-declaration -Werror=implicit-int \
+		   -Werror=implicit-function-declaration -Werror=implicit-int \
 		   -Wno-format-security \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
-- 
2.21.0
