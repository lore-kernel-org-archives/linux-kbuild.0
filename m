Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f201.google.com ([209.85.222.201]:43771 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388289AbfBKTat (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:30:49 -0500
Received: by mail-qk1-f201.google.com with SMTP id a11so2119358qkk.10
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:30:48 -0800 (PST)
Date: Mon, 11 Feb 2019 11:30:06 -0800
In-Reply-To: <20190211193008.24101-1-ndesaulniers@google.com>
Message-Id: <20190211193008.24101-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com>
Subject: [PATCH v2 4/4] Makefile: lld: set -O2 linker flag when linking with LLD
From: ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: natechancellor@gmail.com, sedat.dilek@gmail.com, keescook@chromium.org, samitolvanen@google.com, michal.lkml@markovi.net, akpm@linux-foundation.org, hannes@cmpxchg.org, peterz@infradead.org, linux@dominikbrodowski.net, npiggin@gmail.com, mathieu.desnoyers@efficios.com, gor@linux.ibm.com, adrian@lisas.de, rgb@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Rui Ueyama <ruiu@google.com>

For arm64:
0.34% size improvement with lld -O2 over lld for vmlinux.
3.3% size improvement with lld -O2 over lld for Image.lz4-dtb.

Link: https://github.com/ClangBuiltLinux/linux/issues/343
Suggested-by: Rui Ueyama <ruiu@google.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1->V2:
* add tested and reviewed by tags.

 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 00e8e01d23fc..8011555745aa 100644
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
