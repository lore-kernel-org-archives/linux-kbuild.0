Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1-g21.free.fr ([212.27.42.1]:40776 "EHLO smtp1-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754629AbZBIRuC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Feb 2009 12:50:02 -0500
Subject: [PATCH] fix spurious initramfs rebuild
From: Maxime Bizon <mbizon@freebox.fr>
Reply-To: mbizon@freebox.fr
Content-Type: text/plain
Date: Mon, 09 Feb 2009 18:49:52 +0100
Message-Id: <1234201792.1951.26.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org


Hello,



When gen_initramfs_list is used to generate make dependencies, it
includes symbolic links, for which make tracks the link target. Any
change to that target will cause an initramfs rebuild, even if the
symlink points to something outside of the initramfs directory.

If the target happens to be /tmp, the rebuild occurs for each kernel
build, since gen_initramfs_list uses mktemp...

Proposed way to fix it is to omit symbolic links from generated
dependencies, but this has a small drawback: changing perm/owner on a
symlink will go unnoticed.


Signed-off-by: Maxime Bizon <mbizon@freebox.fr>

--- linux-2.6.28.4/scripts/gen_initramfs_list.sh.old	2009-02-09 18:22:26.000000000 +0100
+++ linux-2.6.28.4/scripts/gen_initramfs_list.sh	2009-02-09 18:21:54.000000000 +0100
@@ -97,7 +97,7 @@
 }
 
 list_parse() {
-	echo "$1 \\"
+	[ ! -L "$1" ] && echo "$1 \\" || :
 }
 
 # for each file print a line in following format


-- 
Maxime


