Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:37144 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751227AbbFPCRl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Jun 2015 22:17:41 -0400
From: Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH] builddeb: sign the modules after splitting out the debuginfo files
Date: Mon, 15 Jun 2015 22:17:26 -0400
Message-Id: <1434421046-4020-1-git-send-email-tytso@mit.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel Developers List <linux-kernel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>

Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 scripts/package/builddeb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 88dbf23..159ec7c 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -163,6 +163,9 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 			$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $tmpdir/$module
 		done
 	fi
+	if grep -q '^CONFIG_MODULE_SIG=y' $KCONFIG_CONFIG ; then
+		INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_sign
+	fi
 fi
 
 if [ "$ARCH" != "um" ]; then
-- 
2.3.0

