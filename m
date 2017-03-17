Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:33927 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752191AbdCQBZN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Mar 2017 21:25:13 -0400
Received: by mail-pg0-f45.google.com with SMTP id 141so33213561pgd.1
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Mar 2017 18:24:50 -0700 (PDT)
From: Michael Davidson <md@google.com>
Subject: [PATCH 1/7] Makefile, LLVM: add -no-integrated-as to KBUILD_[AC]FLAGS
Date: Thu, 16 Mar 2017 17:15:14 -0700
Message-Id: <20170317001520.85223-2-md@google.com>
In-Reply-To: <20170317001520.85223-1-md@google.com>
References: <20170317001520.85223-1-md@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Kaehlcke <mka@chromium.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, Michael Davidson <md@google.com>

Add -no-integrated-as to KBUILD_AFLAGS and KBUILD_CFLAGS
for clang.

Signed-off-by: Michael Davidson <md@google.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index b841fb36beb2..b21fd0ca2946 100644
--- a/Makefile
+++ b/Makefile
@@ -704,6 +704,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
+KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
+KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.12.0.367.g23dc2f6d3c-goog

