Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:45330 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933382AbeFVTc1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 15:32:27 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 3/3] kconfig: add debugconfig target for debugging purposes
Date: Fri, 22 Jun 2018 21:27:39 +0200
Message-Id: <20180622192739.5327-4-dirk@gouders.net>
In-Reply-To: <20180622192739.5327-1-dirk@gouders.net>
References: <20180622192739.5327-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Dirk Gouders <dirk@gouders.net>, Sam Ravnborg <sam@ravnborg.org>

Currently, we need to modify existing kconfig targets to generate debugging
information from the parser.  That information then has to be filtered
somehow, automated tests are at least complicated to implement.

Add a debugconfig target for pure debugging purposes; the initial
version of this target dumps the menu tree and with the --debug option
activates the parsers debugging output via it's global variable
cdebug.  The environment variable ZCONF_DEBUG can be used to generate
even more detailed debugging information.

Sample output for a simple Kconfig file:

$ scripts/kconfig/dconf --debug Kconfig.dconfig
Kconfig.dconfig:1:config a
Kconfig.dconfig:2:type(1)
Kconfig.dconfig:4:endconfig
Kconfig.dconfig:5:if
Kconfig.dconfig:5:config b
Kconfig.dconfig:6:type(1)
Kconfig.dconfig:7:endconfig
Kconfig.dconfig:7:endif

config a
  bool
  symbol a
  prompt "a"

config b
  bool
  symbol b
  prompt "b" if a

endmenu

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/Makefile | 10 ++++++++-
 scripts/kconfig/dconf.c  | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/dconf.c

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index a3ac2c91331c..19906ff25392 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -4,7 +4,7 @@
 # These targets are used from top-level makefile
 
 PHONY += xconfig gconfig menuconfig config syncconfig \
-	localmodconfig localyesconfig
+	localmodconfig localyesconfig debugconfig
 
 ifdef KBUILD_KCONFIG
 Kconfig := $(KBUILD_KCONFIG)
@@ -34,6 +34,9 @@ config: $(obj)/conf
 nconfig: $(obj)/nconf
 	$< $(silent) $(Kconfig)
 
+debugconfig: $(obj)/dconf
+	$< $(silent) $(Kconfig)
+
 # This has become an internal implementation detail and is now deprecated
 # for external use.
 syncconfig: $(obj)/conf
@@ -149,6 +152,7 @@ help:
 	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  '  debugconfig	  - Debugging tool for developers'
 
 # ===========================================================================
 # Shared Makefile for the various kconfig executables:
@@ -165,6 +169,10 @@ targets		+= zconf.lex.c
 HOSTCFLAGS_zconf.lex.o	:= -I$(src)
 HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 
+# dconf: Used for kconfig debugging
+hostprogs-y	+= dconf
+dconf-objs	:= dconf.o zconf.tab.o
+
 # nconf: Used for the nconfig target based on ncurses
 hostprogs-y	+= nconf
 nconf-objs	:= nconf.o zconf.tab.o nconf.gui.o
diff --git a/scripts/kconfig/dconf.c b/scripts/kconfig/dconf.c
new file mode 100644
index 000000000000..ed1edf607d80
--- /dev/null
+++ b/scripts/kconfig/dconf.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2018 Dirk Gouders <dirk@gouders.net>
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <getopt.h>
+
+#include "lkc.h"
+
+extern int cdebug;
+
+void usage(const char *progname);
+void usage(const char *progname)
+{
+	printf("Usage: %s --help | [--debug] <kconfig-file>\n", progname);
+}
+
+int main(int argc, char *argv[])
+{
+	int c;
+	int opt_index = 0;
+	char *filename;
+
+	struct option long_opts[] = {
+		{"debug", no_argument, NULL, 0},
+		{"help", no_argument, NULL, 1},
+		{0, 0, 0, 0}
+	};
+
+	while (1 ) {
+		c = getopt_long(argc, argv, "", long_opts, &opt_index);
+
+		if (c == -1)
+			break;
+		if (c == 0) {
+			cdebug = 0x02;
+		}
+		if (c == 1) {
+			usage(argv[0]);
+			exit(EXIT_SUCCESS);
+		}
+	}
+
+	if (optind == argc) {
+		usage(argv[0]);
+		exit(EXIT_FAILURE);
+	} else
+		filename = argv[optind];
+
+	conf_parse(filename);
+	zconfdump(stdout);
+
+	exit(EXIT_SUCCESS);
+}
-- 
2.13.6

