Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37436 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756846AbYAXWEL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:11 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 58/77] kbuild: minor scripts/decodecode update
Date: Thu, 24 Jan 2008 23:03:39 +0100
Message-Id: <1201212238-4369-58-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Remove the tmp file when exiting.  Noticed by Arjan van de Ven.
Catch mktemp failure and exit with message.
Trap kill or other signals and exit cleanly.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/decodecode |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/decodecode b/scripts/decodecode
index 1e1a8f6..235d393 100644
--- a/scripts/decodecode
+++ b/scripts/decodecode
@@ -6,7 +6,19 @@
 # e.g., to decode an i386 oops on an x86_64 system, use:
 # AFLAGS=--32 decodecode < 386.oops
 
-T=`mktemp`
+cleanup() {
+	rm -f $T $T.s $T.o
+	exit 1
+}
+
+die() {
+	echo "$@"
+	exit 1
+}
+
+trap cleanup EXIT
+
+T=`mktemp` || die "cannot create temp file"
 code=
 
 while read i ; do
@@ -20,6 +32,7 @@ esac
 done
 
 if [ -z "$code" ]; then
+	rm $T
 	exit
 fi
 
@@ -48,4 +61,4 @@ echo -n "	.byte 0x" > $T.s
 echo $code >> $T.s
 as $AFLAGS -o $T.o $T.s
 objdump -S $T.o
-rm $T.o $T.s
+rm $T $T.s $T.o
-- 
1.5.4.rc3.14.g44397

