Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f195.google.com ([209.85.166.195]:35310 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388752AbfETPTA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 11:19:00 -0400
Received: by mail-it1-f195.google.com with SMTP id u186so23732696ith.0
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2019 08:18:59 -0700 (PDT)
From: Dan Rue <dan.rue@linaro.org>
Subject: [PATCH] kbuild: teach kselftest-merge to find nested config files
Date: Mon, 20 May 2019 10:16:14 -0500
Message-Id: <20190520151614.19188-1-dan.rue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dan.rue@linaro.org
Cc: linux-kselftest@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Current implementation of kselftest-merge only finds config files that
are one level deep using `$(srctree)/tools/testing/selftests/*/config`.

Often, config files are added in nested directories, and do not get
picked up by kselftest-merge.

Use `find` to catch all config files under
`$(srctree)/tools/testing/selftests` instead.

Signed-off-by: Dan Rue <dan.rue@linaro.org>
---
 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index a45f84a7e811..e99e7f9484af 100644
--- a/Makefile
+++ b/Makefile
@@ -1228,9 +1228,8 @@ kselftest-clean:
 PHONY += kselftest-merge
 kselftest-merge:
 	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m $(objtree)/.config \
-		$(srctree)/tools/testing/selftests/*/config
+	$(Q)find $(srctree)/tools/testing/selftests -name config | \
+		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 # ---------------------------------------------------------------------------
-- 
2.21.0
