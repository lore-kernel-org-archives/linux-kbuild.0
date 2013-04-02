Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:57315 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760406Ab3DBT26 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Apr 2013 15:28:58 -0400
Received: by mail-la0-f47.google.com with SMTP id fj20so724895lab.6
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Apr 2013 12:28:56 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [PATCH] kbuild: doc: fix wrong ld-option example
Date: Tue,  2 Apr 2013 23:30:31 +0400
Message-Id: <1364931031-7573-1-git-send-email-antonynpavlov@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Antony Pavlov <antonynpavlov@gmail.com>

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 Documentation/kbuild/makefiles.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 5198b74..5836294 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -593,7 +593,7 @@ more details, with real examples.
 
 	Example:
 		#Makefile
-		LDFLAGS_vmlinux += $(call really-ld-option, -X)
+		LDFLAGS_vmlinux += $(call ld-option, -X)
 
 
 === 4 Host Program support
-- 
1.7.10.4

