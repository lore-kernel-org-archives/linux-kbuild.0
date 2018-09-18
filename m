Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:39411 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbeIRJaR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Sep 2018 05:30:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] samples: disable CONFIG_SAMPLES for UML
Date: Tue, 18 Sep 2018 12:58:33 +0900
Message-Id: <1537243113-1710-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, David Howells <dhowells@redhat.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

Some samples require headers installation, so commit 3fca1700c4c3
("kbuild: make samples really depend on headers_install") added
such dependency in the top Makefile.  However, UML fails to build
with CONFIG_SAMPLES=y because UML does not support headers_install.

Fixes: 3fca1700c4c3 ("kbuild: make samples really depend on headers_install")
Reported-by: Kees Cook <keescook@chromium.org>
Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 samples/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/samples/Kconfig b/samples/Kconfig
index bd133ef..ad1ec701 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -1,5 +1,6 @@
 menuconfig SAMPLES
 	bool "Sample kernel code"
+	depends on !UML
 	help
 	  You can build and test sample kernel code here.
 
-- 
2.7.4
