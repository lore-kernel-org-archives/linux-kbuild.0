Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:55292 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbdJCScc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 14:32:32 -0400
Received: by mail-pg0-f53.google.com with SMTP id c137so5175987pga.11
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Oct 2017 11:32:32 -0700 (PDT)
Date: Tue, 3 Oct 2017 11:32:28 -0700
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] Makefile: Fix CONFIG_CC_STACKPROTECTOR_AUTO to not enable SSP
Message-ID: <20171003183228.GA142273@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-hardening@lists.openwall.com

There was a think-o in the logic for CONFIG_CC_STACKPROTECTOR_AUTO, which
would leave CONFIG_CC_STACKPROTECTOR defined when a compiler didn't support
stack-protector. This usually won't cause a problem with a build, but it's
not correct, and shouldn't happen.

Reported-by: Mark Rutland <mark.rutland@arm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Andrew, if possible, can you squash this as a fix for the mmots patch
"makefile-introduce-config_cc_stackprotector_auto.patch"? If not, that's fine.
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9bd334b35003..2f8ff79fa9a5 100644
--- a/Makefile
+++ b/Makefile
@@ -693,14 +693,18 @@ else
 endif
 endif
 endif
+# If stack-protection was requested (and available, in the case of _AUTO),
+# then prepare the build for it being enabled.
 ifdef stackp-name
-  # If the stack protector has been selected, inform the rest of the build.
+ifneq ($(stackp-flag),)
+  # If the stack protector is active, enable code that depends on it.
   KBUILD_CFLAGS += -DCONFIG_CC_STACKPROTECTOR
   KBUILD_AFLAGS += -DCONFIG_CC_STACKPROTECTOR
   # Find arch-specific stack protector compiler sanity-checking script.
   stackp-path := $(srctree)/scripts/gcc-$(SRCARCH)_$(BITS)-has-stack-protector.sh
   stackp-check := $(wildcard $(stackp-path))
 endif
+endif
 KBUILD_CFLAGS += $(stackp-flag)
 
 ifeq ($(cc-name),clang)
-- 
2.7.4


-- 
Kees Cook
Pixel Security
