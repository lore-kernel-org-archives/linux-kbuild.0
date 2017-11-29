Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:40454 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752217AbdK2VvY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 16:51:24 -0500
Received: by mail-it0-f65.google.com with SMTP id f190so5987503ita.5
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 13:51:24 -0800 (PST)
From: Paul Lawrence <paullawrence@google.com>
Subject: [PATCH v2 5/5] kasan: add compiler support for clang
Date: Wed, 29 Nov 2017 13:50:50 -0800
Message-Id: <20171129215050.158653-6-paullawrence@google.com>
In-Reply-To: <20171129215050.158653-1-paullawrence@google.com>
References: <20171129215050.158653-1-paullawrence@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Paul Lawrence <paullawrence@google.com>

For now we can hard-code ASAN ABI level 5, since historical clang builds
can't build the kernel anyway.  We also need to emulate gcc's
__SANITIZE_ADDRESS__ flag, or memset() calls won't be instrumented.

Signed-off-by: Greg Hackmann <ghackmann@google.com>
Signed-off-by: Paul Lawrence <paullawrence@google.com>

---
 include/linux/compiler-clang.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index 3b609edffa8f..d02a4df3f473 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -19,3 +19,11 @@
 
 #define randomized_struct_fields_start	struct {
 #define randomized_struct_fields_end	};
+
+/* all clang versions usable with the kernel support KASAN ABI version 5 */
+#define KASAN_ABI_VERSION 5
+
+/* emulate gcc's __SANITIZE_ADDRESS__ flag */
+#if __has_feature(address_sanitizer)
+#define __SANITIZE_ADDRESS__
+#endif
-- 
2.15.0.531.g2ccb3012c9-goog

