Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:23930 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750909AbdKIPm5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 10:42:57 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] kbuild: optimize object directory creation for incremental build
Date: Fri, 10 Nov 2017 00:41:17 +0900
Message-Id: <1510242077-8122-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>

The previous commit largely optimized the object directory creation.
We can optimize it more for incremental build.

There are already *.cmd files in the output directory.  The existing
*.cmd files have been picked up by $(wildcard ...).  Obviously,
directories containing them exist too, so we can skip "mkdir -p".

With this, Kbuild runs almost zero "mkdir -p" in incremental building.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 89ac180..90ea7a5 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -583,8 +583,13 @@ endif
 ifneq ($(KBUILD_SRC),)
 # Create directories for object files if directory does not exist
 obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
+# If cmd_files exist, their directories apparently exist.  Skip mkdir.
+exist-dirs := $(sort $(patsubst %/,%, $(dir $(cmd_files))))
+obj-dirs := $(strip $(filter-out . $(exist-dirs), $(obj-dirs)))
+ifneq ($(obj-dirs),)
 $(shell mkdir -p $(obj-dirs))
 endif
+endif
 
 # Declare the contents of the .PHONY variable as phony.  We keep that
 # information in a variable se we can use it in if_changed and friends.
-- 
2.7.4

