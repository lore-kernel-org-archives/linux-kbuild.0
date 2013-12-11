Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46062 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453Ab3LKXel (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Dec 2013 18:34:41 -0500
Message-Id: <e9d530c5b8b1c9a8510d9c8db8663aedc393de8f.1386804405.git.geoff@infradead.org>
In-Reply-To: <cover.1386804405.git.geoff@infradead.org>
References: <cover.1386804405.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Subject: [PATCH 3/3] mn10300: Remove redundent debugging info flag
Date: Wed, 11 Dec 2013 23:34:40 +0000
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

The gereric makefile now sets '-Wa,--gdwarf2' in KBUILD_AFLAGS, so
this setting is no longer needed in arch makefiles.

Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Geoff Levand <geoff@infradead.org> for Huawei, Linaro
---
 arch/mn10300/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mn10300/Makefile b/arch/mn10300/Makefile
index a3d0fef..f5a9db9 100644
--- a/arch/mn10300/Makefile
+++ b/arch/mn10300/Makefile
@@ -97,7 +97,6 @@ endef
 # that are unhelpful whilst debugging.
 ifdef CONFIG_DEBUG_INFO
 #KBUILD_CFLAGS	+= -O1
-KBUILD_AFLAGS	+= -Wa,--gdwarf2
 endif
 
 #
-- 
1.8.1.2

