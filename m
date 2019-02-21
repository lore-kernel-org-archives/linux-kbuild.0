Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:54283 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbfBUWTV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Feb 2019 17:19:21 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Fri, 22 Feb 2019 00:58:57 +0300
Message-Id: <20190221215901.23970-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH] scripts/package/Makefile: put proper config in source tarball
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arseny Maslennikov <ar@cs.msu.ru>, Riku Voipio <riku.voipio@linaro.org>

It is widely known that one can build a kernel without a .config in the
source tree by setting KCONFIG_CONFIG equal to the actual configuration
file path.

When making a *-pkg target, make(1) prepares a source tarball and tries
to pack `.config' in there regardless of the value of KCONFIG_CONFIG,
failing spectacularly if .config is absent and packing the wrong config
if it exists.
Let's fix that.

Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
---
 scripts/package/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 453fecee62f0..100a0d28ad25 100644
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
 
-- 
2.20.1
