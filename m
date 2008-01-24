Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37465 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758877AbYAXWDv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:51 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 18/77] kbuild: support mercurial in setlocalversion
Date: Thu, 24 Jan 2008 23:02:59 +0100
Message-Id: <1201212238-4369-18-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Aron Griffis <aron@hp.com>, Sam Ravnborg <sam@ravnborg.org>

From: Aron Griffis <aron@hp.com>

This represents mercurial changesets similarly to git.  For untagged
revisions, append the changeset id.  If there are uncommitted changes,
append -dirty.  For example, -hgc60016ba6237-dirty

Signed-off-by: Aron Griffis <aron@hp.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/setlocalversion |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 82e4993..a80d6ea 100644
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -19,4 +19,27 @@ if head=`git rev-parse --verify HEAD 2>/dev/null`; then
 	if git diff-index HEAD | read dummy; then
 		printf '%s' -dirty
 	fi
+
+	# All done with git
+	exit
+fi
+
+# Check for mercurial and a mercurial repo.
+if hgid=`hg id 2>/dev/null`; then
+	tag=`printf '%s' "$hgid" | cut -d' ' -f2`
+
+	# Do we have an untagged version?
+	if [ -z "$tag" -o "$tag" = tip ]; then
+		id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
+		printf '%s%s' -hg "$id"
+	fi
+
+	# Are there uncommitted changes?
+	# These are represented by + after the changeset id.
+	case "$hgid" in
+		*+|*+\ *) printf '%s' -dirty ;;
+	esac
+
+	# All done with mercurial
+	exit
 fi
-- 
1.5.4.rc3.14.g44397

