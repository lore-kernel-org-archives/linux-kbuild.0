Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta11.emeryville.ca.mail.comcast.net ([76.96.27.211]:56933
	"EHLO qmta11.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751122Ab0JBEXs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Oct 2010 00:23:48 -0400
From: matt mooney <mfm@muteddisk.com>
Subject: [PATCH] Documentation/kbuild: modules.txt cleanup
Date: Fri,  1 Oct 2010 21:21:55 -0700
Message-Id: <1285993315-19500-1-git-send-email-mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

A few modifications done for consistency, such as adding the shell
prompt for command line examples and trailing slash for directories.
Also corrects the module include header and fixes a few grammar
issues that I introduced.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---

Hi Michal,

Before I forget, here is a small cleanup patch I have been waiting to send.

Thanks,
mfm

 Documentation/kbuild/modules.txt |   62 +++++++++++++++++++------------------
 1 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/modules.txt
index b572db3..3fb39e0 100644
--- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.txt
@@ -1,11 +1,11 @@
 Building External Modules
 
-This document describes how-to build an out-of-tree kernel module.
+This document describes how to build an out-of-tree kernel module.
 
 === Table of Contents
 
 	=== 1 Introduction
-	=== 2 How-to Build External Modules
+	=== 2 How to Build External Modules
 	   --- 2.1 Command Syntax
 	   --- 2.2 Options
 	   --- 2.3 Targets
@@ -48,9 +48,9 @@ easily accomplished, and a complete example will be presented in
 section 3.
 
 
-=== 2. How-to Build External Modules
+=== 2. How to Build External Modules
 
-To build external modules, you must have a pre-built kernel available
+To build external modules, you must have a prebuilt kernel available
 that contains the configuration and header files used in the build.
 Also, the kernel must have been built with modules enabled. If you are
 using a distribution kernel, there will be a package for the kernel you
@@ -69,19 +69,19 @@ executed to make module versioning work.
 
 	The command to build an external module is:
 
-		make -C <path_to_kernel_src> M=$PWD
+		$ make -C <path_to_kernel_src> M=$PWD
 
 	The kbuild system knows that an external module is being built
 	due to the "M=<dir>" option given in the command.
 
 	To build against the running kernel use:
 
-		make -C /lib/modules/`uname -r`/build M=$PWD
+		$ make -C /lib/modules/`uname -r`/build M=$PWD
 
 	Then to install the module(s) just built, add the target
 	"modules_install" to the command:
 
-		make -C /lib/modules/`uname -r`/build M=$PWD modules_install
+		$ make -C /lib/modules/`uname -r`/build M=$PWD modules_install
 
 --- 2.2 Options
 
@@ -121,7 +121,7 @@ executed to make module versioning work.
 
 	modules_install
 		Install the external module(s). The default location is
-		/lib/modules/<kernel_release>/extra, but a prefix may
+		/lib/modules/<kernel_release>/extra/, but a prefix may
 		be added with INSTALL_MOD_PATH (discussed in section 5).
 
 	clean
@@ -164,7 +164,7 @@ needed listing the files:
 NOTE: Further documentation describing the syntax used by kbuild is
 located in Documentation/kbuild/makefiles.txt.
 
-The examples below demonstrate how-to create a build file for the
+The examples below demonstrate how to create a build file for the
 module 8123.ko, which is built from the following files:
 
 	8123_if.c
@@ -205,14 +205,14 @@ module 8123.ko, which is built from the following files:
 	of the makefile. In the example, kbuild will only see the two
 	assignments, whereas "make" will see everything except these
 	two assignments. This is due to two passes made on the file:
-	the first pass is by the "make" instance run on the
-	command line; the second pass is by the kbuild system, which is
+	the first pass is by the "make" instance run on the command
+	line; the second pass is by the kbuild system, which is
 	initiated by the parameterized "make" in the default target.
 
 --- 3.2 Separate Kbuild File and Makefile
 
 	In newer versions of the kernel, kbuild will first look for a
-	file named "Kbuild", and only if that is not found, will it
+	file named "Kbuild," and only if that is not found, will it
 	then look for a makefile. Utilizing a "Kbuild" file allows us
 	to split up the makefile from example 1 into two files:
 
@@ -288,8 +288,8 @@ module 8123.ko, which is built from the following files:
 --- 3.4 Building Multiple Modules
 
 	kbuild supports building multiple modules with a single build
-	file. For example, if you want to build two modules, foo and
-	bar, the kbuild lines would be:
+	file. For example, if you wanted to build two modules, foo.ko
+	and bar.ko, the kbuild lines would be:
 
 		obj-m := foo.o bar.o
 		foo-y := <foo_srcs>
@@ -320,7 +320,7 @@ according to the following rule:
 	To include a header file located under include/linux/, simply
 	use:
 
-		#include <linux/modules.h>
+		#include <linux/module.h>
 
 	kbuild will add options to "gcc" so the relevant directories
 	are searched.
@@ -330,7 +330,7 @@ according to the following rule:
 	External modules tend to place header files in a separate
 	include/ directory where their source is located, although this
 	is not the usual kernel style. To inform kbuild of the
-	directory use either ccflags-y or CFLAGS_<filename>.o.
+	directory, use either ccflags-y or CFLAGS_<filename>.o.
 
 	Using the example from section 3, if we moved 8123_if.h to a
 	subdirectory named include, the resulting kbuild file would
@@ -390,11 +390,11 @@ according to the following rule:
 Modules which are included in the kernel are installed in the
 directory:
 
-	/lib/modules/$(KERNELRELEASE)/kernel
+	/lib/modules/$(KERNELRELEASE)/kernel/
 
 And external modules are installed in:
 
-	/lib/modules/$(KERNELRELEASE)/extra
+	/lib/modules/$(KERNELRELEASE)/extra/
 
 --- 5.1 INSTALL_MOD_PATH
 
@@ -403,7 +403,7 @@ And external modules are installed in:
 	installation path using the variable INSTALL_MOD_PATH:
 
 		$ make INSTALL_MOD_PATH=/frodo modules_install
-		=> Install dir: /frodo/lib/modules/$(KERNELRELEASE)/kernel
+		=> Install dir: /frodo/lib/modules/$(KERNELRELEASE)/kernel/
 
 	INSTALL_MOD_PATH may be set as an ordinary shell variable or,
 	as shown above, can be specified on the command line when
@@ -413,14 +413,14 @@ And external modules are installed in:
 --- 5.2 INSTALL_MOD_DIR
 
 	External modules are by default installed to a directory under
-	/lib/modules/$(KERNELRELEASE)/extra, but you may wish to locate
-	modules for a specific functionality in a separate directory.
-	For this purpose, use INSTALL_MOD_DIR to specify an alternative
-	name to "extra."
+	/lib/modules/$(KERNELRELEASE)/extra/, but you may wish to
+	locate modules for a specific functionality in a separate
+	directory. For this purpose, use INSTALL_MOD_DIR to specify an
+	alternative name to "extra."
 
 		$ make INSTALL_MOD_DIR=gandalf -C $KDIR \
 		       M=$PWD modules_install
-		=> Install dir: /lib/modules/$(KERNELRELEASE)/gandalf
+		=> Install dir: /lib/modules/$(KERNELRELEASE)/gandalf/
 
 
 === 6. Module Versioning
@@ -478,9 +478,9 @@ build.
 
 	Use a top-level kbuild file
 		If you have two modules, foo.ko and bar.ko, where
-		foo.ko needs symbols from bar.ko, then you can use a
+		foo.ko needs symbols from bar.ko, you can use a
 		common top-level kbuild file so both modules are
-		compiled in the same build. Consider following
+		compiled in the same build. Consider the following
 		directory layout:
 
 		./foo/ <= contains foo.ko
@@ -491,10 +491,11 @@ build.
 		#./Kbuild (or ./Makefile):
 			obj-y := foo/ bar/
 
-		And executing:
+		And executing
+
 			$ make -C $KDIR M=$PWD
 
-		Will then do the expected and compile both modules with
+		will then do the expected and compile both modules with
 		full knowledge of symbols from either module.
 
 	Use an extra Module.symvers file
@@ -512,10 +513,11 @@ build.
 	Use "make" variable KBUILD_EXTRA_SYMBOLS
 		If it is impractical to copy Module.symvers from
 		another module, you can assign a space separated list
-		of files to KBUILD_EXTRA_SYMBOLS in your build
-		file. These files will be loaded by modpost during the
+		of files to KBUILD_EXTRA_SYMBOLS in your build file.
+		These files will be loaded by modpost during the
 		initialization of its symbol tables.
 
+
 === 7. Tips & Tricks
 
 --- 7.1 Testing for CONFIG_FOO_BAR
-- 
1.7.2.3

