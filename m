Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51464 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfANNvs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 08:51:48 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/12] selftests: Fix output directory with O=
Date: Mon, 14 Jan 2019 14:51:34 +0100
Message-Id: <20190114135144.26096-3-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

When building kselftest in a separate output directory, the individual
test directories end up in the root of the output directory, instead of
under tools/testing/selftests/.

Fix this by passing the expected path to the make subprocess.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 088059312237b5d5..ed7c1ea324e97ac2 100644
--- a/Makefile
+++ b/Makefile
@@ -1191,11 +1191,11 @@ endif
 
 PHONY += kselftest
 kselftest:
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests O=$(abspath $(objtree)/tools/testing/selftests)
 
 PHONY += kselftest-clean
 kselftest-clean:
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean O=$(abspath $(objtree)/tools/testing/selftests)
 
 PHONY += kselftest-merge
 kselftest-merge:
-- 
2.17.1
