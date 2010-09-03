Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp13.ono.com ([62.42.230.16]:52216 "EHLO resmaa13.ono.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753764Ab0ICCjb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Sep 2010 22:39:31 -0400
Date: Fri, 3 Sep 2010 04:33:28 +0200
From: Guillem Jover <guillem@hadrons.org>
Subject: [PATCH] kbuild, deb-pkg: Check if KBUILD_IMAGE exists before
 copying it
Message-ID: <20100903023328.GA15380@gaara.hadrons.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Avoid an error when doing cp over the image when it does not contain
the full path to the file.

Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/builddeb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5f1e2fc..49b74e1 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -66,7 +66,9 @@ else
 	cp System.map "$tmpdir/boot/System.map-$version"
 	cp .config "$tmpdir/boot/config-$version"
 	# Not all arches include the boot path in KBUILD_IMAGE
-	if ! cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"; then
+	if [ -e $KBUILD_IMAGE ]; then
+		cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
+	else
 		cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
 	fi
 fi
-- 
1.7.1

