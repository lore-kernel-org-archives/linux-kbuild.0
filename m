Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:57027 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbfCINNC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Mar 2019 08:13:02 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Sat,  9 Mar 2019 16:12:35 +0300
Message-Id: <20190309131235.31823-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH] scripts/kconfig/Makefile: kvmconfig: use KCONFIG_CONFIG if set
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arseny Maslennikov <ar@cs.msu.ru>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <pvorel@suse.cz>

In a kernel source tree:

% make mrproper
% make KCONFIG_CONFIG=.myconfig kvmconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/preprocess.o
  LEX     scripts/kconfig/zconf.lex.c
  YACC    scripts/kconfig/zconf.tab.h
  HOSTCC  scripts/kconfig/zconf.lex.o
  YACC    scripts/kconfig/zconf.tab.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
The base file '.config' does not exist.  Exit.
make[1]: *** [scripts/kconfig/Makefile:96: kvm_guest.config] Error 1
make: *** [Makefile:538: kvmconfig] Error 2

Essentially `make kvmconfig' (and probably other similar targets)
did ignore KCONFIG_CONFIG set to a different filename.

If KCONFIG_CONFIG is set, use it; otherwise behave as if it was set
to `.config'.

Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 181973509a05..1c7ac07def4d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -93,7 +93,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 
 %.config: $(obj)/conf
 	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(configfiles)
 	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
 
 PHONY += kvmconfig
-- 
2.20.1
