Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:59367 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1757352Ab0BCQZU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Feb 2010 11:25:20 -0500
Date: Wed, 3 Feb 2010 17:25:27 +0100 (CET)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: tags: include headers before source files
Message-ID: <Pine.LNX.4.64.1002031704550.6324@axis700.grange>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Currently looking up a structure definition in TAGS / tags takes one to 
one of multiple "static struct X" definitions in arch sources, which makes 
it for many structs practically impossible to get to the required header. 
This patch changes the order of sources being tagged to first scan 
architecture includes, then the top-level include/ directory, and only 
then the rest. It also takes into account, that many architectures have 
more than one include directory, i.e., not only arch/$ARCH/include, but 
also arch/$ARCH/mach-X/include etc.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
---

I am no expert in Kbuild, so, please, review, comment, suggest 
improvements, but at least, this does make TAGS usable for me.

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 1a0c44d..b84ce1c 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -32,13 +32,18 @@ fi
 # find sources in arch/$ARCH
 find_arch_sources()
 {
-	find ${tree}arch/$1 $ignore -name "$2" -print;
+	for i in $archincludedir; do
+		prune+="-wholename $i -prune -o "
+	done
+	find ${tree}arch/$1 $ignore $prune -name "$2" -print;
 }
 
 # find sources in arch/$1/include
 find_arch_include_sources()
 {
-	find ${tree}arch/$1/include $ignore -name "$2" -print;
+	include=$(find ${tree}arch/$1/ -name include -type d);
+	archincludedir+=$include
+	find $include $ignore -name "$2" -print;
 }
 
 # find sources in include/
@@ -63,14 +68,15 @@ find_sources()
 
 all_sources()
 {
-	for arch in $ALLSOURCE_ARCHS
-	do
-		find_sources $arch '*.[chS]'
-	done
+	find_arch_include_sources $ARCH '*.[chS]'
 	if [ ! -z "$archinclude" ]; then
 		find_arch_include_sources $archinclude '*.[chS]'
 	fi
 	find_include_sources '*.[chS]'
+	for arch in $ALLSOURCE_ARCHS
+	do
+		find_sources $arch '*.[chS]'
+	done
 	find_other_sources '*.[chS]'
 }
 
