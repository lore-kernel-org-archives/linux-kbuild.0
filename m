Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:56394 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbeGLILp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 04:11:45 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/6] um: remove redundant 'export LDFLAGS' in arch/x86/Makefile.um
Date: Thu, 12 Jul 2018 17:01:31 +0900
Message-Id: <1531382496-3719-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
References: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, x86@kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Jeff Dike <jdike@addtoit.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Masahiro Yamada <yamada.masahiro@socionext.com>

This is already exported by the top-level Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/x86/Makefile.um | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
index 45af199..5296f8c 100644
--- a/arch/x86/Makefile.um
+++ b/arch/x86/Makefile.um
@@ -13,8 +13,6 @@ KBUILD_CFLAGS		+= $(call cc-option,-m32)
 KBUILD_AFLAGS		+= $(call cc-option,-m32)
 LINK-y			+= $(call cc-option,-m32)
 
-export LDFLAGS
-
 LDS_EXTRA		:= -Ui386
 export LDS_EXTRA
 
-- 
2.7.4

