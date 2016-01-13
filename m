Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from walmailout10.yourhostingaccount.com ([65.254.253.83]:43490 "EHLO
	walmailout10.yourhostingaccount.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751091AbcAMPjh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jan 2016 10:39:37 -0500
Received: from walmailscan15.yourhostingaccount.com ([10.1.15.15] helo=walmailscan15.yourhostingaccount.com)
	by walmailout10.yourhostingaccount.com with esmtp (Exim)
	id 1aJNWJ-0006i9-2O
	for linux-kbuild@vger.kernel.org; Wed, 13 Jan 2016 10:39:35 -0500
Received: from [10.114.3.32] (helo=walimpout12)
	by walmailscan15.yourhostingaccount.com with esmtp (Exim)
	id 1aJNWI-0006PI-TA
	for linux-kbuild@vger.kernel.org; Wed, 13 Jan 2016 10:39:34 -0500
Message-ID: <92dc47c01a2dd7bd13c71b9febae317a.squirrel@email.powweb.com>
In-Reply-To: <9c3047e63bc6451f171bb677b8605e04.squirrel@email.powweb.com>
References: <9c3047e63bc6451f171bb677b8605e04.squirrel@email.powweb.com>
Date: Wed, 13 Jan 2016 19:39:07 +0400
Subject: [PATCH] v2 linux-next scripts/sign-file.c Fix LibreSSL support
From: "Codarren Velvindron" <codarren@hackers.mu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: codarren@hackers.mu
Cc: linux-kbuild@vger.kernel.org


-Fix SSL headers so that the kernel can build with LibreSSL

In file included from scripts/sign-file.c:47:0:
/usr/include/openssl/cms.h:62:2: error: #error CMS is disabled.
 #error CMS is disabled.
  ^
scripts/Makefile.host:91: recipe for target 'scripts/sign-file' failed
make[1]: *** [scripts/sign-file] Error 1
Makefile:567: recipe for target 'scripts' failed
make: *** [scripts] Error 2


Signed-off-by: Codarren Velvindron <codarren@hackers.mu>
---
 scripts/sign-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 250a7a6..a0b806d 100755
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -39,7 +39,7 @@
  * signing with anything other than SHA1 - so we're stuck with that if
such is
  * the case.
  */
-#if OPENSSL_VERSION_NUMBER < 0x10000000L
+#if (OPENSSL_VERSION_NUMBER < 0x10000000L || LIBRESSL_VERSION_NUMBER)
 #define USE_PKCS7
 #endif
 #ifndef USE_PKCS7
--
2.7.0


