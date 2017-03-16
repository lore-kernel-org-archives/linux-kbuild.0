Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:61060 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751763AbdCPOcq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Mar 2017 10:32:46 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kbuild: fix compile time regression
Date: Thu, 16 Mar 2017 15:31:09 +0100
Message-Id: <20170316143124.1513546-1-arnd@arndb.de>
In-Reply-To: <CAK8P3a0792yTULUhMi2Tj0KzA_nRznnZ2-vVa9Ga_8pNe5UbNg@mail.gmail.com>
References: <CAK8P3a0792yTULUhMi2Tj0KzA_nRznnZ2-vVa9Ga_8pNe5UbNg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

I noticed that a patch I did causes the time for a clean rebuild to
go up significantly, from 13 to 18 seconds on ARM defconfig, and
in the worst case forcing a rebuild of every file each time.

The fix is very simple, using a ':=' assignment instead of '='
to force the cc-disable-warning call to only be evaluated once
instead of every time.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3a964fa3a787..e7d4d20deb4e 100644
--- a/Makefile
+++ b/Makefile
@@ -381,7 +381,7 @@ LDFLAGS_MODULE  =
 CFLAGS_KERNEL	=
 AFLAGS_KERNEL	=
 LDFLAGS_vmlinux =
-CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
+CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
 CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 
 ifeq ($(COMPILER),clang)
-- 
2.9.0

