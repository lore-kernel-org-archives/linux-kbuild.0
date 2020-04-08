Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43829 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgDHV4B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:56:01 -0400
From: Nick Terrell <nickrterrell@gmail.com>
Subject: [PATCH v5 2/8] lib: prepare xxhash for preboot environment
Date: Wed,  8 Apr 2020 14:57:05 -0700
Message-Id: <20200408215711.137639-3-nickrterrell@gmail.com>
In-Reply-To: <20200408215711.137639-1-nickrterrell@gmail.com>
References: <20200408215711.137639-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Nick Terrell <nickrterrell@gmail.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>

From: Nick Terrell <terrelln@fb.com>

Don't export symbols if XXH_PREBOOT is defined.

This change is necessary to get xxhash to work in a preboot environment,
which is needed to support zstd-compressed kernels.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 lib/xxhash.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/xxhash.c b/lib/xxhash.c
index aa61e2a3802f..b4364e011392 100644
--- a/lib/xxhash.c
+++ b/lib/xxhash.c
@@ -80,13 +80,11 @@ void xxh32_copy_state(struct xxh32_state *dst, const struct xxh32_state *src)
 {
 	memcpy(dst, src, sizeof(*dst));
 }
-EXPORT_SYMBOL(xxh32_copy_state);
 
 void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state *src)
 {
 	memcpy(dst, src, sizeof(*dst));
 }
-EXPORT_SYMBOL(xxh64_copy_state);
 
 /*-***************************
  * Simple Hash Functions
@@ -151,7 +149,6 @@ uint32_t xxh32(const void *input, const size_t len, const uint32_t seed)
 
 	return h32;
 }
-EXPORT_SYMBOL(xxh32);
 
 static uint64_t xxh64_round(uint64_t acc, const uint64_t input)
 {
@@ -234,7 +231,6 @@ uint64_t xxh64(const void *input, const size_t len, const uint64_t seed)
 
 	return h64;
 }
-EXPORT_SYMBOL(xxh64);
 
 /*-**************************************************
  * Advanced Hash Functions
@@ -251,7 +247,6 @@ void xxh32_reset(struct xxh32_state *statePtr, const uint32_t seed)
 	state.v4 = seed - PRIME32_1;
 	memcpy(statePtr, &state, sizeof(state));
 }
-EXPORT_SYMBOL(xxh32_reset);
 
 void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
 {
@@ -265,7 +260,6 @@ void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
 	state.v4 = seed - PRIME64_1;
 	memcpy(statePtr, &state, sizeof(state));
 }
-EXPORT_SYMBOL(xxh64_reset);
 
 int xxh32_update(struct xxh32_state *state, const void *input, const size_t len)
 {
@@ -334,7 +328,6 @@ int xxh32_update(struct xxh32_state *state, const void *input, const size_t len)
 
 	return 0;
 }
-EXPORT_SYMBOL(xxh32_update);
 
 uint32_t xxh32_digest(const struct xxh32_state *state)
 {
@@ -372,7 +365,6 @@ uint32_t xxh32_digest(const struct xxh32_state *state)
 
 	return h32;
 }
-EXPORT_SYMBOL(xxh32_digest);
 
 int xxh64_update(struct xxh64_state *state, const void *input, const size_t len)
 {
@@ -439,7 +431,6 @@ int xxh64_update(struct xxh64_state *state, const void *input, const size_t len)
 
 	return 0;
 }
-EXPORT_SYMBOL(xxh64_update);
 
 uint64_t xxh64_digest(const struct xxh64_state *state)
 {
@@ -494,7 +485,19 @@ uint64_t xxh64_digest(const struct xxh64_state *state)
 
 	return h64;
 }
+
+#ifndef XXH_PREBOOT
+EXPORT_SYMBOL(xxh32_copy_state);
+EXPORT_SYMBOL(xxh64_copy_state);
+EXPORT_SYMBOL(xxh32);
+EXPORT_SYMBOL(xxh64);
+EXPORT_SYMBOL(xxh32_reset);
+EXPORT_SYMBOL(xxh64_reset);
+EXPORT_SYMBOL(xxh32_update);
+EXPORT_SYMBOL(xxh32_digest);
+EXPORT_SYMBOL(xxh64_update);
 EXPORT_SYMBOL(xxh64_digest);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("xxHash");
+#endif
-- 
2.26.0
