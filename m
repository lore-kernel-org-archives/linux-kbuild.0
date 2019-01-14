Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:39658 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfANNvs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 08:51:48 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/12] selftests: seccomp: Fix test dependencies and rules
Date: Mon, 14 Jan 2019 14:51:37 +0100
Message-Id: <20190114135144.26096-6-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

When building kselftest in a separate output directory, the seccomp_bpf
binary ends up in the source directory instead of in the output
directory, and the build of seccomp_benchmark fails:

    make[5]: *** No rule to make target 'seccomp_benchmark', needed by 'all'.  Stop.

Fix this by declaring both test binaries using TEST_GEN_PROGS, and using
the build support from lib.mk properly.

Fixes: 967d7ba841513910 ("selftests/seccomp: Add simple seccomp overhead benchmark")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/testing/selftests/seccomp/Makefile | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/seccomp/Makefile b/tools/testing/selftests/seccomp/Makefile
index fce7f4ce069251a6..c728bd7a366f78b9 100644
--- a/tools/testing/selftests/seccomp/Makefile
+++ b/tools/testing/selftests/seccomp/Makefile
@@ -1,17 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-all:
 
-include ../lib.mk
-
-.PHONY: all clean
-
-BINARIES := seccomp_bpf seccomp_benchmark
 CFLAGS += -Wl,-no-as-needed -Wall
+LDFLAGS += -lpthread
 
-seccomp_bpf: seccomp_bpf.c ../kselftest_harness.h
-	$(CC) $(CFLAGS) $(LDFLAGS) -lpthread $< -o $@
+TEST_GEN_PROGS = seccomp_bpf seccomp_benchmark
 
-TEST_PROGS += $(BINARIES)
-EXTRA_CLEAN := $(BINARIES)
-
-all: $(BINARIES)
+include ../lib.mk
-- 
2.17.1
