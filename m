Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:41225 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753224AbeGFGev (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 02:34:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add LDFLAGS_KERNEL to pass additional linker flags for vmlinux
Date: Fri,  6 Jul 2018 15:34:03 +0900
Message-Id: <1530858843-14997-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Kbuild provides LDFLAGS_MODULE to allows users to give additional
options for linking modules, but there is no way to append flags for
linking vmlinux.

It is true LDFLAGS_vmlinux specifies the linker options for vmlinux,
but it is only for internal-use.

We have CFLAGS_KERNEL, AFLAGS_KERNEL already, so LDFLAGS_KERNEL is
the same pattern.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/kbuild.txt | 4 ++++
 Makefile                        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6c9c69e..f3a0a47 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -46,6 +46,10 @@ CFLAGS_MODULE
 --------------------------------------------------
 Additional module specific options to use for $(CC).
 
+LDFLAGS_KERNEL
+--------------------------------------------------
+Additional options used for $(LD) when linking vmlinux.
+
 LDFLAGS_MODULE
 --------------------------------------------------
 Additional options used for $(LD) when linking modules.
diff --git a/Makefile b/Makefile
index 58bd78b..6f9f4b1 100644
--- a/Makefile
+++ b/Makefile
@@ -848,6 +848,8 @@ ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
 LDFLAGS_vmlinux	+= $(call ld-option, -X,)
 endif
 
+LDFLAGS_vmlinux += $(LDFLAGS_KERNEL)
+
 # insure the checker run with the right endianness
 CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
 
-- 
2.7.4

