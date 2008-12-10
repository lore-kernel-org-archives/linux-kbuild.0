Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.wellnetcz.com ([212.24.148.102]:34884 "EHLO
	smtp.wellnetcz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751945AbYLJMsm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Dec 2008 07:48:42 -0500
From: Jiri Slaby <jirislaby@gmail.com>
Subject: [PATCH 1/1] tags.sh: fix string equality testing
Date: Wed, 10 Dec 2008 13:48:38 +0100
Message-Id: <1228913318-6003-1-git-send-email-jirislaby@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@gmail.com>

Test of string equality in shells is =, not C-like ==.

Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
---
 scripts/tags.sh |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 3b7225c..6f49398 100644
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -7,7 +7,7 @@
 # Uses the following environment variables:
 # ARCH, SUBARCH, srctree, src, obj
 
-if [ $KBUILD_VERBOSE == 1 ]; then
+if [ $KBUILD_VERBOSE = 1 ]; then
 	set -x
 fi
 
@@ -18,7 +18,7 @@ ignore="( -name SCCS -o -name BitKeeper -o -name .svn -o \
           -prune -o"
 
 # Do not use full path is we do not use O=.. builds
-if [ ${src} == ${obj} ]; then
+if [ ${src} = ${obj} ]; then
 	tree=
 else
 	tree=${srctree}/
@@ -135,10 +135,10 @@ xtags()
 
 
 # Support um (which uses SUBARCH)
-if [ ${ARCH} == um ]; then
-	if [ $SUBARCH == i386 ]; then
+if [ ${ARCH} = um ]; then
+	if [ $SUBARCH = i386 ]; then
 		archinclude=x86
-	elif [ $SUBARCH == x86_64 ]; then
+	elif [ $SUBARCH = x86_64 ]; then
 		archinclude=x86
 	else
 		archinclude=${SUBARCH}
-- 
1.6.0.5

