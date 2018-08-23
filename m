Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:55028 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbeHWVoy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 17:44:54 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] modules_install: make missing $DEPMOD a warning instead of
 an error
Message-ID: <4449cd91-fae5-caf1-a917-82e0c5f0aba8@infradead.org>
Date: Thu, 23 Aug 2018 11:13:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable <stable@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>, "H. Nikolaus Schaller" <hns@goldelico.com>

From: Randy Dunlap <rdunlap@infradead.org>

When $DEPMOD is not found, only print a warning instead of exiting
with an error message and error status.

Warning: 'make modules_install' requires /sbin/depmod. Please install it.
This is probably in the kmod package.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 934193a654c1 ("kbuild: verify that $DEPMOD is installed")
Cc: stable@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Jessica Yu <jeyu@kernel.org>
Cc: Chih-Wei Huang <cwhuang@linux.org.tw>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
v2: add missing "exit 0" and update the commit message (no Error).
v3: add Fixes: and Cc: stable

 scripts/depmod.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-418.orig/scripts/depmod.sh
+++ lnx-418/scripts/depmod.sh
@@ -15,9 +15,9 @@ if ! test -r System.map ; then
 fi
 
 if [ -z $(command -v $DEPMOD) ]; then
-	echo "'make modules_install' requires $DEPMOD. Please install it." >&2
+	echo "Warning: 'make modules_install' requires $DEPMOD. Please install it." >&2
 	echo "This is probably in the kmod package." >&2
-	exit 1
+	exit 0
 fi
 
 # older versions of depmod require the version string to start with three
