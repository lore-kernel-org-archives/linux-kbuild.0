Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cable-static-49-187.intergga.ch ([157.161.49.187]:42363 "EHLO
	mail.ffwll.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759287AbZKZMkG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Nov 2009 07:40:06 -0500
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] kbuild: specify absolute paths for cscope
Date: Thu, 26 Nov 2009 13:34:12 +0100
Message-Id: <1259238852-21214-1-git-send-email-daniel.vetter@ffwll.ch>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Some tools (like my favourite editor, vim) can't handle relative
paths from cscope as soon as cscope.out is no longer in $PWD. Use
absolute paths when generating cscope.files, which seems to be
the recommended way to generate cscope.out, anyway (at least according
to cscope.sf.net).

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 scripts/tags.sh |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index d52f7a0..49bffed 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -89,7 +89,9 @@ all_defconfigs()
 
 docscope()
 {
-	(echo \-k; echo \-q; all_sources) > cscope.files
+	# use absolute paths - vim likes it that way
+	tree=$PWD/$tree
+	(cd /; echo \-k; echo \-q; all_sources) > cscope.files
 	cscope -b -f cscope.out
 }
 
-- 
1.6.5.3

