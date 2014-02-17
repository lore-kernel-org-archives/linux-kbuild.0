Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:58701 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751154AbaBQJmv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Feb 2014 04:42:51 -0500
Received: by mail-lb0-f171.google.com with SMTP id c11so11305272lbj.30
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2014 01:42:50 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] Makefile: fix extra parenthesis typo when CC_STACKPROTECTOR_REGULAR is enabled
Date: Mon, 17 Feb 2014 11:42:47 +0200
Message-Id: <1392630167-26317-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Kees Cook <keescook@chromium.org>, Fathi Boudra <fathi.boudra@linaro.org>

extra parenthesis typo introduced in commit 19952a9203 is causing
the following error when CONFIG_CC_STACKPROTECTOR_REGULAR is enabled:
Makefile:608: Cannot use CONFIG_CC_STACKPROTECTOR: -fstack-protector not
supported by compiler
Makefile:608: *** missing separator.  Stop.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 893d6f0..eeaf3e7 100644
--- a/Makefile
+++ b/Makefile
@@ -606,7 +606,7 @@ ifdef CONFIG_CC_STACKPROTECTOR_REGULAR
   stackp-flag := -fstack-protector
   ifeq ($(call cc-option, $(stackp-flag)),)
     $(warning Cannot use CONFIG_CC_STACKPROTECTOR: \
-	      -fstack-protector not supported by compiler))
+	      -fstack-protector not supported by compiler)
   endif
 else ifdef CONFIG_CC_STACKPROTECTOR_STRONG
   stackp-flag := -fstack-protector-strong
-- 
1.8.1.2

