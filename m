Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-il1-f193.google.com ([209.85.166.193]:34255 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgC3SHP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 14:07:15 -0400
Received: by mail-il1-f193.google.com with SMTP id t11so16794088ils.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2020 11:07:14 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] Makefile: Update kselftest help information
Date: Mon, 30 Mar 2020 12:07:11 -0600
Message-Id: <20200330180711.14393-1-skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, michal.lkml@markovi.net
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Update kselftest help information.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Makefile | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index e56bf7ef182d..5e5c770423c7 100644
--- a/Makefile
+++ b/Makefile
@@ -1470,12 +1470,15 @@ help:
 	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
 	@echo  ''
 	@echo  'Kernel selftest:'
-	@echo  '  kselftest       - Build and run kernel selftest (run as root)'
-	@echo  '                    Build, install, and boot kernel before'
-	@echo  '                    running kselftest on it'
-	@echo  '  kselftest-clean - Remove all generated kselftest files'
-	@echo  '  kselftest-merge - Merge all the config dependencies of kselftest to existing'
-	@echo  '                    .config.'
+	@echo  '  kselftest         - Build and run kernel selftest'
+	@echo  '                      Build, install, and boot kernel before'
+	@echo  '                      running kselftest on it'
+	@echo  '                      Run as root for full coverage'
+	@echo  '  kselftest-all     - Build kernel selftest'
+	@echo  '  kselftest-install - Build and install kernel selftest'
+	@echo  '  kselftest-clean   - Remove all generated kselftest files'
+	@echo  '  kselftest-merge   - Merge all the config dependencies of'
+	@echo  '		      kselftest to existing .config.'
 	@echo  ''
 	@$(if $(dtstree), \
 		echo 'Devicetree:'; \
-- 
2.20.1
