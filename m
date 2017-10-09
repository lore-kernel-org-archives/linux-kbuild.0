Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:32404 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754649AbdJIOgG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 10:36:06 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] c6x: add KBUILD_ prefix to CFLAGS_MODULE
Date: Mon,  9 Oct 2017 23:35:15 +0900
Message-Id: <1507559715-30918-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1507559715-30918-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507559715-30918-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Mark Salter <msalter@redhat.com>, linux-c6x-dev@linux-c6x.org, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, linux-kernel@vger.kernel.org

CFLAGS_MODULE is supposed to be set by users, not by in-kernel
makefiles.

Documentation/kbuild/makefiles.txt clearly explains the difference:

  KBUILD_CFLAGS_MODULE   Options for $(CC) when building modules

      $(KBUILD_CFLAGS_MODULE) is used to add arch-specific options that
      are used for $(CC).
      From commandline CFLAGS_MODULE shall be used (see kbuild.txt).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/c6x/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/c6x/Makefile b/arch/c6x/Makefile
index 6b0be67..6f6096f 100644
--- a/arch/c6x/Makefile
+++ b/arch/c6x/Makefile
@@ -12,7 +12,7 @@ cflags-y += -mno-dsbt -msdata=none -D__linux__
 
 cflags-$(CONFIG_C6X_BIG_KERNEL) += -mlong-calls
 
-CFLAGS_MODULE   += -mlong-calls -mno-dsbt -msdata=none
+KBUILD_CFLAGS_MODULE   += -mlong-calls -mno-dsbt -msdata=none
 
 CHECKFLAGS      +=
 
-- 
2.7.4

