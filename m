Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:35931 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754242AbYJ2Vaa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 17:30:30 -0400
Message-Id: <200810292120.m9TLKF59019409@imap1.linux-foundation.org>
Subject: [patch 13/13] setlocalversion: don't include svn change count
From: akpm@linux-foundation.org
Date: Wed, 29 Oct 2008 14:20:15 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, vapier@gentoo.org

From: Mike Frysinger <vapier@gentoo.org>

The number of pending changes is pretty useless, so encoding it into the
version is just annoying by the constant shuffle in corresponding modules.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/setlocalversion |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN scripts/setlocalversion~setlocalversion-dont-include-svn-change-count scripts/setlocalversion
--- a/scripts/setlocalversion~setlocalversion-dont-include-svn-change-count
+++ a/scripts/setlocalversion
@@ -55,7 +55,7 @@ if rev=`svn info 2>/dev/null | grep '^Re
 
 	# Are there uncommitted changes?
 	if [ $changes != 0 ]; then
-		printf -- '-svn%s%s%s' "$rev" -dirty "$changes"
+		printf -- '-svn%s%s' "$rev" -dirty
 	else
 		printf -- '-svn%s' "$rev"
 	fi
_
