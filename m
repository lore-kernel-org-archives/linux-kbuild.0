Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.zx2c4.com ([192.95.5.64]:51045 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgEKV53 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 17:57:29 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] Kconfig: default to CC_OPTIMIZE_FOR_PERFORMANCE_O3 for gcc >= 10
Date: Mon, 11 May 2020 15:57:20 -0600
Message-Id: <20200511215720.303181-1-Jason@zx2c4.com>
In-Reply-To: <20200508090202.7s3kcqpvpxx32syu@butterfly.localdomain>
References: <20200508090202.7s3kcqpvpxx32syu@butterfly.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, stable@vger.kernel.org, hjl.tools@gmail.com, Peter Zijlstra <peterz@infradead.org>, Jakub Jelinek <jakub@redhat.com>, Oleksandr Natalenko <oleksandr@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, David Laight <David.Laight@aculab.com>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

GCC 10 appears to have changed -O2 in order to make compilation time
faster when using -flto, seemingly at the expense of performance, in
particular with regards to how the inliner works. Since -O3 these days
shouldn't have the same set of bugs as 10 years ago, this commit
defaults new kernel compiles to -O3 when using gcc >= 10.

Cc: linux-kbuild@vger.kernel.org
Cc: x86@kernel.org
Cc: stable@vger.kernel.org
Cc: hjl.tools@gmail.com
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Jakub Jelinek <jakub@redhat.com>
Cc: Oleksandr Natalenko <oleksandr@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Changes v1->v2:
 - [Oleksandr] Remove O3 dependency on ARC.

 init/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 9e22ee8fbd75..f76ec3ccc883 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1245,7 +1245,8 @@ config BOOT_CONFIG
 
 choice
 	prompt "Compiler optimization level"
-	default CC_OPTIMIZE_FOR_PERFORMANCE
+	default CC_OPTIMIZE_FOR_PERFORMANCE_O3 if GCC_VERSION >= 100000
+	default CC_OPTIMIZE_FOR_PERFORMANCE if (GCC_VERSION < 100000 || CC_IS_CLANG)
 
 config CC_OPTIMIZE_FOR_PERFORMANCE
 	bool "Optimize for performance (-O2)"
@@ -1256,7 +1257,6 @@ config CC_OPTIMIZE_FOR_PERFORMANCE
 
 config CC_OPTIMIZE_FOR_PERFORMANCE_O3
 	bool "Optimize more for performance (-O3)"
-	depends on ARC
 	imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
 	help
 	  Choosing this option will pass "-O3" to your compiler to optimize
-- 
2.26.2
