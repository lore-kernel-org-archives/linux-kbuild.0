Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33069 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753000Ab1HJLRF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Aug 2011 07:17:05 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] kbuild: Do not delete empty files in make distclean
Date: Wed, 10 Aug 2011 13:16:58 +0200
Message-Id: <1312975018-25095-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <25697.1311857663@redhat.com>
References: <25697.1311857663@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dhowells@redhat.com
Cc: arnd@arndb.de, linux-kbuild@vger.kernel.org, lacombar@gmail.com

Commit 3d64b44 introduced an empty file under
arch/arm/mach-zynq/board_dt.c. While this was not intended and the file
was removed from the tree by a later commit, we really should only match
junk files by known name patterns and not their size.

Reported-by: David Howells <dhowells@redhat.com>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b4ca4e1..d714838 100644
--- a/Makefile
+++ b/Makefile
@@ -1198,7 +1198,7 @@ distclean: mrproper
 	@find $(srctree) $(RCS_FIND_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
 		-o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
-		-o -name '.*.rej' -o -size 0 \
+		-o -name '.*.rej' \
 		-o -name '*%' -o -name '.*.cmd' -o -name 'core' \) \
 		-type f -print | xargs rm -f
 
-- 
1.7.6

