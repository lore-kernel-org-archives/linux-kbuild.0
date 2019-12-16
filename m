Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:35153 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfLPUIb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 15:08:31 -0500
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] scripts: package: mkdebian: add missing rsync dependency
Date: Mon, 16 Dec 2019 21:07:19 +0100
Message-Id: <20191216200719.30479-1-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: masahiroy@kernel.org, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

We've missed the dependency to rsync, so build fails on
minimal containers.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index e0750b70453f..7c230016b08d 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -174,7 +174,7 @@ Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
-Build-Depends: bc, kmod, cpio, bison, flex | flex:native $extra_build_depends
+Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
 Homepage: http://www.kernel.org/
 
 Package: $packagename
-- 
2.11.0
