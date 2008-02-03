Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nwd2mail11.analog.com ([137.71.25.57]:33214 "EHLO
	nwd2mail11.analog.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550AbYBCGN3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Feb 2008 01:13:29 -0500
Subject: [PATCH try#2 ] kbuild: add svn revision information to
	setlocalversion
From: Bryan Wu <bryan.wu@analog.com>
Reply-To: bryan.wu@analog.com
In-Reply-To: <20080202213015.GA27015@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
	 <E1JLPrz-00059X-Sc@faramir.fjphome.nl>
	 <20080202213015.GA27015@uranus.ravnborg.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Sun, 03 Feb 2008 14:13:26 +0800
Message-Id: <1202019206.6671.18.camel@roc-laptop>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>
Cc: Bryan Wu <bryan.wu@analog.com>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From 0a7a2c6f19d32a85ca1a7887382325170ef19a66 Mon Sep 17 00:00:00 2001
From: Bryan Wu <bryan.wu@analog.com>
Date: Sun, 3 Feb 2008 14:05:00 +0800
Subject: [PATCH] [Scripts] add svn revision information to setlocalversion

follow git and mercurial style, include uncommitted changes detect

Cc: Frans Pop <elendil@planet.nl>
Signed-off-by: Bryan Wu <bryan.wu@analog.com>
---
 scripts/setlocalversion |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/setlocalversion

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
old mode 100644
new mode 100755
index 52f032e..1c1bdaf
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -45,3 +45,19 @@ if hgid=`hg id 2>/dev/null`; then
 	# All done with mercurial
 	exit
 fi
+
+# Check for svn and a svn repo.
+if rev=`svn info 2>/dev/null | grep '^Revision'`; then
+	rev=`echo $rev | awk '{print $NF}'`
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
1.5.3.4

