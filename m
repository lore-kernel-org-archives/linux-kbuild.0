Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37437 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758838AbYAXWDu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:50 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 13/77] kconfig: if ncurses-devel is missing then say so
Date: Thu, 24 Jan 2008 23:02:54 +0100
Message-Id: <1201212238-4369-13-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

With this patch when ncurses-devel (or whatever it is named)
is missing trying to run menuconfig will result in this:

$ make menuconfig
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/kxgettext.o
 *** Unable to find the ncurses libraries or the
 *** required header files.
 *** 'make menuconfig' requires the ncurses libraries.
 ***
 *** Install ncurses (ncurses-devel) and try again.
 ***
make[1]: *** [scripts/kconfig/dochecklxdialog] Error 1
make: *** [menuconfig] Error 2

Much better than before where we just listed some build errors.
The other *config targets will work indepenednt on ncurses
being present or not.

Includes improvements suggested by: Frans Pop <elendil@planet.nl>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Frans Pop <elendil@planet.nl>
---
 scripts/kconfig/Makefile                   |   14 ++++++++------
 scripts/kconfig/lxdialog/check-lxdialog.sh |   16 +++++++++-------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 1ad6f7f..8091435 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -93,12 +93,6 @@ HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
 HOST_EXTRACFLAGS += -DLOCALE
 
-PHONY += $(obj)/dochecklxdialog
-$(obj)/dochecklxdialog:
-	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_LOADLIBES)
-
-always := dochecklxdialog
-
 
 # ===========================================================================
 # Shared Makefile for the various kconfig executables:
@@ -145,6 +139,14 @@ clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
 		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c
 clean-files     += mconf qconf gconf
 
+# Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
+PHONY += $(obj)/dochecklxdialog
+$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
+$(obj)/dochecklxdialog:
+	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOST_LOADLIBES)
+
+always := dochecklxdialog
+
 # Add environment specific flags
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
 
diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index 9681476..62e1e02 100644
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -36,14 +36,16 @@ trap "rm -f $tmp" 0 1 2 3 15
 
 # Check if we can link to ncurses
 check() {
-	echo "main() {}" | $cc -xc - -o $tmp 2> /dev/null
+	echo -e " #include CURSES_LOC \n main() {}" |
+	    $cc -xc - -o $tmp 2> /dev/null
 	if [ $? != 0 ]; then
-		echo " *** Unable to find the ncurses libraries."          1>&2
-		echo " *** make menuconfig require the ncurses libraries"  1>&2
-		echo " *** "                                               1>&2
-		echo " *** Install ncurses (ncurses-devel) and try again"  1>&2
-		echo " *** "                                               1>&2
-		exit 1
+	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+	    echo " *** required header files."                            1>&2
+	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
+	    echo " *** "                                                  1>&2
+	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
+	    echo " *** "                                                  1>&2
+	    exit 1
 	fi
 }
 
-- 
1.5.4.rc3.14.g44397

