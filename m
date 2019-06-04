Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39169 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbfFDKPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 02/15] kbuild: remove stale dependency between Documentation/ and headers_install
Date: Tue,  4 Jun 2019 19:13:56 +0900
Message-Id: <20190604101409.2078-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 8e2faea877eb ("Make Documenation depend on headers_install")
dates back to 2014, which is before Sphinx was introduced for the
kernel documentation.

Since none of DOC_TARGET requires headers_install, it is strange to
run it only for the single target "Documentation/".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7745bdd84861..67b866d19269 100644
--- a/Makefile
+++ b/Makefile
@@ -1745,8 +1745,7 @@ build-dir = $(patsubst %/,%,$(dir $(build-target)))
 PHONY += /
 /: ./
 
-# Make sure the latest headers are built for Documentation
-Documentation/ samples/: headers_install
+samples/: headers_install
 %/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
 
-- 
2.17.1
