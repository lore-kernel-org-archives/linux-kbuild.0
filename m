Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:49283 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752195Ab1EDGAK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 02:00:10 -0400
From: Nuno Subtil <subtil@gmail.com>
Subject: [PATCH 1/1] deb-pkg: fix cross-compile build
Date: Tue,  3 May 2011 22:59:10 -0700
Message-Id: <1304488750-13606-1-git-send-email-subtil@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nuno Subtil <subtil@gmail.com>

When generating the header package, scripts/package/builddeb was inferring the
target architecture by looking at the output of dpkg --print-architecture. This
allows KBUILD_DEBARCH to override that.

Signed-off-by: Nuno Subtil <subtil@gmail.com>
---
 scripts/package/builddeb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f6cbc3d..9372145 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -246,7 +246,12 @@ mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
 rm -f /tmp/files$$ /tmp/objfiles$$
-arch=$(dpkg --print-architecture)
+
+if [ -n "$KBUILD_DEBARCH" ] ; then
+	arch="$KBUILD_DEBARCH"
+else
+	arch=$(dpkg --print-architecture)
+fi
 
 cat <<EOF >> debian/control
 
-- 
1.7.4.4

Please Cc me on any replies related to this patch.

Thanks,
Nuno

