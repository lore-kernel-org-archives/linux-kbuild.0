Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39318 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfFDKPn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 04/15] kbuild: fix Kconfig prompt of CONFIG_HEADERS_CHECK
Date: Tue,  4 Jun 2019 19:13:58 +0900
Message-Id: <20190604101409.2078-5-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Prior to commit 257edce66d31 ("kbuild: exploit parallel building for
CONFIG_HEADERS_CHECK"), the sanity check of exported headers was done
as a side-effect of build rule of vmlinux.

That commit is good, but I missed to update the prompt of the Kconfig
entry. For the sake of preciseness, lets' say "when building 'all'".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/Kconfig.debug | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index cbdfae379896..7cdcb962358c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -306,11 +306,11 @@ config DEBUG_FS
 	  If unsure, say N.
 
 config HEADERS_CHECK
-	bool "Run 'make headers_check' when building vmlinux"
+	bool "Run sanity checks on uapi headers when building 'all'"
 	depends on !UML
 	help
-	  This option will extract the user-visible kernel headers whenever
-	  building the kernel, and will run basic sanity checks on them to
+	  This option will extract the user-visible kernel headers when
+	  building the 'all' target, and will run basic sanity checks on them to
 	  ensure that exported files do not attempt to include files which
 	  were not exported, etc.
 
-- 
2.17.1
