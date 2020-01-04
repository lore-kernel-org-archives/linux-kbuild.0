Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rere.qmqm.pl ([91.227.64.183]:52047 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgADJz6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 04:55:58 -0500
Date: Sat, 04 Jan 2020 10:55:52 +0100
Message-Id: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/2] builddeb: allow selection of .deb compressor
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Select deb compression using KPKG_COMPRESS make variable. This allows to
use gzip compression for local or test builds, and that's way faster
than now-default xz compression.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c4c580f547ef..d289c4ebc891 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -43,7 +43,7 @@ create_package() {
 
 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
-	dpkg --build "$pdir" ..
+	dpkg-deb ${KPKG_COMPRESS:+-Z$KPKG_COMPRESS} --build "$pdir" ..
 }
 
 version=$KERNELRELEASE
-- 
2.20.1
