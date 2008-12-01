Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:35949 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752665AbYLAWWD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Dec 2008 17:22:03 -0500
Message-Id: <200812012221.mB1ML4NF013097@imap1.linux-foundation.org>
Subject: [patch 4/8] tags: skip ./ in filenames
From: akpm@linux-foundation.org
Date: Mon, 01 Dec 2008 14:21:04 -0800
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com

From: Alexey Dobriyan <adobriyan@gmail.com>

This drives size of tags file from 68.9 MB down to 67.7 MB.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN Makefile~tags-skip-in-filenames Makefile
--- a/Makefile~tags-skip-in-filenames
+++ a/Makefile
@@ -1456,7 +1456,7 @@ define find-sources
 	       -name $1 -print; \
 	  find $(__srctree) $(RCS_FIND_IGNORE) \
 	       \( -name include -o -name arch -o -name '.tmp_*' \) -prune -o \
-	       -name $1 -print; \
+	       -name $1 -print | sed -e 's#^./##'; \
 	  )
 endef
 
_
