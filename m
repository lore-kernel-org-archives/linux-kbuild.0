Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:55907 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753619AbYLMXNF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Dec 2008 18:13:05 -0500
Date: Sun, 14 Dec 2008 00:14:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/1] tags.sh: fix string equality testing
Message-ID: <20081213231434.GB32331@uranus.ravnborg.org>
References: <1228913318-6003-1-git-send-email-jirislaby@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1228913318-6003-1-git-send-email-jirislaby@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 10, 2008 at 01:48:38PM +0100, Jiri Slaby wrote:
> Test of string equality in shells is =, not C-like ==.
> 
> Signed-off-by: Jiri Slaby <jirislaby@gmail.com>

Here I also did some local modifcations.
See below.

	Sam

From 91a70f60c285587826702a93ae924e7b9d761f94 Mon Sep 17 00:00:00 2001
From: Jiri Slaby <jirislaby@gmail.com>
Date: Wed, 10 Dec 2008 13:48:38 +0100
Subject: [PATCH] kbuild: fix string equality testing in tags.sh

Test of string equality in shells is =, not C-like ==.

Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/tags.sh |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 3c814ba..4e75472 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -7,7 +7,7 @@
 # Uses the following environment variables:
 # ARCH, SUBARCH, srctree, src, obj
 
-if [ $KBUILD_VERBOSE == 1 ]; then
+if [ "$KBUILD_VERBOSE" = "1" ]; then
 	set -x
 fi
 
@@ -18,7 +18,7 @@ ignore="( -name SCCS -o -name BitKeeper -o -name .svn -o \
           -prune -o"
 
 # Do not use full path is we do not use O=.. builds
-if [ "${KBUILD_SRC}" == "" ]; then
+if [ "${KBUILD_SRC}" = "" ]; then
 	tree=
 else
 	tree=${srctree}/
@@ -135,10 +135,10 @@ xtags()
 
 
 # Support um (which uses SUBARCH)
-if [ ${ARCH} == um ]; then
-	if [ $SUBARCH == i386 ]; then
+if [ "${ARCH}" = "um" ]; then
+	if [ "$SUBARCH" = "i386" ]; then
 		archinclude=x86
-	elif [ $SUBARCH == x86_64 ]; then
+	elif [ "$SUBARCH" = "x86_64" ]; then
 		archinclude=x86
 	else
 		archinclude=${SUBARCH}
-- 
1.5.6.GIT

