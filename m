Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:46679 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfBGQlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 11:41:19 -0500
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 3/4] scripts: mkdebian: fix dependencies
Date: Thu,  7 Feb 2019 17:40:58 +0100
Message-Id: <1549557659-19137-4-git-send-email-info@metux.net>
In-Reply-To: <1549557659-19137-1-git-send-email-info@metux.net>
References: <1549557659-19137-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

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
