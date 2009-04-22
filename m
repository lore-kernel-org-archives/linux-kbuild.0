Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from neon.ftbfs.org ([83.168.236.214]:47988 "EHLO neon.ftbfs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750751AbZDVESW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 00:18:22 -0400
From: Matt Kraai <kraai@ftbfs.org>
Subject: [PATCH] Remove a tag file before it is regenerated
Date: Tue, 21 Apr 2009 20:38:23 -0700
Message-Id: <1240371503-2751-1-git-send-email-kraai@ftbfs.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org
Cc: Matt Kraai <kraai@ftbfs.org>

If a tag file is not removed before it is regenerated, the newly
generated data is appended to the old, which preserves stale data and
makes the tag file grow over time.

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 scripts/tags.sh |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 5bd8b10..4a34ec5 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -164,10 +164,12 @@ case "$1" in
 		;;
 
 	"tags")
+		rm -f tags
 		xtags ctags
 		;;
 
 	"TAGS")
+		rm -f TAGS
 		xtags etags
 		;;
 esac
-- 
1.6.2.3

