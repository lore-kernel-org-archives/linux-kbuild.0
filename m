Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:55904 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058AbaCFR7c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Mar 2014 12:59:32 -0500
Received: by mail-pd0-f174.google.com with SMTP id y13so2839422pdi.19
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Mar 2014 09:59:31 -0800 (PST)
From: behanw@converseincode.com
Subject: [PATCH 2/5 v2] kbuild: LLVMLinux: Adapt warnings for compilation with clang
Date: Thu,  6 Mar 2014 09:59:23 -0800
Message-Id: <1394128763-2976-1-git-send-email-behanw@converseincode.com>
In-Reply-To: <1393376923-21892-3-git-send-email-behanw@converseincode.com>
References: <1393376923-21892-3-git-send-email-behanw@converseincode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw2@infradead.org, pageexec@freemail.hu, =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>, Behan Webster <behanw@converseincode.com>, Mark Charlebois <mcharleb@gmail.com>

From: Jan-Simon Möller <dl9pf@gmx.de>

When compiling kernel with clang, disable warnings which are too noisy, and
add the clang flag catch-undefined-behavior.

Re-enable warnings for self-assigns due to David Jones removing most of them
already from the kernel code base.

Signed-off-by: Jan-Simon Möller <dl9pf@gmx.de>
Signed-off-by: Behan Webster <behanw@converseincode.com>
Signed-off-by: Mark Charlebois <mcharleb@gmail.com>
Cc: PaX Team <pageexec@freemail.hu>
---
 scripts/Makefile.build | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d5d859c..5cd6651 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -65,12 +65,22 @@ warning-  := $(empty)
 warning-1 := -Wextra -Wunused -Wno-unused-parameter
 warning-1 += -Wmissing-declarations
 warning-1 += -Wmissing-format-attribute
-warning-1 += -Wmissing-prototypes
+warning-1 += $(call cc-option, -Wmissing-prototypes)
 warning-1 += -Wold-style-definition
 warning-1 += $(call cc-option, -Wmissing-include-dirs)
 warning-1 += $(call cc-option, -Wunused-but-set-variable)
 warning-1 += $(call cc-disable-warning, missing-field-initializers)
 
+# Clang
+warning-1 += $(call cc-disable-warning, initializer-overrides)
+warning-1 += $(call cc-disable-warning, unused-value)
+warning-1 += $(call cc-disable-warning, format)
+warning-1 += $(call cc-disable-warning, unknown-warning-option)
+warning-1 += $(call cc-disable-warning, sign-compare)
+warning-1 += $(call cc-disable-warning, format-zero-length)
+warning-1 += $(call cc-disable-warning, uninitialized)
+warning-1 += $(call cc-option, -fcatch-undefined-behavior)
+
 warning-2 := -Waggregate-return
 warning-2 += -Wcast-align
 warning-2 += -Wdisabled-optimization
-- 
1.8.3.2

