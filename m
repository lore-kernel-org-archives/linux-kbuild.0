Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143]:60428 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932267AbcELJFJ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 May 2016 05:05:09 -0400
From: Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH] deb-pkg: add the shared header file for arm64
Date: Thu, 12 May 2016 17:03:57 +0800
Message-ID: <1463043837-4348-1-git-send-email-shijie.huang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: nd@arm.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, steve.capper@arm.com, Huang Shijie <shijie.huang@arm.com>

The arch/arm/include/asm/opcodes.h is also used by the arm64.
This patch copies it to the arm64 deb package.

Signed-off-by: Huang Shijie <shijie.huang@arm.com>
---
 scripts/package/builddeb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6c3b038..f4de0d7 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -323,6 +323,12 @@ fi
 # Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
+
+if [ "$ARCH" = "arm64" ]; then
+	# The arm64 shares the same header file with the arm
+	(cd $srctree; echo arch/arm/include/asm/opcodes.h) >> "$objtree/debian/hdrsrcfiles"
+fi
+
 (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
-- 
2.1.4

