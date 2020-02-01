Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44699 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgBAGZR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 01:25:17 -0500
From: Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 1/2] sanitize: Add SANITIZE_xx.o and SANITIZE to disable all sanitizers for specific files
Date: Sat,  1 Feb 2020 14:24:58 +0800
Message-Id: <20200201062459.7150-2-changbin.du@gmail.com>
In-Reply-To: <20200201062459.7150-1-changbin.du@gmail.com>
References: <20200201062459.7150-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, hpa@zytor.com, x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Changbin Du <changbin.du@gmail.com>

This patch add two new flags to disable all sanitizers (UBSAN and KASAN):
  o SANITIZE_xx.o - disable all sanitizers for a single file.
  o SANITIZE - disable all sanitizers for current directory.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 Documentation/dev-tools/kasan.rst | 12 ++++++++++++
 scripts/Makefile.lib              |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index e4d66e7c50de..f59fc5fb2cd8 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -55,6 +55,18 @@ similar to the following to the respective kernel Makefile:
 
     KASAN_SANITIZE := n
 
+Similarly, to disable all sanitizers (KASAN, UBSAN) for specific files or
+directories, add a line similar to the following to the respective kernel
+Makefile:
+
+- For a single file (e.g. main.o)::
+
+    SANITIZE_main.o := n
+
+- For all files in one directory::
+
+    SANITIZE := n
+
 Error reports
 ~~~~~~~~~~~~~
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fa32f83b2d7..9b7d784e3252 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -122,13 +122,13 @@ endif
 #
 ifeq ($(CONFIG_KASAN),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \
+		$(SANITIZE_$(basetarget).o)$(SANITIZE)$(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \
 		$(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
 endif
 
 ifeq ($(CONFIG_UBSAN),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
+		$(SANITIZE_$(basetarget).o)$(SANITIZE)$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
 		$(CFLAGS_UBSAN))
 endif
 
-- 
2.24.0
