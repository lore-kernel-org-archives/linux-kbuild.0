Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailhub.sw.ru ([195.214.232.25]:33394 "EHLO relay.sw.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753498AbcHPNf1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 09:35:27 -0400
From: Dmitry Monakhov <dmonakhov@openvz.org>
Subject: [PATCH 2/2] scripts: buildtar use parallel compress if available
Date: Tue, 16 Aug 2016 17:35:14 +0400
Message-Id: <1471354514-12323-2-git-send-email-dmonakhov@openvz.org>
In-Reply-To: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org>
References: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dmitry Monakhov <dmonakhov@openvz.org>

Signed-off-by: Dmitry Monakhov <dmonakhov@openvz.org>
---
 scripts/package/buildtar | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index c64e6eb..d0d790f 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -29,14 +29,17 @@ case "${1}" in
 		;;
 	targz-pkg)
 		compress="gzip"
+		type pigz >/dev/null 2>&1 && compress="pigz"
 		file_ext=".gz"
 		;;
 	tarbz2-pkg)
 		compress="bzip2"
+		type lbzip2 >/dev/null 2>&1 && compress="lbzip2"
 		file_ext=".bz2"
 		;;
 	tarxz-pkg)
 		compress="xz"
+		type pxz >/dev/null 2>&1 && compress="pxz"
 		file_ext=".xz"
 		;;
 	*)
-- 
2.7.4

