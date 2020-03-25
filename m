Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:21065 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYDQ5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 23:16:57 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: add comment about grouped target
Date: Wed, 25 Mar 2020 12:16:30 +0900
Message-Id: <20200325031630.28512-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

GNU Make commit 8c888d95f618 ("[SV 8297] Implement "grouped targets"
for explicit rules.") added the '&:' syntax.

I think '&:' is a perfect fit here, but we cannot use it any time
soon. Just add a TODO comment.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 593d8f1bbe90..4fd51f045440 100644
--- a/Makefile
+++ b/Makefile
@@ -674,6 +674,7 @@ $(KCONFIG_CONFIG):
 #
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
+# (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
 %/auto.conf %/auto.conf.cmd: $(KCONFIG_CONFIG)
 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
 else # !may-sync-config
-- 
2.17.1
