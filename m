Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from walmailout04.yourhostingaccount.com ([65.254.253.36]:45217 "EHLO
	walmailout04.yourhostingaccount.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752483AbcAMIV7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jan 2016 03:21:59 -0500
Received: from mailscan11.yourhostingaccount.com ([10.1.15.11] helo=walmailscan11.yourhostingaccount.com)
	by walmailout04.yourhostingaccount.com with esmtp (Exim)
	id 1aJGBK-0000X1-VP
	for linux-kbuild@vger.kernel.org; Wed, 13 Jan 2016 02:49:26 -0500
Received: from [10.114.3.33] (helo=walimpout13)
	by walmailscan11.yourhostingaccount.com with esmtp (Exim)
	id 1aJGBK-0002GZ-Qu
	for linux-kbuild@vger.kernel.org; Wed, 13 Jan 2016 02:49:26 -0500
Received: from [127.0.0.1] (helo=email.powweb.com)
	by walwebmail02.yourhostingaccount.com with esmtp (Exim)
	id 1aJGBF-0007IZ-RI
	for linux-kbuild@vger.kernel.org; Wed, 13 Jan 2016 02:49:21 -0500
Message-ID: <9c3047e63bc6451f171bb677b8605e04.squirrel@email.powweb.com>
Date: Wed, 13 Jan 2016 02:49:21 -0500
Subject: [PATCH] [linux-next] scripts/sign-file.c Fix LibreSSL support]
From: codarren@hackers.mu
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

HOSTCC  scripts/sign-file In file included from
scripts/sign-file.c:46:0: /usr/include/openssl/cms.h:62:2: error: #error CMS
is disabled.  #error CMS is disabled.   ^ scripts/Makefile.host:91: recipe
for target 'scripts/sign-file' failed make[1]: *** [scripts/sign-file] Error
1 Makefile:567: recipe for target 'scripts' failed make: *** [scripts] Error
2

Fix SSL headers so that the kernel can build with LibreSSL
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



