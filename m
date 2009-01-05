Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.190]:13062 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbZAEHBO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Jan 2009 02:01:14 -0500
Received: by ti-out-0910.google.com with SMTP id b6so9431080tic.23
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Jan 2009 23:01:11 -0800 (PST)
From: Jike Song <albcamus@gmail.com>
Subject: [RESEND][PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
Date: Mon,  5 Jan 2009 14:57:03 +0800
Message-Id: <1231138623-26972-1-git-send-email-albcamus@gmail.com>
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
 Documentation/kbuild/kbuild.txt |    7 +++++++
 scripts/tags.sh                 |   18 +++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 5177184..923f9dd 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -124,3 +124,10 @@ KBUILD_EXTRA_SYMBOLS
 --------------------------------------------------
 For modules use symbols from another modules.
 See more details in modules.txt.
+
+ALLSOURCE_ARCHS
+--------------------------------------------------
+For tags/TAGS/cscope targets, you can specify more than one archs
+to be included in the databases, separated by blankspace. e.g.
+
+    $ make ALLSOURCE_ARCHS="x86 mips arm" tags
diff --git a/scripts/tags.sh b/scripts/tags.sh
index 9e3451d..fdbe78b 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -24,6 +24,11 @@ else
 	tree=${srctree}/
 fi
 
+# Detect if ALLSOURCE_ARCHS is set. If not, we assume SRCARCH
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
1.6.0.3.613.g9f8f13

