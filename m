Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rere.qmqm.pl ([91.227.64.183]:34475 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbgANSLb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jan 2020 13:11:31 -0500
Date: Tue, 14 Jan 2020 19:11:26 +0100
Message-Id: <e026b0d7a2eceaa1745a001baa9f950ce546addb.1579025325.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2] builddeb: allow selection of .deb compressor
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Select deb compression using KDEB_COMPRESS make variable. This allows to
use gzip compression for local or test builds, and that's way faster
than now-default xz compression.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 v2: rename KPKG_COMPRESS to KDEB_COMPRESS as suggested by Masahiro Yamada
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c4c580f547ef..b68aaeece7c9 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -43,7 +43,7 @@ create_package() {
 
 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
-	dpkg --build "$pdir" ..
+	dpkg-deb ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
 }
 
 version=$KERNELRELEASE
-- 
2.20.1
