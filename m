Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729093AbgFHXM2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 19:12:28 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 013/606] gcc-10: disable 'stringop-overflow' warning for now
Date: Mon,  8 Jun 2020 19:02:18 -0400
Message-Id: <20200608231211.3363633-13-sashal@kernel.org>
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>

commit 5a76021c2eff7fcf2f0918a08fd8a37ce7922921 upstream.

This is the final array bounds warning removal for gcc-10 for now.

Again, the warning is good, and we should re-enable all these warnings
when we have converted all the legacy array declaration cases to
flexible arrays. But in the meantime, it's just noise.

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index e7c2811856f1..8584003bfbca 100644
--- a/Makefile
+++ b/Makefile
@@ -860,6 +860,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 # We'll want to enable this eventually, but it's not going away for 5.7 at least
 KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
 KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
+KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 
 # Enabled with W=2, disabled by default as noisy
 KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
-- 
2.25.1
