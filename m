Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:53668 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgFWIHZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jun 2020 04:07:25 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] Revert "kbuild: Create directory for target DTB"
Date: Tue, 23 Jun 2020 17:05:49 +0900
Message-Id: <20200623080549.725632-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This reverts commit 77479b38e2f58890eb221a0418357502a5b41cd6.

Since commit 8a78756eb545 ("kbuild: create object directories simpler
and faster"), all directories for 'targets' are created.

'mkdir -p $(dir ${dtc-tmp})' is no longer needed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 99ac59c59826..94da02a57780 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -298,8 +298,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 	$(call if_changed,dt_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
-	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-- 
2.25.1
