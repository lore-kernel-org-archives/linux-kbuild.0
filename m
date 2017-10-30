Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:40025 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751900AbdJ3PfU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 11:35:20 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] .gitignore: sort normal pattern rules alphabetically
Date: Tue, 31 Oct 2017 00:33:45 +0900
Message-Id: <1509377627-11362-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
References: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>

We are having more and more ignore patterns.  Sort the list
alphabetically.  We will easily catch duplicated patterns if any.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/.gitignore b/.gitignore
index 4f034b8..1cc4b2e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,38 +7,38 @@
 # command after changing this file, to see if there are
 # any tracked files which get ignored after the change.
 #
-# Normal rules
+# Normal rules (sorted alphabetically)
 #
 .*
+*.a
+*.bin
+*.bz2
+*.c.[012]*.*
+*.dwo
+*.elf
+*.gcno
+*.gz
+*.i
+*.ko
+*.ll
+*.lst
+*.lz4
+*.lzma
+*.lzo
+*.mod.c
 *.o
 *.o.*
-*.a
+*.order
+*.patch
 *.s
-*.ko
 *.so
 *.so.dbg
-*.mod.c
-*.i
-*.lst
+*.su
 *.symtypes
-*.order
-*.elf
-*.bin
 *.tar
-*.gz
-*.bz2
-*.lzma
 *.xz
-*.lz4
-*.lzo
-*.patch
-*.gcno
-*.ll
-modules.builtin
 Module.symvers
-*.dwo
-*.su
-*.c.[012]*.*
+modules.builtin
 
 #
 # Top-level generic files
-- 
2.7.4

