Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:36632 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754837AbdCQAZB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Mar 2017 20:25:01 -0400
Received: by mail-pf0-f180.google.com with SMTP id o126so31667819pfb.3
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Mar 2017 17:25:00 -0700 (PDT)
From: Michael Davidson <md@google.com>
Subject: [PATCH 3/7] x86, LLVM: suppress clang warnings about unaligned accesses
Date: Thu, 16 Mar 2017 17:15:16 -0700
Message-Id: <20170317001520.85223-4-md@google.com>
In-Reply-To: <20170317001520.85223-1-md@google.com>
References: <20170317001520.85223-1-md@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Kaehlcke <mka@chromium.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, Michael Davidson <md@google.com>

Suppress clang warnings about potential unaliged accesses
to members in packed structs. This gets rid of almost 10,000
warnings about accesses to the ring 0 stack pointer in the TSS.

Signed-off-by: Michael Davidson <md@google.com>
---
 arch/x86/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 894a8d18bf97..7f21703c475d 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -128,6 +128,11 @@ endif
         KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args)
 endif
 
+ifeq ($(cc-name),clang)
+# Suppress clang warnings about potential unaligned accesses.
+KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
+endif
+
 ifdef CONFIG_X86_X32
 	x32_ld_ok := $(call try-run,\
 			/bin/echo -e '1: .quad 1b' | \
-- 
2.12.0.367.g23dc2f6d3c-goog

