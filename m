Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:48370 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725743AbeIGEPS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Sep 2018 00:15:18 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] modules_install: warn when missing System.map file
Message-ID: <dde798fd-9fef-6ac0-a3bc-6aa7193c5d89@infradead.org>
Date: Thu, 6 Sep 2018 16:37:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

If there is no System.map file for "make modules_install",
scripts/depmod.sh will silently exit with success, having done
nothing.  Since this is an unexpected situation, change it to
report a Warning for the missing file.  The behavior is not
changed except for the Warning message.

The (previous) silent success and new Warning can be reproduced
by:
$ make mrproper; make defconfig
$ make modules; make modules_install

and since System.map is produced by "make vmlinux", the steps
above omit producing the System.map file.

Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: add Yamada-san's suggestions for >&2 and Skipping depmod.

 scripts/depmod.sh |    1 +
 1 file changed, 1 insertion(+)

--- lnx-419-rc1.orig/scripts/depmod.sh
+++ lnx-419-rc1/scripts/depmod.sh
@@ -11,6 +11,7 @@ DEPMOD=$1
 KERNELRELEASE=$2
 
 if ! test -r System.map ; then
+	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
 	exit 0
 fi
 
