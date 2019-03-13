Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36615 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfCMTun (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 15:50:43 -0400
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH] kbuild: deb-pkg: set executable bit for debian/rules
Date: Wed, 13 Mar 2019 20:50:28 +0100
Message-Id: <20190313195028.18196-1-malat@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This will remove the warning:

  dpkg-buildpackage: warning: debian/rules is not executable; fixing that

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 scripts/package/mkdebian | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index f030961c5165..3c6c82f28cac 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -221,5 +221,6 @@ clean:
 
 binary: binary-arch
 EOF
+chmod +x debian/rules
 
 exit 0
-- 
2.20.1
