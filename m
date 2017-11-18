Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:2245 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1424157AbdKRLX5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Nov 2017 06:23:57 -0500
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH RFC] kbuild: improvement in Makefile.modbuiltin
Date: Sat, 18 Nov 2017 19:23:13 +0800
Message-ID: <20171118112313.13557-1-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net

Drop unnecessary "__subdir-Y" and `cat /dev/null`

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
Don't know why they exist, but a simple build is fine without them
in my test

 scripts/Makefile.modbuiltin | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
index a763b4775d06..cbb1e3dc1ef9 100644
--- a/scripts/Makefile.modbuiltin
+++ b/scripts/Makefile.modbuiltin
@@ -26,8 +26,7 @@ kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbui
 include $(kbuild-file)
 
 include scripts/Makefile.lib
-__subdir-Y     := $(patsubst %/,%,$(filter %/, $(obj-Y)))
-subdir-Y       += $(__subdir-Y)
+subdir-Y       := $(patsubst %/,%,$(filter %/, $(obj-Y)))
 subdir-ym      := $(sort $(subdir-y) $(subdir-Y) $(subdir-m))
 subdir-ym      := $(addprefix $(obj)/,$(subdir-ym))
 obj-Y          := $(addprefix $(obj)/,$(obj-Y))
@@ -41,7 +40,7 @@ __modbuiltin: $(modbuiltin-target) $(subdir-ym)
 
 $(modbuiltin-target): $(subdir-ym) FORCE
 	$(Q)(for m in $(modbuiltin-mods); do echo kernel/$$m; done;	\
-	cat /dev/null $(modbuiltin-subdirs)) > $@
+	cat $(modbuiltin-subdirs)) > $@
 
 PHONY += FORCE
 
-- 
2.13.6



