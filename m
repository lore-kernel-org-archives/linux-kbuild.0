Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46067 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526Ab3LKXel (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Dec 2013 18:34:41 -0500
Message-Id: <fb11b985956d286c2cece8a843c2ff6121c0e78a.1386804405.git.geoff@infradead.org>
In-Reply-To: <cover.1386804405.git.geoff@infradead.org>
References: <cover.1386804405.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Subject: [PATCH 2/3] frv: Remove redundent debugging info flag
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
 arch/frv/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/frv/Makefile b/arch/frv/Makefile
index 4d1b1e9..5b838db 100644
--- a/arch/frv/Makefile
+++ b/arch/frv/Makefile
@@ -78,7 +78,6 @@ KBUILD_AFLAGS	+= -mno-fdpic
 # and disable optimisations that are unhelpful whilst debugging
 ifdef CONFIG_DEBUG_INFO
 #KBUILD_CFLAGS	+= -O1
-KBUILD_AFLAGS	+= -Wa,--gdwarf2
 endif
 
 head-y		:= arch/frv/kernel/head.o
-- 
1.8.1.2


