Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.184]:2596 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755135AbYLaNl6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Dec 2008 08:41:58 -0500
Received: by ti-out-0910.google.com with SMTP id b6so8383981tic.23
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2008 05:41:56 -0800 (PST)
From: Jike Song <albcamus@gmail.com>
Subject: [PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
Date: Wed, 31 Dec 2008 21:37:36 +0800
Message-Id: <1230730656-2987-1-git-send-email-albcamus@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, Jike Song <albcamus@gmail.com>

This patch reintroduce the ALLSOURCE_ARCHS support for tags/TAGS/
cscope targets. The Kbuild previously has this feature, but after
moving the targets into scripts/tags.sh, ALLSOURCE_ARCHS disappears.

It's something like this:

	$ make ALLSOURCE_ARCHS="x86 mips arm" tags cscope

Signed-off-by: Jike Song <albcamus@gmail.com>
---
 scripts/tags.sh |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 4e75472..9c954d9 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -24,6 +24,11 @@ else
 	tree=${srctree}/
 fi
 
+# Detect if ALLSOURCE_ARCHS is set. If not, we asssume SRCARCH
+if [ "${ALLSOURCE_ARCHS}" = "" ]; then
+	ALLSOURCE_ARCHS=${SRCARCH}
+fi
+
 # find sources in arch/$ARCH
 find_arch_sources()
 {
@@ -54,26 +59,29 @@ find_other_sources()
 find_sources()
 {
 	find_arch_sources $1 "$2"
-	find_include_sources "$2"
-	find_other_sources "$2"
 }
 
 all_sources()
 {
-	find_sources $SRCARCH '*.[chS]'
+	for arch in $ALLSOURCE_ARCHS
+	do
+		find_sources $arch '*.[chS]'
+	done
 	if [ ! -z "$archinclude" ]; then
 		find_arch_include_sources $archinclude '*.[chS]'
 	fi
+	find_include_sources '*.[chS]'
+	find_other_sources '*.[chS]'
 }
 
 all_kconfigs()
 {
-	find_sources $SRCARCH 'Kconfig*'
+	find_sources $ALLSOURCE_ARCHS 'Kconfig*'
 }
 
 all_defconfigs()
 {
-	find_sources $SRCARCH "defconfig"
+	find_sources $ALLSOURCE_ARCHS "defconfig"
 }
 
 docscope()
-- 
1.6.0.2.GIT

