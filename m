Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:40670 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbfAKJw1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Jan 2019 04:52:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] firmware_loader: move firmware/ to drivers/base/firmware_loader/builtin/
Date: Fri, 11 Jan 2019 18:52:00 +0900
Message-Id: <1547200321-17120-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>

Currently, the 'firmware' directory only contains a single Makefile
to embed extra firmware into the kernel.

Move it to the more relevant place.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                                                      | 2 +-
 drivers/base/firmware_loader/Makefile                         | 2 ++
 {firmware => drivers/base/firmware_loader/builtin}/.gitignore | 0
 {firmware => drivers/base/firmware_loader/builtin}/Makefile   | 0
 4 files changed, 3 insertions(+), 1 deletion(-)
 rename {firmware => drivers/base/firmware_loader/builtin}/.gitignore (100%)
 rename {firmware => drivers/base/firmware_loader/builtin}/Makefile (100%)

diff --git a/Makefile b/Makefile
index 8c55b64..1625c99 100644
--- a/Makefile
+++ b/Makefile
@@ -583,7 +583,7 @@ export KBUILD_MODULES KBUILD_BUILTIN
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
 init-y		:= init/
-drivers-y	:= drivers/ sound/ firmware/
+drivers-y	:= drivers/ sound/
 net-y		:= net/
 libs-y		:= lib/
 core-y		:= usr/
diff --git a/drivers/base/firmware_loader/Makefile b/drivers/base/firmware_loader/Makefile
index 5c7f422..0b2dfa6 100644
--- a/drivers/base/firmware_loader/Makefile
+++ b/drivers/base/firmware_loader/Makefile
@@ -5,3 +5,5 @@ obj-$(CONFIG_FW_LOADER_USER_HELPER) += fallback_table.o
 obj-$(CONFIG_FW_LOADER)	+= firmware_class.o
 firmware_class-objs := main.o
 firmware_class-$(CONFIG_FW_LOADER_USER_HELPER) += fallback.o
+
+obj-y += builtin/
diff --git a/firmware/.gitignore b/drivers/base/firmware_loader/builtin/.gitignore
similarity index 100%
rename from firmware/.gitignore
rename to drivers/base/firmware_loader/builtin/.gitignore
diff --git a/firmware/Makefile b/drivers/base/firmware_loader/builtin/Makefile
similarity index 100%
rename from firmware/Makefile
rename to drivers/base/firmware_loader/builtin/Makefile
-- 
2.7.4
