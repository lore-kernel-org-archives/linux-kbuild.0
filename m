Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728475AbgENSxA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 14:53:00 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 56/62] gcc-10: disable 'array-bounds' warning for now
Date: Thu, 14 May 2020 14:51:41 -0400
Message-Id: <20200514185147.19716-56-sashal@kernel.org>
In-Reply-To: <20200514185147.19716-1-sashal@kernel.org>
References: <20200514185147.19716-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 44720996e2d79e47d508b0abe99b931a726a3197 ]

This is another fine warning, related to the 'zero-length-bounds' one,
but hitting the same historical code in the kernel.

Because C didn't historically support flexible array members, we have
code that instead uses a one-sized array, the same way we have cases of
zero-sized arrays.

The one-sized arrays come from either not wanting to use the gcc
zero-sized array extension, or from a slight convenience-feature, where
particularly for strings, the size of the structure now includes the
allocation for the final NUL character.

So with a "char name[1];" at the end of a structure, you can do things
like

       v = my_malloc(sizeof(struct vendor) + strlen(name));

and avoid the "+1" for the terminator.

Yes, the modern way to do that is with a flexible array, and using
'offsetof()' instead of 'sizeof()', and adding the "+1" by hand.  That
also technically gets the size "more correct" in that it avoids any
alignment (and thus padding) issues, but this is another long-term
cleanup thing that will not happen for 5.7.

So disable the warning for now, even though it's potentially quite
useful.  Having a slew of warnings that then hide more urgent new issues
is not an improvement.

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index daef13f382906..bc5e9a5fc5cbf 100644
--- a/Makefile
+++ b/Makefile
@@ -860,6 +860,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
 # We'll want to enable this eventually, but it's not going away for 5.7 at least
 KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
+KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
 
 # Enabled with W=2, disabled by default as noisy
 KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
-- 
2.20.1
