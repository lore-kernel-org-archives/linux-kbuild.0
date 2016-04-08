Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:27166 "EHLO
	conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753061AbcDHCYg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Apr 2016 22:24:36 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: rename cmd_as_s_S to cmd_cpp_s_S
Date: Fri,  8 Apr 2016 11:24:48 +0900
Message-Id: <1460082288-31817-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1460082288-31817-1-git-send-email-yamada.masahiro@socionext.com>
References: <1460082288-31817-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

This command just preprocesses .S files into .s files, so cmd_cpp_s_S
seems more suitable.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 7e4df13..e65a3e9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -314,11 +314,11 @@ modkern_aflags := $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL)
 $(real-objs-m)      : modkern_aflags := $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE)
 $(real-objs-m:.o=.s): modkern_aflags := $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE)
 
-quiet_cmd_as_s_S = CPP $(quiet_modtag) $@
-cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $<
+quiet_cmd_cpp_s_S = CPP $(quiet_modtag) $@
+cmd_cpp_s_S       = $(CPP) $(a_flags) -o $@ $<
 
 $(obj)/%.s: $(src)/%.S FORCE
-	$(call if_changed_dep,as_s_S)
+	$(call if_changed_dep,cpp_s_S)
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
 cmd_as_o_S       = $(CC) $(a_flags) -c -o $@ $<
-- 
1.9.1

