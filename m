Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f202.google.com ([209.85.222.202]:40569 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbfBGWCx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 17:02:53 -0500
Received: by mail-qk1-f202.google.com with SMTP id y83so1387489qka.7
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Feb 2019 14:02:53 -0800 (PST)
Date: Thu,  7 Feb 2019 14:01:52 -0800
In-Reply-To: <20190207220155.81351-1-ndesaulniers@google.com>
Message-Id: <20190207220155.81351-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190207220155.81351-1-ndesaulniers@google.com>
Subject: [PATCH 4/4] Makefile: lld: set -O2 linker flag when linking with LLD
From: ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: Nick Desaulniers <ndesaulniers@google.com>, Rui Ueyama <ruiu@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

-O2 enables tail merging of string table strings.

For arm64:
0.34% size improvement with lld -O2 over lld for vmlinux.
3.30% size improvement with lld -O2 over lld for Image.lz4-dtb.

Link: https://github.com/ClangBuiltLinux/linux/issues/343
Suggested-by: Rui Ueyama <ruiu@google.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 6307c17259ea..c07208ec49d4 100644
--- a/Makefile
+++ b/Makefile
@@ -718,6 +718,10 @@ else
 KBUILD_CFLAGS += -Wno-unused-but-set-variable
 endif
 
+ifdef CONFIG_LD_IS_LLD
+KBUILD_LDFLAGS += -O2
+endif
+
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
-- 
2.20.1.791.gb4d0f1c61a-goog
