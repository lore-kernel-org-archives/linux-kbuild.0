Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36410 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752024AbcFZPaL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Jun 2016 11:30:11 -0400
Received: by mail-wm0-f68.google.com with SMTP id c82so18268800wme.3
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jun 2016 08:30:11 -0700 (PDT)
Date: Sun, 26 Jun 2016 17:36:43 +0200
From: Emese Revfy <re.emese@gmail.com>
Subject: [PATCH] Automate make rule generation for gcc plugin objects
Message-Id: <20160626173643.c05fd4d559ee9214ad1253c6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: keescook@chromium.org
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, kernel-hardening@lists.openwall.com, pageexec@freemail.hu


Reported-by: PaX Team <pageexec@freemail.hu>
Signed-off-by: Emese Revfy <re.emese@gmail.com>
---
 scripts/gcc-plugins/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index a3f8ca4a..898449d 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -20,9 +20,6 @@ endif
 
 $(HOSTLIBS)-y := $(GCC_PLUGIN)
 always := $($(HOSTLIBS)-y)
-
-cyc_complexity_plugin-objs := cyc_complexity_plugin.o
-sancov_plugin-objs := sancov_plugin.o
-latent_entropy_plugin-objs := latent_entropy_plugin.o
+$(foreach p,$($(HOSTLIBS)-y:%.so=%),$(eval $(p)-objs := $(p).o))
 
 clean-files += *.so
-- 
2.8.1
