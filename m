Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:44157 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPNaF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 09:30:05 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: test headers listed in header-test-m as well
Date: Tue, 16 Jul 2019 22:29:45 +0900
Message-Id: <20190716132946.1057-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

It will be useful to control the header-test by a tristate option.

If CONFIG_FOO is a tristate option, you can write like this:

  header-test-$(CONFIG_FOO) += foo.h

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8c39dade265c..0d434d0afc0b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -291,7 +291,7 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
-# header test (header-test-y target)
+# header test (header-test-y, header-test-m target)
 # ---------------------------------------------------------------------------
 
 quiet_cmd_cc_s_h = CC      $@
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 6cb3aa5cbc79..5241d0751eb0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -78,7 +78,7 @@ header-test-y	+= $(filter-out $(header-test-), \
 		$(wildcard $(addprefix $(srctree)/$(src)/, \
 		$(header-test-pattern-y)))))
 
-extra-$(CONFIG_HEADER_TEST) += $(addsuffix .s, $(header-test-y))
+extra-$(CONFIG_HEADER_TEST) += $(addsuffix .s, $(header-test-y) $(header-test-m))
 
 # Add subdir path
 
-- 
2.17.1
