Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:34117 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752696AbdGFWBq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 18:01:46 -0400
Received: by mail-pf0-f171.google.com with SMTP id q85so7203403pfq.1
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jul 2017 15:01:45 -0700 (PDT)
From: Greg Hackmann <ghackmann@google.com>
Subject: [PATCH 4/4] kasan: add compiler support for clang
Date: Thu,  6 Jul 2017 15:01:14 -0700
Message-Id: <20170706220114.142438-5-ghackmann@google.com>
In-Reply-To: <20170706220114.142438-1-ghackmann@google.com>
References: <20170706220114.142438-1-ghackmann@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

For now we can hard-code ASAN ABI level 5, since historical clang builds
can't build the kernel anyway.  We also need to emulate gcc's
__SANITIZE_ADDRESS__ flag, or memset() calls won't be instrumented.

Signed-off-by: Greg Hackmann <ghackmann@google.com>
---
 include/linux/compiler-clang.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index d614c5ea1b5e..8153f793b22a 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -23,3 +23,13 @@
  */
 #undef inline
 #define inline inline __attribute__((unused)) notrace
+
+/* all clang versions usable with the kernel support KASAN ABI version 5
+ */
+#define KASAN_ABI_VERSION 5
+
+/* emulate gcc's __SANITIZE_ADDRESS__ flag
+ */
+#if __has_feature(address_sanitizer)
+#define __SANITIZE_ADDRESS__
+#endif
-- 
2.13.2.725.g09c95d1e9-goog

