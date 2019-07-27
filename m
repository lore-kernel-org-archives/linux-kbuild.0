Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:53478 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfG0DBg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jul 2019 23:01:36 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gen_compile_commands: lower the entry count threshold
Date: Sat, 27 Jul 2019 12:01:10 +0900
Message-Id: <20190727030110.17208-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Tom Roeder <tmroeder@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Running gen_compile_commands.py after building with allnoconfig
gave this:

$ ./scripts/gen_compile_commands.py
WARNING: Found 449 entries. Have you compiled the kernel?

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/gen_compile_commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 7915823b92a5..c458696ef3a7 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -21,9 +21,9 @@ _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 
 # A kernel build generally has over 2000 entries in its compile_commands.json
-# database. If this code finds 500 or fewer, then warn the user that they might
+# database. If this code finds 300 or fewer, then warn the user that they might
 # not have all the .cmd files, and they might need to compile the kernel.
-_LOW_COUNT_THRESHOLD = 500
+_LOW_COUNT_THRESHOLD = 300
 
 
 def parse_arguments():
-- 
2.17.1
