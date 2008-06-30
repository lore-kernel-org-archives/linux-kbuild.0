Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:48229 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763018AbYF3Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2008 17:34:32 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 11/24] kbuild: support arch/$ARCH/include for tags, cscope
Date: Mon, 30 Jun 2008 23:35:05 +0200
Message-Id: <1214861718-32626-11-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080630213155.GA32479@uranus.ravnborg.org>
References: <20080630213155.GA32479@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index acb961e..39b997f 100644
--- a/Makefile
+++ b/Makefile
@@ -1399,7 +1399,11 @@ define find-sources
 	       \( -name config -o -name 'asm-*' \) -prune \
 	       -o -name $1 -print; \
 	  for arch in $(ALLINCLUDE_ARCHS) ; do \
-	       find $(__srctree)include/asm-$${arch} $(RCS_FIND_IGNORE) \
+	       test -e $(__srctree)include/asm-$${arch} && \
+                 find $(__srctree)include/asm-$${arch} $(RCS_FIND_IGNORE) \
+	            -name $1 -print; \
+	       test -e $(__srctree)arch/$${arch}/include/asm && \
+	         find $(__srctree)arch/$${arch}/include/asm $(RCS_FIND_IGNORE) \
 	            -name $1 -print; \
 	  done ; \
 	  find $(__srctree)include/asm-generic $(RCS_FIND_IGNORE) \
-- 
1.5.6.1.93.gef98

