Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f219.google.com ([209.85.220.219]:46743 "EHLO
	mail-fx0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753215Ab0CBOjR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Mar 2010 09:39:17 -0500
From: John Kacur <jkacur@redhat.com>
Subject: [PATCH] [TRIVIAL] kbuild - tags
Date: Tue,  2 Mar 2010 15:38:10 +0100
Message-Id: <1267540690-15069-1-git-send-email-jkacur@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, John Kacur <jkacur@redhat.com>

	- Fix spelling error in comment (is->if)

Signed-off-by: John Kacur <jkacur@redhat.com>
---
 scripts/tags.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 1a0c44d..a6a8e71 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -17,7 +17,7 @@ ignore="( -name SCCS -o -name BitKeeper -o -name .svn -o \
           -name .git )                                   \
           -prune -o"
 
-# Do not use full path is we do not use O=.. builds
+# Do not use full path if we do not use O=.. builds
 if [ "${KBUILD_SRC}" = "" ]; then
 	tree=
 else
-- 
1.6.6.1

