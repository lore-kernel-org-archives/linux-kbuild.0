Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57004 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751869AbdJGARy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2017 20:17:54 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Makefile: kselftest: fix grammar typo
Message-ID: <dbbd3042-18ae-991a-cce7-52933cd61e95@infradead.org>
Date: Fri, 6 Oct 2017 17:17:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jiri Kosina <trivial@kernel.org>, "Cc: Shuah Khan" <shuah@kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Correct typo in kselftest help text.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc:	Shuah Khan <shuah@kernel.org>
Cc:	linux-kselftest@vger.kernel.org
Cc:	Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:	Jiri Kosina <trivial@kernel.org>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-414-rc3.orig/Makefile
+++ lnx-414-rc3/Makefile
@@ -1395,7 +1395,7 @@ help:
 	@echo  '                    Build, install, and boot kernel before'
 	@echo  '                    running kselftest on it'
 	@echo  '  kselftest-clean - Remove all generated kselftest files'
-	@echo  '  kselftest-merge - Merge all the config dependencies of kselftest to existed'
+	@echo  '  kselftest-merge - Merge all the config dependencies of kselftest to existing'
 	@echo  '                    .config.'
 	@echo  ''
 	@echo 'Userspace tools targets:'


