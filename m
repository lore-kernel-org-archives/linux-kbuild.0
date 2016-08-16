Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailhub.sw.ru ([195.214.232.25]:4730 "EHLO relay.sw.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753468AbcHPNf1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 09:35:27 -0400
From: Dmitry Monakhov <dmonakhov@openvz.org>
Subject: [PATCH 1/2] scripts: buildtar fix build w/o modules
Date: Tue, 16 Aug 2016 17:35:13 +0400
Message-Id: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dmitry Monakhov <dmonakhov@openvz.org>

If build configured w/o modules script fails because lib/ is not exit.

Signed-off-by: Dmitry Monakhov <dmonakhov@openvz.org>
---
 scripts/package/buildtar | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e046bff..c64e6eb 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -129,7 +129,7 @@ esac
 	if tar --owner=root --group=root --help >/dev/null 2>&1; then
 		opts="--owner=root --group=root"
 	fi
-	tar cf - -C "$tmpdir" boot/ lib/ $opts | ${compress} > "${tarball}${file_ext}"
+	tar cf - -C "$tmpdir" . $opts | ${compress} > "${tarball}${file_ext}"
 )
 
 echo "Tarball successfully created in ${tarball}${file_ext}"
-- 
2.7.4

