Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gauss.credativ.com ([93.94.130.89]:34004 "EHLO
        gauss.credativ.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752259AbdGXPeZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Jul 2017 11:34:25 -0400
From: Sedat Dilek <sedat.dilek@credativ.de>
Subject: [PATCH] kbuild: Update example for ccflags-y usage
Date: Mon, 24 Jul 2017 17:27:05 +0200
Message-Id: <20170724152705.17131-1-sedat.dilek@credativ.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sedat Dilek <sedat.dilek@gmail.com>

From: Sedat Dilek <sedat.dilek@gmail.com>

The old example to describe ccflags-y usage is no more valid.

Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 Documentation/kbuild/makefiles.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 7003141a6d4f..cadfa882c275 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -297,9 +297,9 @@ more details, with real examples.
 	ccflags-y specifies options for compiling with $(CC).
 
 	Example:
-		# drivers/acpi/Makefile
-		ccflags-y := -Os
-		ccflags-$(CONFIG_ACPI_DEBUG) += -DACPI_DEBUG_OUTPUT
+		# drivers/acpi/acpica/Makefile
+		ccflags-y						:= -Os -D_LINUX -DBUILDING_ACPICA
+		ccflags-$(CONFIG_ACPI_DEBUG)	+= -DACPI_DEBUG_OUTPUT
 
 	This variable is necessary because the top Makefile owns the
 	variable $(KBUILD_CFLAGS) and uses it for compilation flags for the
-- 
2.11.0

