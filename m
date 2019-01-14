Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59252 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfANNvt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 08:51:49 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/12] selftests: timestamping: Remove superfluous rules
Date: Mon, 14 Jan 2019 14:51:40 +0100
Message-Id: <20190114135144.26096-9-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

    Makefile:14: warning: overriding recipe for target 'clean'
    ../../lib.mk:137: warning: ignoring old recipe for target 'clean'

"all" and "clean" are already handled by the included lib.mk.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/testing/selftests/networking/timestamping/Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/testing/selftests/networking/timestamping/Makefile b/tools/testing/selftests/networking/timestamping/Makefile
index 9050eeea5f5f2953..49ede79660c0208d 100644
--- a/tools/testing/selftests/networking/timestamping/Makefile
+++ b/tools/testing/selftests/networking/timestamping/Makefile
@@ -4,11 +4,6 @@ CFLAGS += -I../../../../../usr/include
 TEST_GEN_FILES := hwtstamp_config rxtimestamp timestamping txtimestamp
 TEST_PROGS := txtimestamp.sh
 
-all: $(TEST_PROGS)
-
 top_srcdir = ../../../../..
 KSFT_KHDR_INSTALL := 1
 include ../../lib.mk
-
-clean:
-	rm -fr $(TEST_GEN_FILES)
-- 
2.17.1
