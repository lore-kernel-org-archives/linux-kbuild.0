Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from antcom.de ([188.40.178.216]:41598 "EHLO chuck.antcom.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753953Ab0LQQ3J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Dec 2010 11:29:09 -0500
Message-ID: <4D0B8D85.5090605@antcom.de>
Date: Fri, 17 Dec 2010 17:19:17 +0100
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
Subject: Kernel build ignores missing mkimage on building uImage
Content-Type: multipart/mixed;
 boundary="------------060308010208090203000002"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------060308010208090203000002
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

on building an uImage, I get:

$ make uImage
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: `include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  Kernel: arch/arm/boot/Image is ready
  SHIPPED arch/arm/boot/compressed/lib1funcs.S
  AS      arch/arm/boot/compressed/lib1funcs.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
"mkimage" command not found - U-Boot images will not be built
  Image arch/arm/boot/uImage is ready
$

I.e. it says: "uImage is ready" even though the uImage file doesn't
exist because mkimage is missing.

(I'm working with Linux' current mainline GIT and also see that the
problem is also present in the mmarek repo on git.kernel.org.)

I propose the attached patch.

Thanks for considering.

bye,
  Roland

--------------060308010208090203000002
Content-Type: text/x-patch;
 name="mkuboot.sh.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mkuboot.sh.patch"

diff --git a/scripts/mkuboot.sh b/scripts/mkuboot.sh
index 2e3d3cd..446739c 100755
--- a/scripts/mkuboot.sh
+++ b/scripts/mkuboot.sh
@@ -11,7 +11,7 @@ if [ -z "${MKIMAGE}" ]; then
 	if [ -z "${MKIMAGE}" ]; then
 		# Doesn't exist
 		echo '"mkimage" command not found - U-Boot images will not be built' >&2
-		exit 0;
+		exit 1;
 	fi
 fi
 

--------------060308010208090203000002--
