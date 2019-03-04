Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:51197 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbfCDQ6A (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Mar 2019 11:58:00 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Mon,  4 Mar 2019 19:57:31 +0300
Message-Id: <20190304165732.24043-3-ar@cs.msu.ru>
In-Reply-To: <20190304165732.24043-1-ar@cs.msu.ru>
References: <20190304165732.24043-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH 2/3] Makefile: kselftest: use KCONFIG_CONFIG
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Arseny Maslennikov <ar@cs.msu.ru>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-um@lists.infradead.org

If the config file is reassigned through the KCONFIG_CONFIG
makeflag/envvar, this rule still attempts to use the wrong, possibly
nonexistent file.
Let's fix that.

Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d5713e7b1e50..4d8760166a47 100644
--- a/Makefile
+++ b/Makefile
@@ -1199,9 +1199,9 @@ kselftest-clean:
 
 PHONY += kselftest-merge
 kselftest-merge:
-	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
+	$(if $(wildcard $(objtree)/$(KCONFIG_CONFIG)),, $(error No $(KCONFIG_CONFIG) exists, config your kernel first!))
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m $(objtree)/.config \
+		-m $(objtree)/$(KCONFIG_CONFIG) \
 		$(srctree)/tools/testing/selftests/*/config
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
-- 
2.20.1
