Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:56439 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751594AbdHRQLS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2017 12:11:18 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix alignment of GPERF log
Date: Sat, 19 Aug 2017 01:10:46 +0900
Message-Id: <1503072646-20707-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

When regenerating *.hash.c_shipped, the GPERF log is unaligned.

$ rm -rf scripts/kconfig/zconf.hash.c_shipped
$ make REGENERATE_PARSERS=1 defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  GPERF scripts/kconfig/zconf.hash.c_shipped
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
  ...

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 58c05e5d9870..06e2c577e3bc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -196,7 +196,7 @@ ifdef REGENERATE_PARSERS
 
 # GPERF
 # ---------------------------------------------------------------------------
-quiet_cmd_gperf = GPERF $@
+quiet_cmd_gperf = GPERF   $@
       cmd_gperf = gperf -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<
 
 .PRECIOUS: $(src)/%.hash.c_shipped
-- 
2.7.4

