Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39189 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfFDKPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:39 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 12/15] kbuild: deb-pkg: do not run headers_check
Date: Tue,  4 Jun 2019 19:14:06 +0900
Message-Id: <20190604101409.2078-13-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

It is absolutely fine to add extra sanity checks in package scripts,
but it is not necessary to do so.

This is already covered by the daily compile-testing (0day bot etc.)
because headers_check is run as a part of the normal build process
when CONFIG_HEADERS_CHECK=y.

Replace it with the newly-added "make headers".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b03dd56a4782..e8ca6dc97e96 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -130,7 +130,7 @@ if is_enabled CONFIG_MODULES; then
 fi
 
 if [ "$ARCH" != "um" ]; then
-	$MAKE -f $srctree/Makefile headers_check
+	$MAKE -f $srctree/Makefile headers
 	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
 fi
 
-- 
2.17.1
