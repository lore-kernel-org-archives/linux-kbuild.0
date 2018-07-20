Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28419 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbeGTIe5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:34:57 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 10/11] kbuild: do not update config for 'make kernelrelease'
Date: Fri, 20 Jul 2018 16:46:35 +0900
Message-Id: <1532072796-7947-11-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

'make kernelrelease' depends on CONFIG_LOCALVERSION(_AUTO), but
for the same reason as install targets, we do not want to update
the configuration just for printing the kernelrelease string.

This is likely to happen when you compiled the kernel with
CROSS_COMPILE, but forget to pass it to 'make kernelrelease'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ad83917..0ec1c27 100644
--- a/Makefile
+++ b/Makefile
@@ -225,7 +225,8 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers_% archheaders archscripts \
 			 kernelversion %src-pkg
-no-sync-config-targets := $(no-dot-config-targets) install %install
+no-sync-config-targets := $(no-dot-config-targets) install %install \
+			   kernelrelease
 
 config-targets  := 0
 mixed-targets   := 0
-- 
2.7.4

