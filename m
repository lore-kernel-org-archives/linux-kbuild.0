Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:64016 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbeHDGsV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Aug 2018 02:48:21 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: add %asm-generic to no-dot-config-targets
Date: Sat,  4 Aug 2018 13:47:02 +0900
Message-Id: <1533358023-5801-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
References: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

asm-generic and uapi-asm-generic do not depend on the kernel
configuration.  In fact, uapi-asm-generic is the prerequisite of
headers_{install,check}, hence it should not require the .config file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 85f3481..5cf87a18 100644
--- a/Makefile
+++ b/Makefile
@@ -224,7 +224,7 @@ clean-targets := %clean mrproper cleandocs
 no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers_% archheaders archscripts \
-			 kernelversion %src-pkg
+			 %asm-generic kernelversion %src-pkg
 
 config-targets := 0
 mixed-targets  := 0
-- 
2.7.4

