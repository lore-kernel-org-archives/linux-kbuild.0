Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59216 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfANNvt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 08:51:49 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/12] selftests: intel_pstate: Remove unused header dependency rule
Date: Mon, 14 Jan 2019 14:51:42 +0100
Message-Id: <20190114135144.26096-11-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

The intel_pstate test doesn't contain any header files, so there is no
need to declare a rule for header dependencies.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/testing/selftests/intel_pstate/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/intel_pstate/Makefile b/tools/testing/selftests/intel_pstate/Makefile
index 7340fd6a9a9f2cbd..3f51f9226286f661 100644
--- a/tools/testing/selftests/intel_pstate/Makefile
+++ b/tools/testing/selftests/intel_pstate/Makefile
@@ -12,5 +12,3 @@ endif
 TEST_PROGS := run.sh
 
 include ../lib.mk
-
-$(TEST_GEN_FILES): $(HEADERS)
-- 
2.17.1
