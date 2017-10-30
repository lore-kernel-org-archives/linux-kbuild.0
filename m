Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:40629 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751900AbdJ3Pfv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 11:35:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] .gitignore: move *.dtb and *.dtb.S patterns to the top-level .gitignore
Date: Tue, 31 Oct 2017 00:33:46 +0900
Message-Id: <1509377627-11362-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
References: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Michael Ellerman <mpe@ellerman.id.au>, Tobias Klauser <tklauser@distanz.ch>, Ley Foon Tan <ley.foon.tan@intel.com>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>

Most of DT files are compiled under arch/*/boot/dts/, but we have some
other directories, like drivers/of/unittest-data/.  We often miss to
add gitignore patterns per directory.  Since there are no source files
that end with .dtb or .dtb.S, we can ignore the patterns globally.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore                          | 2 ++
 arch/arc/boot/.gitignore            | 1 -
 arch/arm/boot/.gitignore            | 1 -
 arch/arm64/boot/dts/.gitignore      | 1 -
 arch/metag/boot/.gitignore          | 1 -
 arch/microblaze/boot/.gitignore     | 1 -
 arch/mips/boot/.gitignore           | 1 -
 arch/nios2/boot/.gitignore          | 1 -
 arch/powerpc/boot/.gitignore        | 1 -
 arch/xtensa/boot/.gitignore         | 1 -
 drivers/of/unittest-data/.gitignore | 2 --
 11 files changed, 2 insertions(+), 11 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/.gitignore
 delete mode 100644 drivers/of/unittest-data/.gitignore

diff --git a/.gitignore b/.gitignore
index 1cc4b2e..f6050b8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -14,6 +14,8 @@
 *.bin
 *.bz2
 *.c.[012]*.*
+*.dtb
+*.dtb.S
 *.dwo
 *.elf
 *.gcno
diff --git a/arch/arc/boot/.gitignore b/arch/arc/boot/.gitignore
index 5246969..c4c5fd5 100644
--- a/arch/arc/boot/.gitignore
+++ b/arch/arc/boot/.gitignore
@@ -1,2 +1 @@
-*.dtb*
 uImage
diff --git a/arch/arm/boot/.gitignore b/arch/arm/boot/.gitignore
index 3c79f85..ce1c5ff 100644
--- a/arch/arm/boot/.gitignore
+++ b/arch/arm/boot/.gitignore
@@ -3,4 +3,3 @@ zImage
 xipImage
 bootpImage
 uImage
-*.dtb
diff --git a/arch/arm64/boot/dts/.gitignore b/arch/arm64/boot/dts/.gitignore
deleted file mode 100644
index b60ed20..0000000
--- a/arch/arm64/boot/dts/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-*.dtb
diff --git a/arch/metag/boot/.gitignore b/arch/metag/boot/.gitignore
index 2d6c0c1..6c662dd 100644
--- a/arch/metag/boot/.gitignore
+++ b/arch/metag/boot/.gitignore
@@ -1,4 +1,3 @@
 vmlinux*
 uImage*
 ramdisk.*
-*.dtb*
diff --git a/arch/microblaze/boot/.gitignore b/arch/microblaze/boot/.gitignore
index bf04591..679502d 100644
--- a/arch/microblaze/boot/.gitignore
+++ b/arch/microblaze/boot/.gitignore
@@ -1,3 +1,2 @@
-*.dtb
 linux.bin*
 simpleImage.*
diff --git a/arch/mips/boot/.gitignore b/arch/mips/boot/.gitignore
index d3962cd..a73d6e2 100644
--- a/arch/mips/boot/.gitignore
+++ b/arch/mips/boot/.gitignore
@@ -5,4 +5,3 @@ zImage
 zImage.tmp
 calc_vmlinuz_load_addr
 uImage
-*.dtb
diff --git a/arch/nios2/boot/.gitignore b/arch/nios2/boot/.gitignore
index 109279c..64386a8 100644
--- a/arch/nios2/boot/.gitignore
+++ b/arch/nios2/boot/.gitignore
@@ -1,2 +1 @@
-*.dtb
 vmImage
diff --git a/arch/powerpc/boot/.gitignore b/arch/powerpc/boot/.gitignore
index 84774cc..f92d053 100644
--- a/arch/powerpc/boot/.gitignore
+++ b/arch/powerpc/boot/.gitignore
@@ -18,7 +18,6 @@ otheros.bld
 uImage
 cuImage.*
 dtbImage.*
-*.dtb
 treeImage.*
 vmlinux.strip
 zImage
diff --git a/arch/xtensa/boot/.gitignore b/arch/xtensa/boot/.gitignore
index be76559..38177c7 100644
--- a/arch/xtensa/boot/.gitignore
+++ b/arch/xtensa/boot/.gitignore
@@ -1,3 +1,2 @@
 uImage
 zImage.redboot
-*.dtb
diff --git a/drivers/of/unittest-data/.gitignore b/drivers/of/unittest-data/.gitignore
deleted file mode 100644
index 4b3cf8b..0000000
--- a/drivers/of/unittest-data/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-testcases.dtb
-testcases.dtb.S
-- 
2.7.4

