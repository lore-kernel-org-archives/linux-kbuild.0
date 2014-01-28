Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43902 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbaA1Bsl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jan 2014 20:48:41 -0500
Message-ID: <1390873714.5027.55.camel@smoke>
Subject: Re: [PATCH V2 2/3] frv: Remove redundant debugging info flag
From: Geoff Levand <geoff@infradead.org>
Date: Mon, 27 Jan 2014 17:48:34 -0800
In-Reply-To: <fb11b985956d286c2cece8a843c2ff6121c0e78a.1386804405.git.geoff@infradead.org>
References: <cover.1386804405.git.geoff@infradead.org>
	 <fb11b985956d286c2cece8a843c2ff6121c0e78a.1386804405.git.geoff@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

The generic makefile now sets '-Wa,--gdwarf2' in KBUILD_AFLAGS, so
this setting is no longer needed in arch makefiles.

Also remove a commented out addition of a -O1 to KBUILD_CFLAGS, and
comment text relating to these removed lines.

Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Geoff Levand <geoff@infradead.org> for Huawei, Linaro
---
v2: Removed unused CONFIG_DEBUG_INFO conditional and related text comment.

 arch/frv/Makefile | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/frv/Makefile b/arch/frv/Makefile
index 4d1b1e9..2a8fb73 100644
--- a/arch/frv/Makefile
+++ b/arch/frv/Makefile
@@ -74,13 +74,6 @@ KBUILD_CFLAGS	+= -mno-fdpic -mgpr-32 -msoft-float -mno-media
 KBUILD_CFLAGS	+= -ffixed-fcc3 -ffixed-cc3 -ffixed-gr15 -ffixed-icc2
 KBUILD_AFLAGS	+= -mno-fdpic
 
-# make sure the .S files get compiled with debug info
-# and disable optimisations that are unhelpful whilst debugging
-ifdef CONFIG_DEBUG_INFO
-#KBUILD_CFLAGS	+= -O1
-KBUILD_AFLAGS	+= -Wa,--gdwarf2
-endif
-
 head-y		:= arch/frv/kernel/head.o
 
 core-y		+= arch/frv/kernel/ arch/frv/mm/
-- 
1.8.1.2



