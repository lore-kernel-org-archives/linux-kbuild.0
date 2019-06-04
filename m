Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39349 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfFDKPo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:44 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 07/15] kbuild: build all prerequisite of headers_install simultaneously
Date: Tue,  4 Jun 2019 19:14:01 +0900
Message-Id: <20190604101409.2078-8-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Currently, scripts/unifdef is compiled after scripts_basic,
uapi-asm-generic, archheaders, and archscripts.

The proper dependency is just scripts_basic. There is no problem
to compile scripts/unifdef and other headers at the same time.

Split scripts_unifdef out in order to allow more parallel building.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e998c40c94b4..f9c206eb3583 100644
--- a/Makefile
+++ b/Makefile
@@ -1181,8 +1181,7 @@ export INSTALL_HDR_PATH = $(objtree)/usr
 PHONY += archheaders archscripts
 
 PHONY += __headers
-__headers: $(version_h) scripts_basic uapi-asm-generic archheaders archscripts
-	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
+__headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
 
 PHONY += headers_install
 headers_install: __headers
@@ -1204,6 +1203,10 @@ ifdef CONFIG_HEADERS_CHECK
 all: headers_check
 endif
 
+PHONY += scripts_unifdef
+scripts_unifdef: scripts_basic
+	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
+
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
-- 
2.17.1
