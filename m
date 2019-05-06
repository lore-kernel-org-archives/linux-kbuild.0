Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbfEFMrF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 08:47:05 -0400
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MAINTAINERS: kbuild: Add pattern for scripts/*vmlinux*
Date: Mon,  6 May 2019 14:47:00 +0200
Message-Id: <1557146820-13059-1-git-send-email-krzk@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>

scripts/link-vmlinux.sh is part of kbuild so extend the pattern to match
any vmlinux related scripts.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c61c49dd3643..aa0a61c7736b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8523,6 +8523,7 @@ F:	scripts/Kbuild*
 F:	scripts/Makefile*
 F:	scripts/basic/
 F:	scripts/mk*
+F:	scripts/*vmlinux*
 F:	scripts/mod/
 F:	scripts/package/
 
-- 
2.7.4
