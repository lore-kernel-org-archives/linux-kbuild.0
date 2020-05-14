Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728931AbgENSyE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 14:54:04 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 42/49] gcc-10: disable 'zero-length-bounds' warning for now
Date: Thu, 14 May 2020 14:53:03 -0400
Message-Id: <20200514185311.20294-42-sashal@kernel.org>
In-Reply-To: <20200514185311.20294-1-sashal@kernel.org>
References: <20200514185311.20294-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 5c45de21a2223fe46cf9488c99a7fbcf01527670 ]

This is a fine warning, but we still have a number of zero-length arrays
in the kernel that come from the traditional gcc extension.  Yes, they
are getting converted to flexible arrays, but in the meantime the gcc-10
warning about zero-length bounds is very verbose, and is hiding other
issues.

I missed one actual build failure because it was hidden among hundreds
of lines of warning.  Thankfully I caught it on the second go before
pushing things out, but it convinced me that I really need to disable
the new warnings for now.

We'll hopefully be all done with our conversion to flexible arrays in
the not too distant future, and we can then re-enable this warning.

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 68708ae07fbd3..49c74e8b55df4 100644
--- a/Makefile
+++ b/Makefile
@@ -857,6 +857,9 @@ KBUILD_CFLAGS += -Wno-pointer-sign
 # disable stringop warnings in gcc 8+
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
+# We'll want to enable this eventually, but it's not going away for 5.7 at least
+KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
+
 # Enabled with W=2, disabled by default as noisy
 KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
 
-- 
2.20.1
