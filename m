Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9020C433EF
	for <linux-kbuild@archiver.kernel.org>; Sat, 21 May 2022 09:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241352AbiEUJEr (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 21 May 2022 05:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiEUJEq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 May 2022 05:04:46 -0400
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAA9E8BA0
        for <linux-kbuild@vger.kernel.org>; Sat, 21 May 2022 02:04:44 -0700 (PDT)
Received: from pop-os.home ([86.243.180.246])
        by smtp.orange.fr with ESMTPA
        id sL2Nnv20T4LtqsL2NnX8nM; Sat, 21 May 2022 11:04:42 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 21 May 2022 11:04:42 +0200
X-ME-IP: 86.243.180.246
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dan.carpenter@oracle.com, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kbuild@vger.kernel.org
Subject: [RFC PATCH] kbuild: Add an option to enable -O1 and speed-up compilation time
Date:   Sat, 21 May 2022 11:04:29 +0200
Message-Id: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add a new compilation option which speeds-up compilation time.
This can be useful when using static checker such as smatch or build-bots.
In such cases, the speed and quality of the generated code is not
important.

Using -O0 would be even better, but unfortunately, building fails with
this option.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 Makefile     | 5 ++++-
 init/Kconfig | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1f8bef92868f..14467386f947 100644
--- a/Makefile
+++ b/Makefile
@@ -817,7 +817,10 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, address-of-packed-member)
 
-ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
+ifdef CONFIG_CC_OPTIMIZE_FOR_COMPILATION_SPEED
+KBUILD_CFLAGS += -O1
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 1
+else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
 KBUILD_CFLAGS += -O2
 KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 2
 else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
diff --git a/init/Kconfig b/init/Kconfig
index a96776a9b080..3177a1830c9a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1384,6 +1384,14 @@ choice
 	prompt "Compiler optimization level"
 	default CC_OPTIMIZE_FOR_PERFORMANCE
 
+config CC_OPTIMIZE_FOR_COMPILATION_SPEED
+	bool "Optimize for compilation speed (-O1)"
+	help
+	  This option can be useful when running a static checker such as smatch
+	  or a build-bot.
+	  Compilation time is slighly faster than -O2 and it requires less
+	  memory.
+
 config CC_OPTIMIZE_FOR_PERFORMANCE
 	bool "Optimize for performance (-O2)"
 	help
-- 
2.34.1

