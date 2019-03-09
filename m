Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:52414 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726372AbfCIPnu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Mar 2019 10:43:50 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Sat,  9 Mar 2019 18:43:05 +0300
Message-Id: <20190309154307.23039-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH v2 1/3] scripts/package/Makefile: put proper config in source tarball
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arseny Maslennikov <ar@cs.msu.ru>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

It is widely known that one can build a kernel without a .config in the
source tree by setting KCONFIG_CONFIG equal to the actual configuration
file path.

When making a *-pkg target, make(1) prepares a source tarball and tries
to pack `.config' in there regardless of the value of KCONFIG_CONFIG,
failing spectacularly if .config is absent and packing the wrong config
if it exists.
Let's fix that by including whatever KCONFIG_CONFIG points to in the
archive under the traditional name `.config'.

We have to pass --absolute-names to tar, since it seems to trim the
paths of archive members first and only then consider --transform, which
breaks KCONFIG_CONFIG=../../some.config, as well as absolute paths.

Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
---
 scripts/package/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 2c6de21e5152..134cefee068d 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -27,7 +27,7 @@ KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
 KBUILD_PKG_ROOTCMD ?="fakeroot -u"
 export KDEB_SOURCENAME
 # Include only those top-level files that are needed by make, plus the GPL copy
-TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
+TAR_CONTENT := $(KBUILD_ALLDIRS) $(KCONFIG_CONFIG) .scmversion Makefile \
                Kbuild Kconfig COPYING $(wildcard localversion*)
 MKSPEC     := $(srctree)/scripts/package/mkspec
 
@@ -44,6 +44,7 @@ if test "$(objtree)" != "$(srctree)"; then \
 fi ; \
 $(srctree)/scripts/setlocalversion --save-scmversion; \
 tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
+	--absolute-names --transform 's:^$(KCONFIG_CONFIG)$$:.config:S' \
 	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
 rm -f $(objtree)/.scmversion
 
-- 
2.20.1
