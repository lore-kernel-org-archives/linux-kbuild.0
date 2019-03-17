Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:16980 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfCQGFM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Mar 2019 02:05:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: remove stale lxdialog/.gitignore
Date: Sun, 17 Mar 2019 15:05:03 +0900
Message-Id: <1552802703-14203-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

When this .gitignore was added, lxdialog was an independent hostprogs-y.

Now that all objects in lxdialog/ are directly linked to mconf, the
lxdialog is no longer generated.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/lxdialog/.gitignore | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 scripts/kconfig/lxdialog/.gitignore

diff --git a/scripts/kconfig/lxdialog/.gitignore b/scripts/kconfig/lxdialog/.gitignore
deleted file mode 100644
index 90b08ff..0000000
--- a/scripts/kconfig/lxdialog/.gitignore
+++ /dev/null
@@ -1,4 +0,0 @@
-#
-# Generated files
-#
-lxdialog
-- 
2.7.4
