Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35911 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbcKFWeB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Nov 2016 17:34:01 -0500
From: Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH V2] kbuild: add %/built-in.o target in top Makefile
Date: Sun,  6 Nov 2016 22:18:32 +0000
Message-Id: <1478470712-9872-1-git-send-email-richard.weiyang@gmail.com>
In-Reply-To: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
References: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>

Current kbuild just supports building built-in.o in second directory level
individually. There is no rule to build those built-in.o targets below
third directory level.

Even current kbuild system could achieve this with rule "%/", while this
not only builds built-in targes but also lib target, extra target and
module objects.

This patch adds the "%/built-in.o" rule so that each built-in.o in the
kernel tree could be the build target, which looks more consistent for the
kbuild system.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

---
v2
    . add FORCE in prerequest

---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index f97f786..9c65498 100644
--- a/Makefile
+++ b/Makefile
@@ -1638,6 +1638,8 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.symtypes: %.c prepare scripts FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+%/built-in.o: prepare scripts FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 
 # Modules
 /: prepare scripts FORCE
-- 
2.5.0

