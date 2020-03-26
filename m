Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:19151 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgCZIEG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:04:06 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 13/16] crypto: curve25519 - do not pollute dispatcher based on assembler
Date: Thu, 26 Mar 2020 17:01:01 +0900
Message-Id: <20200326080104.27286-14-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, clang-built-linux@googlegroups.com, Masahiro Yamada <masahiroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Since we're doing a static inline dispatch here, we normally branch
based on whether or not there's an arch implementation. That would have
been fine in general, except the crypto Makefile prior used to turn
things off -- despite the Kconfig -- resulting in us needing to also
hard code various assembler things into the dispatcher too. The horror!
Now that the assembler config options are done by Kconfig, we can get
rid of the inconsistency.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 include/crypto/curve25519.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/crypto/curve25519.h b/include/crypto/curve25519.h
index 9ecb3c1f0f15..4e6dc840b159 100644
--- a/include/crypto/curve25519.h
+++ b/include/crypto/curve25519.h
@@ -33,8 +33,7 @@ bool __must_check curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 			     const u8 secret[CURVE25519_KEY_SIZE],
 			     const u8 basepoint[CURVE25519_KEY_SIZE])
 {
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519) &&
-	    (!IS_ENABLED(CONFIG_CRYPTO_CURVE25519_X86) || IS_ENABLED(CONFIG_AS_ADX)))
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
 		curve25519_arch(mypublic, secret, basepoint);
 	else
 		curve25519_generic(mypublic, secret, basepoint);
@@ -50,8 +49,7 @@ __must_check curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
 				    CURVE25519_KEY_SIZE)))
 		return false;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519) &&
-	    (!IS_ENABLED(CONFIG_CRYPTO_CURVE25519_X86) || IS_ENABLED(CONFIG_AS_ADX)))
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
 		curve25519_base_arch(pub, secret);
 	else
 		curve25519_generic(pub, secret, curve25519_base_point);
-- 
2.17.1
