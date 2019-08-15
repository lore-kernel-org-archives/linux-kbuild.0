Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f201.google.com ([209.85.214.201]:36718 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732034AbfHOW7K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 18:59:10 -0400
Received: by mail-pl1-f201.google.com with SMTP id a5so2163637pla.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 15:59:10 -0700 (PDT)
Date: Thu, 15 Aug 2019 15:58:44 -0700
In-Reply-To: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
Message-Id: <20190815225844.145726-1-nhuck@google.com>
Mime-Version: 1.0
References: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
Subject: [PATCH v2] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, joe@perches.com, miguel.ojeda.sandonis@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nathan Huckleberry <nhuck@google.com>, Nathan Chancellor <natechancellor@gmail.com>

Clang is updating to support -Wimplicit-fallthrough on C
https://reviews.llvm.org/D64838. Since clang does not
support the comment version of fallthrough annotations
this update causes an additional 50k warnings. Most
of these warnings (>49k) are duplicates from header files.

This patch is intended to be reverted after the warnings
have been cleaned up.

Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
---
Changes v1->v2
* Move code to preexisting ifdef
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..95973a1ee999 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -70,5 +70,6 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
+KBUILD_CFLAGS += $(call cc-option,-Wno-implicit-fallthrough)
 endif
 endif
-- 
2.23.0.rc1.153.gdeed80330f-goog
