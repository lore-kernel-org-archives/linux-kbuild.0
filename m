Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f67.google.com ([209.85.161.67]:34746 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfCRVKG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 17:10:06 -0400
Received: by mail-yw1-f67.google.com with SMTP id x129so14146291ywc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 14:10:06 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
MIME-Version: 1.0
Date: Mon, 18 Mar 2019 17:10:05 -0400
Message-ID: <CAG5bF+RvumzKK0E-GAT223jnBvkRe1RN_0J9cGpfPOqCBvfWyw@mail.gmail.com>
Subject: [PATCH] Revert "kbuild: use -Oz instead of -Os when using clang"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Behan Webster <behanw@converseincode.com>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <ndesaulniers@google.com>, Manoj Gupta <manojgupta@chromium.org>, Tiancong Wang <tcwang@chromium.org>, Stephen Hines <srhines@google.com>, clang-built-linux@googlegroups.com, Matthias Kaehlcke <mka@chromium.org>

The clang option -Oz enables *aggressive* optimization for size,
which doesn't necessarily result in smaller images, but can have
negative impact on performance. Switch back to the less aggressive
-Os.

This reverts commit 6748cb3c299de1ffbe56733647b01dbcc398c419.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9ef547fc7ffe..191f3ce3cb5e 100644
--- a/Makefile
+++ b/Makefile
@@ -667,7 +667,7 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, int-in-bool-context)

 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
-KBUILD_CFLAGS	+= $(call cc-option,-Oz,-Os)
+KBUILD_CFLAGS	+= -Os
 else
 KBUILD_CFLAGS   += -O2
 endif
-- 
2.21.0.225.g810b269d1ac-goog
