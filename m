Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.michael-prokop.at ([88.198.6.110]:60028 "EHLO
	mail.michael-prokop.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963Ab0IFJ53 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Sep 2010 05:57:29 -0400
From: Michael Prokop <mika@grml.org>
Subject: [PATCH] scripts/setlocalversion: update comment regarding information retrieval about git repository state
Date: Mon,  6 Sep 2010 11:57:19 +0200
Message-Id: <1283767039-27872-1-git-send-email-mika@grml.org>
In-Reply-To: <4C80E5B9.3080405@suse.cz>
References: <4C80E5B9.3080405@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org
Cc: Michael Prokop <mika@grml.org>

A tagged repository state isn't enough, git describe only
looks at signed or annotated tags (git tag -a/-s). This
documentation update makes sure the comment matches the
current behaviour.

Signed-off-by: Michael Prokop <mika@grml.org>
---
 scripts/setlocalversion |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 057b6b3..ef8729f 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -160,8 +160,10 @@ if test "$CONFIG_LOCALVERSION_AUTO" = "y"; then
 	# full scm version string
 	res="$res$(scm_version)"
 else
-	# apped a plus sign if the repository is not in a clean tagged
-	# state and  LOCALVERSION= is not specified
+	# append a plus sign if the repository is not in a clean
+	# annotated or signed tagged state (as git describe only
+	# looks at signed or annotated tags - git tag -a/-s) and
+	# LOCALVERSION= is not specified
 	if test "${LOCALVERSION+set}" != "set"; then
 		scm=$(scm_version --short)
 		res="$res${scm:++}"
-- 
1.7.1

