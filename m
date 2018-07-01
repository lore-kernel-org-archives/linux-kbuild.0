Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:45596 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965010AbeGARMt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Jul 2018 13:12:49 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: check for /sbin/depmod installed
Message-ID: <1df7f847-484c-a368-9dc2-50d191f8be9b@infradead.org>
Date: Sun, 1 Jul 2018 10:12:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Michal Marek <michal.lkml@markovi.net>, Chih-Wei Huang <cwhuang@linux.org.tw>

From: Randy Dunlap <rdunlap@infradead.org>

Verify that 'depmod' ($DEPMOD) is installed.
This is a partial revert of 620c231c7a7f (from 2012):
  ("kbuild: do not check for ancient modutils tools")

Fixes kernel bugzilla #198965:
https://bugzilla.kernel.org/show_bug.cgi?id=198965

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Chih-Wei Huang <cwhuang@linux.org.tw>
Cc: stable@vger.kernel.org # any kernel since 2012
---
 scripts/depmod.sh |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- lnx-418-rc2.orig/scripts/depmod.sh
+++ lnx-418-rc2/scripts/depmod.sh
@@ -10,10 +10,16 @@ fi
 DEPMOD=$1
 KERNELRELEASE=$2
 
-if ! test -r System.map -a -x "$DEPMOD"; then
+if ! test -r System.map ; then
 	exit 0
 fi
 
+if [ -z $(command -v $DEPMOD) ]; then
+	echo "'make *install' requires $DEPMOD. Please install it." >&2
+	echo "This is probably in the module-init-tools package." >&2
+	exit 1
+fi
+
 # older versions of depmod require the version string to start with three
 # numbers, so we cheat with a symlink here
 depmod_hack_needed=true


