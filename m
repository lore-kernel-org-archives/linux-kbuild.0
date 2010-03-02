Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f219.google.com ([209.85.220.219]:55951 "EHLO
	mail-fx0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753585Ab0CBP6A (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Mar 2010 10:58:00 -0500
From: John Kacur <jkacur@redhat.com>
Subject: [PATCH] kbuild - tags
Date: Tue,  2 Mar 2010 16:57:52 +0100
Message-Id: <1267545472-17131-1-git-send-email-jkacur@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, John Kacur <jkacur@redhat.com>

	- Add the ability to make tags for all archs using "all"
		make ALLSOURCE_ARCHS=all tags
	- Document this in kbuild.txt

	Without this change you have to type each arch separately.

Signed-off-by: John Kacur <jkacur@redhat.com>
---
 Documentation/kbuild/kbuild.txt |    4 ++++
 scripts/tags.sh                 |   11 +++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6f8c1ca..a6791e3 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -162,3 +162,7 @@ For tags/TAGS/cscope targets, you can specify more than one arch
 to be included in the databases, separated by blank space. E.g.:
 
     $ make ALLSOURCE_ARCHS="x86 mips arm" tags
+
+To get all available archs you can also specify all. E.g.:
+
+    $ make ALLSOURCE_ARCHS=all tags
diff --git a/scripts/tags.sh b/scripts/tags.sh
index a6a8e71..766eb8a 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -24,9 +24,20 @@ else
 	tree=${srctree}/
 fi
 
+# Find all available archs
+find_all_archs()
+{
+	ALLSOURCE_ARCHS=""
+	for arch in `ls ${tree}arch`; do
+		ALLSOURCE_ARCHS="${ALLSOURCE_ARCHS} "${arch##\/}
+	done
+}
+
 # Detect if ALLSOURCE_ARCHS is set. If not, we assume SRCARCH
 if [ "${ALLSOURCE_ARCHS}" = "" ]; then
 	ALLSOURCE_ARCHS=${SRCARCH}
+elif [ "${ALLSOURCE_ARCHS}" = "all" ]; then
+	find_all_archs
 fi
 
 # find sources in arch/$ARCH
-- 
1.6.6.1

