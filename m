Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39165 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbfFDKPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 10/15] kbuild: move hdr-inst shorthand to top Makefile
Date: Tue,  4 Jun 2019 19:14:04 +0900
Message-Id: <20190604101409.2078-11-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now that hdr-inst is used only in the top Makefile, move it there
from scripts/Kbuild.include.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile               | 2 ++
 scripts/Kbuild.include | 6 ------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 608af32cc758..48bac02fb72d 100644
--- a/Makefile
+++ b/Makefile
@@ -1190,6 +1190,8 @@ headers_install: headers
 
 PHONY += archheaders archscripts
 
+hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
+
 PHONY += headers
 headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
 	$(if $(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/Kbuild),, \
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index f12e81eeb89b..9ae4493d5bcd 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -180,12 +180,6 @@ dtbinst := -f $(srctree)/scripts/Makefile.dtbinst obj
 # $(Q)$(MAKE) $(clean)=dir
 clean := -f $(srctree)/scripts/Makefile.clean obj
 
-###
-# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.headersinst obj=
-# Usage:
-# $(Q)$(MAKE) $(hdr-inst)=dir
-hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
-
 # echo command.
 # Short version is used, if $(quiet) equals `quiet_', otherwise full one.
 echo-cmd = $(if $($(quiet)cmd_$(1)),\
-- 
2.17.1
