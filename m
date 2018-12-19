Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41298 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728426AbeLSORw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Dec 2018 09:17:52 -0500
From: Miroslav Benes <mbenes@suse.cz>
Subject: [PATCH] kbuild: use -flive-patching when CONFIG_LIVEPATCH is enabled
Date: Wed, 19 Dec 2018 15:17:44 +0100
Message-Id: <20181219141744.32392-1-mbenes@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, jpoimboe@redhat.com, jeyu@kernel.org, jikos@kernel.org
Cc: pmladek@suse.com, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>

GCC 9 introduces a new option, -flive-patching. It disables certain
optimizations which could make a compilation unsafe for later live
patching of the running kernel.

The option is used only if CONFIG_LIVEPATCH is enabled and $(CC)
supports it.

Signed-off-by: Miroslav Benes <mbenes@suse.cz>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index a0650bf79606..53f5ab810efe 100644
--- a/Makefile
+++ b/Makefile
@@ -778,6 +778,10 @@ KBUILD_CFLAGS_KERNEL	+= $(call cc-option,-ffunction-sections,)
 KBUILD_CFLAGS_KERNEL	+= $(call cc-option,-fdata-sections,)
 endif
 
+ifdef CONFIG_LIVEPATCH
+KBUILD_CFLAGS += $(call cc-option, -flive-patching=inline-clone)
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
-- 
2.19.2
