Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:44602 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751451AbeFWN6N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 09:58:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/3] kbuild: do not update config for 'make kernelrelease'
Date: Sat, 23 Jun 2018 22:56:09 +0900
Message-Id: <1529762169-13488-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1529762169-13488-1-git-send-email-yamada.masahiro@socionext.com>
References: <1529762169-13488-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

'make kernelrelease' depends on CONFIG_LOCALVERSION(_AUTO), but
for the same reason as install targets, we do not want to update
the configuration just for printing the kernelrelease string.

This is likely to happen when you compiled the kernel with
CROSS_COMPILE, but forget to pass it to 'make kernelrelease'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f1e06fba..bb7394a 100644
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

