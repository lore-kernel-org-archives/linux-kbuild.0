Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:21221 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753045AbeAKNj4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:39:56 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kconfig: make input_mode static
Date: Thu, 11 Jan 2018 22:39:39 +0900
Message-Id: <1515677981-21952-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Sparse reports:
  warning: symbol 'input_mode' was not declared. Should it be static?

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 8b9cdf4..31c09c6 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -35,7 +35,8 @@ enum input_mode {
 	savedefconfig,
 	listnewconfig,
 	olddefconfig,
-} input_mode = oldaskconfig;
+};
+static enum input_mode input_mode = oldaskconfig;
 
 static int indent = 1;
 static int tty_stdio;
-- 
2.7.4

