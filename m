Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:56396 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751941AbYLTOaJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Dec 2008 09:30:09 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 16/26] setlocalversion: add git-svn support
Date: Sat, 20 Dec 2008 15:31:27 +0100
Message-Id: <1229783497-19550-16-git-send-email-sam@ravnborg.org>
In-Reply-To: <20081220142518.GA19390@uranus.ravnborg.org>
References: <20081220142518.GA19390@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Peter Korsgaard <jacmet@sunsite.dk>, Sam Ravnborg <sam@ravnborg.org>

From: Peter Korsgaard <jacmet@sunsite.dk>

Print svn revision in addition to git info on git-svn repos.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/setlocalversion |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 81d984b..f6946cf 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -19,6 +19,11 @@ if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 		fi
 	fi
 
+	# Is this git on svn?
+	if git config --get svn-remote.svn.url >/dev/null; then
+	        printf -- '-svn%s' "`git-svn find-rev $head`"
+	fi
+
 	# Are there uncommitted changes?
 	git update-index --refresh --unmerged > /dev/null
 	if git diff-index --name-only HEAD | grep -v "^scripts/package" \
-- 
1.6.0.2.GIT

