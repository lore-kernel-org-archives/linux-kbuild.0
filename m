Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 87-119-183-129.tll.elisa.ee ([87.119.183.129]:48305 "EHLO
	fatphil.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754227Ab3EHPfn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 11:35:43 -0400
From: Phil Carmody <pc+lkml@asdf.org>
Subject: [PATCH] Makefile: make sparse (CHECK) user-selectable
Date: Wed,  8 May 2013 18:23:00 +0300
Message-Id: <1368026580-26897-1-git-send-email-pc+lkml@asdf.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Carmody <pc+lkml@asdf.org>

I've got a tweaked version as well as the system default,
so make the sparse binary that's run user-selectable.

Signed-off-by: Phil Carmody <pc+lkml@asdf.org>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index a3a834b..e7a4851 100644
--- a/Makefile
+++ b/Makefile
@@ -338,7 +338,9 @@ GENKSYMS	= scripts/genksyms/genksyms
 INSTALLKERNEL  := installkernel
 DEPMOD		= /sbin/depmod
 PERL		= perl
-CHECK		= sparse
+ifndef CHECK
+  CHECK		= sparse
+endif
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void $(CF)
-- 
1.7.2.5

