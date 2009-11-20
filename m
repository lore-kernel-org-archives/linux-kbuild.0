Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:50543 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752091AbZKTS0I (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Nov 2009 13:26:08 -0500
Date: Fri, 20 Nov 2009 19:26:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] kbuild: Steppeing down as Maintainer
Message-ID: <20091120182613.GA28307@merkur.ravnborg.org>
References: <20091120182249.GA28251@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091120182249.GA28251@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

It has been fun but the last year or more it has
been a duty and a burden. So I leave it open for
other to take over.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
diff --git a/MAINTAINERS b/MAINTAINERS
index c824b4d..147ec86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2987,11 +2987,8 @@ S:	Maintained
 F:	fs/autofs4/
 
 KERNEL BUILD
-M:	Sam Ravnborg <sam@ravnborg.org>
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sam/kbuild-next.git
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sam/kbuild-fixes.git
 L:	linux-kbuild@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	Documentation/kbuild/
 F:	Makefile
 F:	scripts/Makefile.*
