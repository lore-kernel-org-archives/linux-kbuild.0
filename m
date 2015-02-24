Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34435 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436AbbBXTgg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Feb 2015 14:36:36 -0500
Received: by mail-ob0-f172.google.com with SMTP id nt9so45750843obb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2015 11:36:35 -0800 (PST)
Message-ID: <54ECD2C2.8010405@collins.email>
Date: Tue, 24 Feb 2015 13:36:34 -0600
From: David Collins <david@collins.email>
MIME-Version: 1.0
Subject: Improve compile test option grammar
Content-Type: multipart/mixed;
 boundary="------------080708030101020302030406"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, trivial@kernel.org, david@davidibarra.net

This is a multi-part message in MIME format.
--------------080708030101020302030406
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey everyone,
This is a pretty trivial patch, but it kind of stuck out while I was 
going through the kernel menu options.  This patch removes the unneeded 
word "also" from the CONFIG_COMPILE_TEST option in Kconfig.

--------------080708030101020302030406
Content-Type: text/x-diff;
 name="improve_compile_test_grammar.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="improve_compile_test_grammar.patch"

Improve grammar by removing the word "also" from CONFIG_COMPILE_TEST option.

Signed-off-by: David Ibarra <david@davidibarra.net>
Signed-off-by: David Collins <david@collins.email>

--- linux/init/Kconfig.orig	2015-02-24 15:00:48.970000000 -0600
+++ linux/init/Kconfig	2015-02-24 15:03:07.600000000 -0600
@@ -54,7 +54,7 @@ config CROSS_COMPILE
 	  directory to select the cross-compiler automatically.
 
 config COMPILE_TEST
-	bool "Compile also drivers which will not load"
+	bool "Compile drivers which will not load"
 	default n
 	help
 	  Some drivers can be compiled on a different platform than they are


--------------080708030101020302030406--
