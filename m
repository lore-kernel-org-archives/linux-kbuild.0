Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:54892 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752434AbZGWSzU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Jul 2009 14:55:20 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH] sparc64: list zImage build target in 'make help' output
Date: Thu, 23 Jul 2009 20:55:18 +0200
References: <200907162041.53181.elendil@planet.nl>
In-Reply-To: <200907162041.53181.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907232055.19176.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sparclinux@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Jurij Smakov <jurij@wooyd.org>, David Miller <davem@davemloft.net>

The zImage target was added and gets built by default.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: Jurij Smakov <jurij@wooyd.org>
---

While looking at Sam Ravnborg's comments I noticed that the following
should be added on top of Jurij's patch.

David: if you prefer to merge this into the previous patch, that'd be
fine by me.

diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index 2adc5ea..b588880 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -112,8 +112,9 @@ define archhelp
 endef
 else
 define archhelp
-  echo  '* vmlinux       - Standard sparc64 kernel'
-  echo  '  vmlinux.aout  - a.out kernel for sparc64'
+  echo  '* vmlinux      - standard sparc64 kernel'
+  echo  '* zImage       - stripped and compressed sparc64 kernel ($(boot)/zImage)'
+  echo  '  vmlinux.aout - a.out kernel for sparc64'
   echo  '  tftpboot.img - image prepared for tftp'
 endef
 endif
