Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta09.emeryville.ca.mail.comcast.net ([76.96.30.96]:58822 "EHLO
	qmta09.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757027Ab0EKSpt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 May 2010 14:45:49 -0400
From: matt mooney <mfm@muteddisk.com>
Subject: [PATCH 2/3 v2] kbuild/makefiles.txt: Fix examples 
Date: Tue, 11 May 2010 11:43:33 -0700
Message-Id: <1273603413-20647-1-git-send-email-mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de


Update section 3.2 and 3.5 example, along with text in section 3.5 to reflect change.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
v2: Changes are the same, added linux-kbuild@vger.kernel.org to list of recipients.

 Documentation/kbuild/makefiles.txt |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index b25507d..6004671 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -168,7 +168,7 @@ more details, with real examples.
 		#drivers/isdn/i4l/Makefile
 		# Makefile for the kernel ISDN subsystem and device drivers.
 		# Each configuration option enables a list of files.
-		obj-$(CONFIG_ISDN)             += isdn.o
+		obj-$(CONFIG_ISDN_I4L)         += isdn.o
 		obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o

 --- 3.3 Loadable module goals - obj-m
@@ -245,12 +245,12 @@ more details, with real examples.
 	may contain both a built-in.o and a lib.a file.

 	Example:
-		#arch/i386/lib/Makefile
-		lib-y    := checksum.o delay.o
+		#arch/x86/lib/Makefile
+		lib-y    := delay.o

-	This will create a library lib.a based on checksum.o and delay.o.
-	For kbuild to actually recognize that there is a lib.a being built,
-	the directory shall be listed in libs-y.
+	This will create a library lib.a based on delay.o. For kbuild to
+	actually recognize that there is a lib.a being built, the directory
+	shall be listed in libs-y.
 	See also "6.3 List directories to visit when descending".

 	Use of lib-y is normally restricted to lib/ and arch/*/lib.
--
1.6.6.1

