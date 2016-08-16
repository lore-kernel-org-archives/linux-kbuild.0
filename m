Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailhub.sw.ru ([195.214.232.25]:16889 "EHLO relay.sw.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752053AbcHPVjo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 17:39:44 -0400
From: Dmitry Monakhov <dmonakhov@openvz.org>
Subject: [PATCH 2/2] scripts: buildtar use parallel compress if available v2
Date: Wed, 17 Aug 2016 01:39:37 +0400
Message-Id: <1471383577-18173-2-git-send-email-dmonakhov@openvz.org>
In-Reply-To: <1471383577-18173-1-git-send-email-dmonakhov@openvz.org>
References: <1471383577-18173-1-git-send-email-dmonakhov@openvz.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dmitry Monakhov <dmonakhov@openvz.org>

Signed-off-by: Dmitry Monakhov <dmonakhov@openvz.org>
---
 scripts/package/buildtar | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 27a2ed3..d53f879 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -29,14 +29,17 @@ case "${1}" in
 		;;
 	targz-pkg)
 		compress="gzip"
+		which pigz >/dev/null 2>&1 && compress="pigz"
 		file_ext=".gz"
 		;;
 	tarbz2-pkg)
 		compress="bzip2"
+		which lbzip2 >/dev/null 2>&1 && compress="lbzip2"
 		file_ext=".bz2"
 		;;
 	tarxz-pkg)
 		compress="xz"
+		which pxz >/dev/null 2>&1 && compress="pxz"
 		file_ext=".xz"
 		;;
 	*)
-- 
2.7.4

