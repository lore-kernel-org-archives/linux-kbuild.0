Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41128 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgB2QK2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Feb 2020 11:10:28 -0500
From: =?UTF-8?q?SZ=20Lin=20=28=E6=9E=97=E4=B8=8A=E6=99=BA=29?=
        <sz.lin@moxa.com>
Subject: [PATCH] kbuild: Fix inconsistent comment
Date: Sun,  1 Mar 2020 00:09:58 +0800
Message-Id: <20200229160959.871801-1-sz.lin@moxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: =?UTF-8?q?SZ=20Lin=20=28=E6=9E=97=E4=B8=8A=E6=99=BA=29?= <sz.lin@moxa.com>, Kaiden PK Yu <KaidenPK.Yu@moxa.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The commit 2042b5486bd3 ("kbuild: unset variables in top Makefile
instead of setting 0") renamed the variable from "config-targets"
to "config-build", the comment should be consistent accordingly.

Signed-off-by: Kaiden PK Yu (余泊鎧) <KaidenPK.Yu@moxa.com>
Signed-off-by: SZ Lin (林上智) <sz.lin@moxa.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 90ee2a22e88b..01ac935f28bd 100644
--- a/Makefile
+++ b/Makefile
@@ -1805,7 +1805,7 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-endif # config-targets
+endif # config-build
 endif # mixed-build
 endif # need-sub-make
 
-- 
2.25.1
