Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37436 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758976AbYAXWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:53 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 20/77] kbuild: fix buglet in gcc-version.sh
Date: Thu, 24 Jan 2008 23:03:01 +0100
Message-Id: <1201212238-4369-20-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Greg Schafer <gschafer@zip.com.au>, Jesper Juhl <jesper.juhl@gmail.com>

Greg Schafer <gschafer@zip.com.au> reported:
====
$make mrproper
scripts/gcc-version.sh: [[: command not found

This is on a very old host with an ancient bash as /bin/sh. But I have
CONFIG_SHELL set and pointing to a modern bash. Something is wrong.

This doesn't happen with 2.6.23
====

Fixed using a more common string equality test.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Greg Schafer <gschafer@zip.com.au>
Cc: Jesper Juhl <jesper.juhl@gmail.com>
---
 scripts/gcc-version.sh |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/scripts/gcc-version.sh b/scripts/gcc-version.sh
index a5121a6..cc767b3 100644
--- a/scripts/gcc-version.sh
+++ b/scripts/gcc-version.sh
@@ -9,7 +9,10 @@
 # gcc-2.95.3, `030301' for gcc-3.3.1, etc.
 #
 
-if [[ $1 = "-p" ]] ; then with_patchlevel=1; shift; fi
+if [ "$1" = "-p" ] ; then
+	with_patchlevel=1;
+	shift;
+fi
 
 compiler="$*"
 
-- 
1.5.4.rc3.14.g44397

