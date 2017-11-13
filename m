Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40664 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752338AbdKMKbg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:31:36 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 5/6] kbuild: optimize object directory creation for incremental build
Date: Mon, 13 Nov 2017 19:29:38 +0900
Message-Id: <1510568979-24440-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The previous commit largely optimized the object directory creation.
We can optimize it more for incremental build.

There are already *.cmd files in the output directory.  The existing
*.cmd files have been picked up by $(wildcard ...).  Obviously,
directories containing them exist too, so we can skip "mkdir -p".

With this, Kbuild runs almost zero "mkdir -p" in incremental building.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Remove "." from the filter-out list

 scripts/Makefile.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 496ecd8..8624924 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -583,8 +583,13 @@ endif
 ifneq ($(KBUILD_SRC),)
 # Create directories for object files if they do not exist
 obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
+# If cmd_files exist, their directories apparently exist.  Skip mkdir.
+exist-dirs := $(sort $(patsubst %/,%, $(dir $(cmd_files))))
+obj-dirs := $(strip $(filter-out $(exist-dirs), $(obj-dirs)))
+ifneq ($(obj-dirs),)
 $(shell mkdir -p $(obj-dirs))
 endif
+endif
 
 # Declare the contents of the .PHONY variable as phony.  We keep that
 # information in a variable se we can use it in if_changed and friends.
-- 
2.7.4

