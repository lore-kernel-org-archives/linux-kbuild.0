Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:33296 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S947198AbdDTTmp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Apr 2017 15:42:45 -0400
Received: by mail-io0-f175.google.com with SMTP id k87so84139139ioi.0
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Apr 2017 12:42:45 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH RESEND] Makefile, LLVM: add -no-integrated-as to KBUILD_[AC]FLAGS
Date: Thu, 20 Apr 2017 12:42:00 -0700
Message-Id: <20170420194200.108884-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Matthias Kaehlcke <mka@chromium.org>

From: Michael Davidson <md@google.com>

Add -no-integrated-as to KBUILD_AFLAGS and KBUILD_CFLAGS
for clang.

Signed-off-by: Michael Davidson <md@google.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 5039b9148d15..3832c8243334 100644
--- a/Makefile
+++ b/Makefile
@@ -710,6 +710,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
+KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
+KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.12.2.816.g2cccc81164-goog

