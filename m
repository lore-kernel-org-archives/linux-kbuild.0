Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:57902 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753358AbYBPOAE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2008 09:00:04 -0500
Date: Sat, 16 Feb 2008 08:59:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] kbuild:  A few more cheap and easy typoes.
Message-ID: <alpine.LFD.1.00.0802160858470.22908@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

 Documentation/kbuild/makefiles.txt |    5 +++--
 scripts/Makefile                   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 7a77533..6147174 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -53,7 +53,7 @@ The Makefiles have five parts:
 	.config			the kernel configuration file.
 	arch/$(ARCH)/Makefile	the arch Makefile.
 	scripts/Makefile.*	common rules etc. for all kbuild Makefiles.
-	kbuild Makefiles	there are about 500 of these.
+	kbuild Makefiles	there are about 1000 of these.

 The top Makefile reads the .config file, which comes from the kernel
 configuration process.
@@ -404,6 +404,7 @@ more details, with real examples.
 	-Wa$(comma)-isa=$(isa-y) if it is supported by $(CC).
 	The second argument is optional, and if supplied will be used
 	if first argument is not supported.
+	Note: as-option uses KBUILD_CFLAGS for $(CC) options.

     ld-option
 	ld-option is used to check if $(CC) when used to link object files
@@ -423,7 +424,7 @@ more details, with real examples.
 	as-instr checks if the assembler reports a specific instruction
 	and then outputs either option1 or option2
 	C escapes are supported in the test instruction
-	Note: as-instr-option uses KBUILD_AFLAGS for $(AS) options
+	Note: as-instr uses KBUILD_AFLAGS for $(AS) options

     cc-option
 	cc-option is used to check if $(CC) supports a given option, and not
diff --git a/scripts/Makefile b/scripts/Makefile
index 1c73c5a..9177794 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -15,7 +15,7 @@ hostprogs-$(CONFIG_IKCONFIG)     += bin2c

 always		:= $(hostprogs-y) $(hostprogs-m)

-# The following hostprogs-y programs are only build on demand
+# The following hostprogs-y programs are built only on demand
 hostprogs-y += unifdef

 subdir-$(CONFIG_MODVERSIONS) += genksyms

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
