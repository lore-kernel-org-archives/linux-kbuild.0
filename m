Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from flawless.hostnac.com ([67.23.244.186]:45782 "EHLO
	flawless.hostnac.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751991Ab1GWLIj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 23 Jul 2011 07:08:39 -0400
From: =?utf-8?q?Rados=C5=82aw_Smogura?= <mail@smogura.eu>
Subject: [PATCH] Added hacking menu for override optimization by GCC
Date: Sat, 23 Jul 2011 12:49:46 +0200
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_KdqKOUMOiTmQxs2"
Message-Id: <201107231249.46418.mail@smogura.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

--Boundary-00=_KdqKOUMOiTmQxs2
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This patch gives ability for add some "-fno-..." options for GCC
and to force -O1 optimization. Supporting files, like Kconfig, Makefile
are auto-generated due to large amount of available options (not all=20
included).

Patch helps to debug kernel.

Signed-off-by: Rados=C5=82aw Smogura <mail@smogura.eu>

--Boundary-00=_KdqKOUMOiTmQxs2
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-Added-hacking-menu-for-override-optimization-by-GCC.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-Added-hacking-menu-for-override-optimization-by-GCC.patch"

=46rom 4d0cd0b8e84d064b4da85b16ef4cfb3a63608cf3 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Rados=3DC5=3D82aw=3D20Smogura?=3D <mail@smogura.eu, rsm=
ogura@softperience.eu>
Date: Sat, 23 Jul 2011 12:26:27 +0200
Subject: [PATCH] Added hacking menu for override optimization by GCC.
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

This patch gives ability for add some "-fno-..." options for GCC
and to force -O1 optimization. Supporting files, like Kconfig, Makefile
are auto-generated due to large amount of available options.

Patch helps to debug kernel.

Signed-off-by: Rados=C5=82aw Smogura <mail@smogura.eu>
=2D--
 Makefile                           |   11 ++++
 lib/Kconfig.debug                  |    2 +
 lib/Kconfig.debug.optim            |  102 ++++++++++++++++++++++++++++++++=
++++
 scripts/Makefile.optim.inc         |   23 ++++++++
 scripts/debug/make_config_optim.sh |   88 +++++++++++++++++++++++++++++++
 5 files changed, 226 insertions(+), 0 deletions(-)
 create mode 100644 lib/Kconfig.debug.optim
 create mode 100644 scripts/Makefile.optim.inc
 create mode 100644 scripts/debug/make_config_optim.sh

diff --git a/Makefile b/Makefile
index 86f47a0..61c39b0 100644
=2D-- a/Makefile
+++ b/Makefile
@@ -558,12 +558,23 @@ endif # $(dot-config)
 # Defaults to vmlinux, but the arch makefile usually adds further targets
 all: vmlinux
=20
+ifdef CONFIG_HACK_OPTIM_FORCE_O1_LEVEL
+KBUILD_CFLAGS +=3D -O1
+else
+
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS	+=3D -Os
 else
 KBUILD_CFLAGS	+=3D -O2
 endif
=20
+endif
+
+# Include makefile for optimization override
+ifdef CONFIG_HACK_OPTIM
+include $(srctree)/scripts/Makefile.optim.inc
+endif
+
 include $(srctree)/arch/$(SRCARCH)/Makefile
=20
 ifneq ($(CONFIG_FRAME_WARN),0)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index dd373c8..3013a6b 100644
=2D-- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1259,5 +1259,7 @@ source "lib/Kconfig.kgdb"
=20
 source "lib/Kconfig.kmemcheck"
=20
+source "lib/Kconfig.debug.optim"
+
 config TEST_KSTRTOX
 	tristate "Test kstrto*() family of functions at runtime"
diff --git a/lib/Kconfig.debug.optim b/lib/Kconfig.debug.optim
new file mode 100644
index 0000000..09b1012
=2D-- /dev/null
+++ b/lib/Kconfig.debug.optim
@@ -0,0 +1,102 @@
+# This file was auto generated. It's utility configuration
+# Distributed under GPL v2 License
+
+menuconfig HACK_OPTIM
+	bool "Allows to override GCC optimization"
+	depends on DEBUG_KERNEL && EXPERIMENTAL
+	help
+	  If you say Y here you will be able to override
+	  how GCC optimize kernel code. This will create
+	  more debug friendly, but with not guarentee
+	  about same runi, like production, kernel.
+
+	  If you say Y here probably You will want say
+	  for all suboptions
+
+if HACK_OPTIM
+
+config HACK_OPTIM_FORCE_O1_LEVEL
+	bool "Forces -O1 optimization level"
+	---help---
+	  This will change how GCC optimize code. Code
+	  may be slower and larger but will be more debug
+	  "friendly".
+
+	  In some cases there is low chance that kernel
+	  will run different then normal, reporting or not
+	  some bugs or errors. Refere to GCC manual for
+	  more details.
+
+	  You SHOULD say N here.
+
+config HACK_OPTIM__fno_inline_functions_called_once
+	bool "Adds -fno-inline-functions-called-once parameter to gcc invoke line=
=2E"
+	---help---
+	  This will change how GCC optimize code. Code
+	  may be slower and larger but will be more debug
+	  "friendly".
+
+	  In some cases there is low chance that kernel
+	  will run different then normal, reporting or not
+	  some bugs or errors. Refere to GCC manual for
+	  more details.
+
+	  You SHOULD say N here.
+
+config HACK_OPTIM__fno_combine_stack_adjustments
+	bool "Adds -fno-combine-stack-adjustments parameter to gcc invoke line."
+	---help---
+	  This will change how GCC optimize code. Code
+	  may be slower and larger but will be more debug
+	  "friendly".
+
+	  In some cases there is low chance that kernel
+	  will run different then normal, reporting or not
+	  some bugs or errors. Refere to GCC manual for
+	  more details.
+
+	  You SHOULD say N here.
+
+config HACK_OPTIM__fno_tree_dce
+	bool "Adds -fno-tree-dce parameter to gcc invoke line."
+	---help---
+	  This will change how GCC optimize code. Code
+	  may be slower and larger but will be more debug
+	  "friendly".
+
+	  In some cases there is low chance that kernel
+	  will run different then normal, reporting or not
+	  some bugs or errors. Refere to GCC manual for
+	  more details.
+
+	  You SHOULD say N here.
+
+config HACK_OPTIM__fno_tree_dominator_opts
+	bool "Adds -fno-tree-dominator-opts parameter to gcc invoke line."
+	---help---
+	  This will change how GCC optimize code. Code
+	  may be slower and larger but will be more debug
+	  "friendly".
+
+	  In some cases there is low chance that kernel
+	  will run different then normal, reporting or not
+	  some bugs or errors. Refere to GCC manual for
+	  more details.
+
+	  You SHOULD say N here.
+
+config HACK_OPTIM__fno_dse
+	bool "Adds -fno-dse parameter to gcc invoke line."
+	---help---
+	  This will change how GCC optimize code. Code
+	  may be slower and larger but will be more debug
+	  "friendly".
+
+	  In some cases there is low chance that kernel
+	  will run different then normal, reporting or not
+	  some bugs or errors. Refere to GCC manual for
+	  more details.
+
+	  You SHOULD say N here.
+
+endif #HACK_OPTIM
diff --git a/scripts/Makefile.optim.inc b/scripts/Makefile.optim.inc
new file mode 100644
index 0000000..e78cc92
=2D-- /dev/null
+++ b/scripts/Makefile.optim.inc
@@ -0,0 +1,23 @@
+# This file was auto generated. It's utility configuration
+# Distributed under GPL v2 License
+
+ifdef CONFIG_HACK_OPTIM__fno_inline_functions_called_once
+	KBUILD_CFLAGS +=3D -fno-inline-functions-called-once
+endif
+
+ifdef CONFIG_HACK_OPTIM__fno_combine_stack_adjustments
+	KBUILD_CFLAGS +=3D -fno-combine-stack-adjustments
+endif
+
+ifdef CONFIG_HACK_OPTIM__fno_tree_dce
+	KBUILD_CFLAGS +=3D -fno-tree-dce
+endif
+
+ifdef CONFIG_HACK_OPTIM__fno_tree_dominator_opts
+	KBUILD_CFLAGS +=3D -fno-tree-dominator-opts
+endif
+
+ifdef CONFIG_HACK_OPTIM__fno_dse
+	KBUILD_CFLAGS +=3D -fno-dse
+endif
+
diff --git a/scripts/debug/make_config_optim.sh b/scripts/debug/make_config=
_optim.sh
new file mode 100644
index 0000000..26865923
=2D-- /dev/null
+++ b/scripts/debug/make_config_optim.sh
@@ -0,0 +1,88 @@
+#!/bin/sh
+
+## Utility script for generating optimization override options
+## for kernel compilation.
+##
+## Distributed under GPL v2 license
+## (c) Rados=C5=82aw Smogura, 2011
+
+# Prefix added for variable
+CFG_PREFIX=3D"HACK_OPTIM"
+
+KCFG=3D"Kconfig.debug.optim"
+MKFI=3D"Makefile.optim.inc"
+
+OPTIMIZATIONS_PARAMS=3D"-fno-inline-functions-called-once \
+ -fno-combine-stack-adjustments \
+ -fno-tree-dce \
+ -fno-tree-dominator-opts \
+ -fno-dse "
+
+echo "# This file was auto generated. It's utility configuration" > $KCFG
+echo "# Distributed under GPL v2 License" >> $KCFG
+echo >> $KCFG
+echo "menuconfig ${CFG_PREFIX}" >> $KCFG
+echo -e "\tbool \"Allows to override GCC optimization\"" >> $KCFG
+echo -e "\tdepends on DEBUG_KERNEL && EXPERIMENTAL" >> $KCFG
+echo -e "\thelp" >> $KCFG
+echo -e "\t  If you say Y here you will be able to override" >> $KCFG
+echo -e "\t  how GCC optimize kernel code. This will create" >> $KCFG
+echo -e "\t  more debug friendly, but with not guarentee"    >> $KCFG
+echo -e "\t  about same runi, like production, kernel."      >> $KCFG
+echo >> $KCFG
+echo -e "\t  If you say Y here probably You will want say"   >> $KCFG
+echo -e "\t  for all suboptions" >> $KCFG
+echo >> $KCFG
+echo "if ${CFG_PREFIX}" >> $KCFG
+echo >> $KCFG
+
+echo "# This file was auto generated. It's utility configuration" > $MKFI
+echo "# Distributed under GPL v2 License" >> $MKFI
+echo >> $MKFI
+
+# Insert standard override optimization level
+# This is exception, and this value will not be included
+# in auto generated makefile. Support for this value
+# is hard coded in main Makefile.
+echo -e "config ${CFG_PREFIX}_FORCE_O1_LEVEL" >> $KCFG
+echo -e "\tbool \"Forces -O1 optimization level\"" >> $KCFG
+echo -e "\t---help---" >> $KCFG
+echo -e "\t  This will change how GCC optimize code. Code" >> $KCFG
+echo -e "\t  may be slower and larger but will be more debug" >> $KCFG
+echo -e "\t  \"friendly\"." >> $KCFG
+echo >> $KCFG
+echo -e "\t  In some cases there is low chance that kernel" >> $KCFG
+echo -e "\t  will run different then normal, reporting or not" >> $KCFG
+echo -e "\t  some bugs or errors. Refere to GCC manual for" >> $KCFG
+echo -e "\t  more details." >> $KCFG
+echo >> $KCFG
+echo -e "\t  You SHOULD say N here." >> $KCFG
+echo >> $KCFG
+
+for o in $OPTIMIZATIONS_PARAMS ; do
+	cfg_o=3D"${CFG_PREFIX}_${o//-/_}";
+	echo "Processing param ${o} config variable will be $cfg_o";
+
+	# Generate kconfig entry
+	echo -e "config ${cfg_o}" >> $KCFG
+	echo -e "\tbool \"Adds $o parameter to gcc invoke line.\"" >> $KCFG
+	echo -e "\t---help---" >> $KCFG
+	echo -e "\t  This will change how GCC optimize code. Code" >> $KCFG
+	echo -e "\t  may be slower and larger but will be more debug" >> $KCFG
+	echo -e "\t  \"friendly\"." >> $KCFG
+	echo >> $KCFG
+	echo -e "\t  In some cases there is low chance that kernel" >> $KCFG
+	echo -e "\t  will run different then normal, reporting or not" >> $KCFG
+	echo -e "\t  some bugs or errors. Refere to GCC manual for" >> $KCFG
+	echo -e "\t  more details." >> $KCFG
+	echo >> $KCFG
+	echo -e "\t  You SHOULD say N here." >> $KCFG
+	echo >> $KCFG
+
+	#Generate Make for include
+	echo "ifdef CONFIG_${cfg_o}" >> $MKFI
+	echo -e "\tKBUILD_CFLAGS +=3D $o" >> $MKFI
+	echo "endif" >> $MKFI
+	echo  >> $MKFI
+done;
+echo "endif #${CFG_PREFIX}" >> $KCFG
=2D-=20
1.7.3.4


--Boundary-00=_KdqKOUMOiTmQxs2--
