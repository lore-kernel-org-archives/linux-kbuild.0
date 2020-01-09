Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34008 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgAIQR1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:17:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so8069094wrr.1
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:17:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] kconfig: ignore temporary generated files
Date: Thu,  9 Jan 2020 17:17:24 +0100
Message-Id: <20200109161724.9546-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

If building gconfig fails, a temporary gtk config file is left in the
kconfig directory and is not ignored by git. Add an appropriate pattern
to .gitignore.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 scripts/kconfig/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index b5bf92f66d11..d22e6753397d 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -3,6 +3,7 @@
 #
 *.moc
 *conf-cfg
+*conf-cfg.tmp
 
 #
 # configuration programs
-- 
2.23.0
