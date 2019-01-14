Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:42456 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfANNvs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 08:51:48 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/12] selftests: sparc64: Remove superfluous rules
Date: Mon, 14 Jan 2019 14:51:41 +0100
Message-Id: <20190114135144.26096-10-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

"all" and the generic %.c dependency are already handled by the included
lib.mk.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/testing/selftests/sparc64/drivers/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/testing/selftests/sparc64/drivers/Makefile b/tools/testing/selftests/sparc64/drivers/Makefile
index deb0df4155659ec1..174dbd675f1f8264 100644
--- a/tools/testing/selftests/sparc64/drivers/Makefile
+++ b/tools/testing/selftests/sparc64/drivers/Makefile
@@ -4,10 +4,6 @@ CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
 
 TEST_GEN_FILES := adi-test
 
-all: $(TEST_GEN_FILES)
-
-$(TEST_GEN_FILES): adi-test.c
-
 TEST_PROGS := drivers_test.sh
 
 include ../../lib.mk
-- 
2.17.1
