Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:46352 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752564Ab0F2Lm4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jun 2010 07:42:56 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] MAINTAINERS: Update kbuild git URLs
Date: Tue, 29 Jun 2010 13:42:43 +0200
Message-Id: <1277811763-3916-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

The kbuild tree was moved to git.kernel.org so that people can find it
more easily.

Signed-off-by: Michal Marek <mmarek@suse.cz>
---

Stephen, could you please update your linux-next list accordingly? I'll be
pushing to both repositories for the time being.

---
 MAINTAINERS |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0572b7e..e4f9e41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3098,8 +3098,8 @@ F:	fs/autofs4/
 
 KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
 M:	Michal Marek <mmarek@suse.cz>
-T:	git git://repo.or.cz/linux-kbuild.git for-next
-T:	git git://repo.or.cz/linux-kbuild.git for-linus
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git for-next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git rc-fixes
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained
 F:	Documentation/kbuild/
-- 
1.7.1

