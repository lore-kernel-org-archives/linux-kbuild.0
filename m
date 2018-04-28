Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52242 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752096AbeD1WgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Apr 2018 18:36:10 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: "make tools/help" does not need syncconfig
Message-ID: <dd61aa2b-d05d-6f54-d512-c356ecdc8a50@infradead.org>
Date: Sat, 28 Apr 2018 15:36:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

From: Randy Dunlap <rdunlap@infradead.org>

Fix "make tools/help" to skip "make syncconfig".

"make tools/help" currently tries to run "make syncconfig" even
though there is no .config file and one is not needed just to get
help text output.  With no .config file, make says:

*** Configuration file ".config" not found!
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
scripts/kconfig/Makefile:40: recipe for target 'syncconfig' failed
make[2]: *** [syncconfig] Error 1
Makefile:525: recipe for target 'syncconfig' failed

and then goes on to run:
make LDFLAGS= MAKEFLAGS=" " O=/linux/linux-next-20180426 subdir=tools -C ./tools/ help

which produces the requested help text.  However, the "syncconfig"
efforts are not needed, so skip them by making "tools/help" be part
of the no-dot-config-targets rule.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20180426.orig/Makefile
+++ linux-next-20180426/Makefile
@@ -224,7 +224,7 @@ clean-targets := %clean mrproper cleando
 no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers_% archheaders archscripts \
-			 kernelversion %src-pkg
+			 kernelversion %src-pkg tools/help
 
 config-targets := 0
 mixed-targets  := 0


