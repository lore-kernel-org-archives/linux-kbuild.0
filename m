Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51428 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfANNvs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 08:51:48 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/12] selftests: lib.mk: Add rule to build object file from C source file
Date: Mon, 14 Jan 2019 14:51:38 +0100
Message-Id: <20190114135144.26096-7-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Currently there are rules to compile and link one or more C or
assembler source files into a full executable, and to assemble a single
assembler source into an object file.

Add a generic rule to compile a single C source file into an object
file, for reuse of object files in multiple executables.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/testing/selftests/lib.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 8b0f16409ed7eb53..77a71264d8c5a743 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -141,6 +141,7 @@ clean:
 #
 ifneq ($(KBUILD_SRC),)
 LINK.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
+COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
 COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
 LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
 endif
@@ -151,6 +152,9 @@ ifeq ($(OVERRIDE_TARGETS),)
 $(OUTPUT)/%:%.c
 	$(LINK.c) $^ $(LDLIBS) -o $@
 
+$(OUTPUT)/%.o:%.c
+	$(COMPILE.c) $^ -o $@
+
 $(OUTPUT)/%.o:%.S
 	$(COMPILE.S) $^ -o $@
 
-- 
2.17.1
