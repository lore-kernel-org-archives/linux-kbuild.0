Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:25856 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbeLaEJ3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Dec 2018 23:09:29 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: clean up rule_dtc_dt_yaml
Date: Mon, 31 Dec 2018 13:09:00 +0900
Message-Id: <1546229340-19309-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 3a2429e1faf4 ("kbuild: change if_changed_rule for multi-line
recipe") and commit 4f0e3a57d6eb ("kbuild: Add support for DT binding
schema checks") came in via different sub-systems.

This is a follow-up cleanup.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ed1f83d..b44ae6c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -304,8 +304,8 @@ quiet_cmd_dtb_check =	CHECK   $@
       cmd_dtb_check =	$(DT_CHECKER) -p $(DT_TMP_SCHEMA) $@ ;
 
 define rule_dtc_dt_yaml
-	$(call cmd_and_fixdep,dtc,yaml)		\
-	$(call echo-cmd,dtb_check) $(cmd_dtb_check)
+	$(call cmd_and_fixdep,dtc,yaml)
+	$(call cmd,dtb_check)
 endef
 
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-- 
2.7.4
