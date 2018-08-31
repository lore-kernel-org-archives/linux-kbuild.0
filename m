Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:47748 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbeIACnI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Aug 2018 22:43:08 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: modules_install: Warn if System.map file is not found
Message-ID: <b82ada4b-25d1-5612-4405-d6a09eb59433@infradead.org>
Date: Fri, 31 Aug 2018 15:33:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

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
 scripts/depmod.sh |    1 +
 1 file changed, 1 insertion(+)

--- lnx-419-rc1.orig/scripts/depmod.sh
+++ lnx-419-rc1/scripts/depmod.sh
@@ -11,6 +11,7 @@ DEPMOD=$1
 KERNELRELEASE=$2
 
 if ! test -r System.map ; then
+	echo "Warning: modules_install: missing 'System.map' file"
 	exit 0
 fi
 
