Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:53573 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbeJEPbG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Oct 2018 11:31:06 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Date: Fri,  5 Oct 2018 10:33:13 +0200
Message-Id: <20181005083313.2088252-1-arnd@arndb.de>
In-Reply-To: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, Arnd Bergmann <arnd@arndb.de>

Building any configuration with 'make W=1' produces a warning:

kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmissing-prototypes]

When also passing -Werror, this prevents us from building any
other files. Nobody ever calls the function, but we can't make
it 'static' either since we want the compiler output.

Calling it 'main' instead however avoids the warning, because gcc
does not insist on having a declaration for main.

Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I have run into this problem several times before, and thought I had
sent a fix at some point. Looking in the archives, I came across
the suggested fix from Kieran, so I'm following up on that here.
---
 kernel/bounds.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/bounds.c b/kernel/bounds.c
index c373e887c066..9795d75b09b2 100644
--- a/kernel/bounds.c
+++ b/kernel/bounds.c
@@ -13,7 +13,7 @@
 #include <linux/log2.h>
 #include <linux/spinlock_types.h>
 
-void foo(void)
+int main(void)
 {
 	/* The enum constants to put into include/generated/bounds.h */
 	DEFINE(NR_PAGEFLAGS, __NR_PAGEFLAGS);
@@ -23,4 +23,6 @@ void foo(void)
 #endif
 	DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
 	/* End of constants */
+
+	return 0;
 }
-- 
2.18.0
