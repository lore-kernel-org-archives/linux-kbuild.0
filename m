Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta03.emeryville.ca.mail.comcast.net ([76.96.30.32]:56617 "EHLO
	qmta03.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756368Ab0EKSpX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 May 2010 14:45:23 -0400
From: matt mooney <mfm@muteddisk.com>
Subject: [PATCH 1/3 v2] kbuild/makefiles.txt: Fix examples and content 
Date: Tue, 11 May 2010 11:43:05 -0700
Message-Id: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de


Update section 3.3 Loadable module goals - obj-m, from $(<module_name>-objs) to $(<module_name>-y) for easier addition of conditional objects to the module. The examples are also updated to reflect the current state of each Makefile used.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
v2: Changes are the same, added linux-kbuild@vger.kernel.org to list of recipients.

 Documentation/kbuild/makefiles.txt |   37 ++++++++++++++++++-----------------
 1 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 71c602d..b25507d 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -187,34 +187,35 @@ more details, with real examples.
 	Note: In this example $(CONFIG_ISDN_PPP_BSDCOMP) evaluates to 'm'

 	If a kernel module is built from several source files, you specify
-	that you want to build a module in the same way as above.
-
-	Kbuild needs to know which the parts that you want to build your
-	module from, so you have to tell it by setting an
-	$(<module_name>-objs) variable.
+	that you want to build a module in the same way as above; however,
+	kbuild needs to know which object files you want to build your
+	module from, so you have to tell it by setting a $(<module_name>-y)
+	variable.

 	Example:
 		#drivers/isdn/i4l/Makefile
-		obj-$(CONFIG_ISDN) += isdn.o
-		isdn-objs := isdn_net_lib.o isdn_v110.o isdn_common.o
+		obj-$(CONFIG_ISDN_I4L) += isdn.o
+		isdn-y := isdn_net_lib.o isdn_v110.o isdn_common.o

 	In this example, the module name will be isdn.o. Kbuild will
-	compile the objects listed in $(isdn-objs) and then run
+	compile the objects listed in $(isdn-y) and then run
 	"$(LD) -r" on the list of these files to generate isdn.o.

-	Kbuild recognises objects used for composite objects by the suffix
-	-objs, and the suffix -y. This allows the Makefiles to use
-	the value of a CONFIG_ symbol to determine if an object is part
-	of a composite object.
+	Due to kbuild recognizing $(<module_name>-y) for composite objects,
+	you can use the value of a CONFIG_ symbol to optionally include an
+	object file as part of a composite object.

 	Example:
 		#fs/ext2/Makefile
-	        obj-$(CONFIG_EXT2_FS)        += ext2.o
-		ext2-y                       := balloc.o bitmap.o
-	        ext2-$(CONFIG_EXT2_FS_XATTR) += xattr.o
-
-	In this example, xattr.o is only part of the composite object
-	ext2.o if $(CONFIG_EXT2_FS_XATTR) evaluates to 'y'.
+	        obj-$(CONFIG_EXT2_FS) += ext2.o
+		ext2-y := balloc.o dir.o file.o ialloc.o inode.o ioctl.o \
+			  namei.o super.o symlink.o
+	        ext2-$(CONFIG_EXT2_FS_XATTR) += xattr.o xattr_user.o \
+						xattr_trusted.o
+
+	In this example, xattr.o, xattr_user.o and xattr_trusted.o are only
+	part of the composite object ext2.o if $(CONFIG_EXT2_FS_XATTR)
+	evaluates to 'y'.

 	Note: Of course, when you are building objects into the kernel,
 	the syntax above will also work. So, if you have CONFIG_EXT2_FS=y,
--
1.6.6.1

