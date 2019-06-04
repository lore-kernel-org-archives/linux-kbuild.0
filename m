Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39611 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfFDKPx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 06/15] kbuild: remove build_unifdef target in scripts/Makefile
Date: Tue,  4 Jun 2019 19:14:00 +0900
Message-Id: <20190604101409.2078-7-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit 2aedcd098a94 ("kbuild: suppress annoying "... is up to date."
message"), if_changed and friends nicely suppress "... is up to date"

We do not need per-Makefile tricks.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile         | 2 +-
 scripts/Makefile | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index ce5a9551860d..e998c40c94b4 100644
--- a/Makefile
+++ b/Makefile
@@ -1182,7 +1182,7 @@ PHONY += archheaders archscripts
 
 PHONY += __headers
 __headers: $(version_h) scripts_basic uapi-asm-generic archheaders archscripts
-	$(Q)$(MAKE) $(build)=scripts build_unifdef
+	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
 
 PHONY += headers_install
 headers_install: __headers
diff --git a/scripts/Makefile b/scripts/Makefile
index 9d442ee050bd..16bcb8087899 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -31,11 +31,6 @@ always		:= $(hostprogs-y) $(hostprogs-m)
 # The following hostprogs-y programs are only build on demand
 hostprogs-y += unifdef
 
-# These targets are used internally to avoid "is up to date" messages
-PHONY += build_unifdef
-build_unifdef: $(obj)/unifdef
-	@:
-
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
-- 
2.17.1
