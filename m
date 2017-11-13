Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:27941 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752340AbdKMK6a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:58:30 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] sh: decompressor: ignore shipped files
Date: Mon, 13 Nov 2017 19:58:09 +0900
Message-Id: <1510570689-30737-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-sh@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, linux-kernel@vger.kernel.org

These files are copied from arch/sh/lib, so should be ignored by git.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/sh/boot/compressed/.gitignore | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/sh/boot/compressed/.gitignore b/arch/sh/boot/compressed/.gitignore
index 2374a83..edff113 100644
--- a/arch/sh/boot/compressed/.gitignore
+++ b/arch/sh/boot/compressed/.gitignore
@@ -1 +1,6 @@
+ashiftrt.S
+ashldi3.c
+ashlsi3.S
+ashrsi3.S
+lshrsi3.S
 vmlinux.bin.*
-- 
2.7.4

