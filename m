Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42828 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758893AbYAXWDw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:52 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 32/77] kbuild: fix scripts/setlocalversion to avoid erroneous -dirty tag
Date: Thu, 24 Jan 2008 23:03:13 +0100
Message-Id: <1201212238-4369-32-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>, Sam Ravnborg <sam@ravnborg.org>

From: Theodore Ts'o <tytso@mit.edu>

If git's index file is out of date, and some files have been touched
such that their timestamp doesn't what is in the index, "git
diff-index HEAD" may show that a particular file is dirty, when in
fact it really isn't.  Running "git update-index" will update the
index to avoid these false positives.

Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/setlocalversion |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 1b31da8..acce8eb 100644
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -16,6 +16,7 @@ if head=`git rev-parse --verify HEAD 2>/dev/null`; then
 	fi
 
 	# Are there uncommitted changes?
+	git update-index --refresh --unmerged > /dev/null
 	if git diff-index HEAD | read dummy; then
 		printf '%s' -dirty
 	fi
-- 
1.5.4.rc3.14.g44397

