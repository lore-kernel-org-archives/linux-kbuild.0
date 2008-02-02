Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52595 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763805AbYBBUqk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:40 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] kbuild: add svn revision information to setlocalversion
Date: Sat,  2 Feb 2008 21:46:37 +0100
Message-Id: <1201985204-26589-3-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Bryan Wu <bryan.wu@analog.com>

From: Bryan Wu <bryan.wu@analog.com>

follow git and mercurial style, include uncommitted changes detect

Signed-off-by: Bryan Wu <bryan.wu@analog.com>
---
 scripts/setlocalversion |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/setlocalversion

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
old mode 100644
new mode 100755
index 52f032e..17b0028
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -45,3 +45,18 @@ if hgid=`hg id 2>/dev/null`; then
 	# All done with mercurial
 	exit
 fi
+
+# Check for svn and a svn repo.
+if rev=`svn info 2>/dev/null | grep '^Revision' | awk '{print $NF}'` ; then
+	changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l`
+
+	# Are there uncommitted changes?
+	if [ $changes != 0 ]; then
+		printf -- '-svn%s%s%s' "$rev" -dirty "$changes"
+	else
+		printf -- '-svn%s' "$rev"
+	fi
+
+	# All done with svn
+	exit
+fi
-- 
1.5.4.rc3.14.g44397

