Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:59867 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752466AbYLAWWZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Dec 2008 17:22:25 -0500
Message-Id: <200812012221.mB1ML8FS013118@imap1.linux-foundation.org>
Subject: [patch 8/8] scripts/extract-ikconfig: remove bashisms
From: akpm@linux-foundation.org
Date: Mon, 01 Dec 2008 14:21:08 -0800
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, werner@openmoko.org, randy.dunlap@oracle.com

From: Werner Almesberger <werner@openmoko.org>

scripts/extract-ikconfig contains a lot of gratuituous bashisms, which
make it fail if /bin/sh isn't bash.  This patch replaces them with regular
Bourne shell constructs.

Signed-off-by: Werner Almesberger <werner@openmoko.org>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/extract-ikconfig |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -puN scripts/extract-ikconfig~scripts-extract-ikconfig-remove-bashisms scripts/extract-ikconfig
--- a/scripts/extract-ikconfig~scripts-extract-ikconfig-remove-bashisms
+++ a/scripts/extract-ikconfig
@@ -8,8 +8,8 @@ test -e $binoffset || cc -o $binoffset .
 
 IKCFG_ST="0x49 0x4b 0x43 0x46 0x47 0x5f 0x53 0x54"
 IKCFG_ED="0x49 0x4b 0x43 0x46 0x47 0x5f 0x45 0x44"
-function dump_config {
-    typeset file="$1"
+dump_config() {
+    file="$1"
 
     start=`$binoffset $file $IKCFG_ST 2>/dev/null`
     [ "$?" != "0" ] && start="-1"
@@ -18,8 +18,8 @@ function dump_config {
     fi
     end=`$binoffset $file $IKCFG_ED 2>/dev/null`
 
-    let start="$start + 8"
-    let size="$end - $start"
+    start=`expr $start + 8`
+    size=`expr $end - $start`
 
     dd if="$file" ibs=1 skip="$start" count="$size" 2>/dev/null | zcat
 
_
