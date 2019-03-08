Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:53981 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfCHMpJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 07:45:09 -0500
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH v1 3/5] scripts: mkdebian: fix missing dependencies
Date: Fri,  8 Mar 2019 13:44:22 +0100
Message-Id: <1552049064-32044-4-git-send-email-info@metux.net>
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, info@metux.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

We missed some build dependencies in the generated debian/control file.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index ff226be..1caaf0b 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -173,7 +173,7 @@ Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
-Build-Depends: bc, kmod, cpio
+Build-Depends: bc, kmod, cpio, bison, libelf-dev, libssl-dev, flex
 Homepage: http://www.kernel.org/
 
 Package: $packagename
-- 
1.9.1
