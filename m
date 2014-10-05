Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.asbjorn.biz ([81.7.185.110]:54974 "EHLO mail.asbjorn.biz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751827AbaJERtA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Oct 2014 13:49:00 -0400
From: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
Subject: [PATCH] deb-pkg: remove obsolete -isp option to dpkg-gencontrol
Date: Sun,  5 Oct 2014 17:43:18 +0000
Message-Id: <1412530998-31193-1-git-send-email-asbjorn@asbjorn.biz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The -isp option has been deprecated, after it became the default
behaviour back in 2006.

Since dpkg 1.17.11, dpkg-gencontrol emits a warning on -isp usage.

References: https://bugs.debian.org/215233
Signed-off-by: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 35d5a58..1453a55 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -64,7 +64,7 @@ create_package() {
 	fi
 
 	# Create the package
-	dpkg-gencontrol -isp $forcearch -Vkernel:debarch="${debarch:-$(dpkg --print-architecture)}" -p$pname -P"$pdir"
+	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch:-$(dpkg --print-architecture)}" -p$pname -P"$pdir"
 	dpkg --build "$pdir" ..
 }
 
-- 
2.1.1

