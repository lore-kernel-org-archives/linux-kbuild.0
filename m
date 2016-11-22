Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44153 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755528AbcKVVfj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2016 16:35:39 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 6/6] deb-pkg: Remove the KBUILD_IMAGE workaround
Date: Tue, 22 Nov 2016 22:34:34 +0100
Message-Id: <20161122213434.14788-6-mmarek@suse.com>
In-Reply-To: <20161122213434.14788-1-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The arch Makefile are fixed to set KBUILD_IMAGE to the full patch, so
the workaround is no longer needed.

Signed-off-by: Michal Marek <mmarek@suse.com>
---
 scripts/package/builddeb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8ea9fd2b6573..dab997343f1a 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -143,12 +143,7 @@ else
 	cp System.map "$tmpdir/boot/System.map-$version"
 	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
 fi
-# Not all arches include the boot path in KBUILD_IMAGE
-if [ -e $KBUILD_IMAGE ]; then
-	cp $KBUILD_IMAGE "$tmpdir/$installed_image_path"
-else
-	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
-fi
+cp "$($MAKE -s image_name)" "$tmpdir/$installed_image_path"
 
 if grep -q "^CONFIG_OF=y" $KCONFIG_CONFIG ; then
 	# Only some architectures with OF support have this target
-- 
2.10.0

