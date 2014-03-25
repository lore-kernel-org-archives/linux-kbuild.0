Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:34195 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753739AbaCYPUH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Mar 2014 11:20:07 -0400
Received: by mail-ee0-f49.google.com with SMTP id c41so568579eek.22
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Mar 2014 08:20:06 -0700 (PDT)
From: David Graeff <david.graeff@web.de>
Subject: [RFC PATCH 1/2] kconfig: Move flavours into their own subdirectories.
Date: Tue, 25 Mar 2014 16:20:00 +0100
Message-Id: <1395760801-27009-2-git-send-email-david.graeff@web.de>
In-Reply-To: <1395760801-27009-1-git-send-email-david.graeff@web.de>
References: <1395760801-27009-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-qt>
References: <kconfig-port-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: David Graeff <david.graeff@web.de>, yann.morin.1998@free.fr

* Split out non-generic Makefile targets into new Makefiles.
* Each flavour has its own specific Makefile now.
* Rename lxdialog to menuconfig.
* Update POTFILES.in

Signed-off-by: David Graeff <david.graeff@web.de>

 create mode 100644 scripts/kconfig/gconfig/Makefile
 rename scripts/kconfig/{ => gconfig}/gconf.c (99%)
 rename scripts/kconfig/{ => gconfig}/gconf.glade (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/.gitignore (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/BIG.FAT.WARNING (100%)
 create mode 100644 scripts/kconfig/menuconfig/Makefile
 rename scripts/kconfig/{lxdialog => menuconfig}/check-lxdialog.sh (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/checklist.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/dialog.h (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/inputbox.c (100%)
 rename scripts/kconfig/{ => menuconfig}/mconf.c (99%)
 rename scripts/kconfig/{lxdialog => menuconfig}/menubox.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/textbox.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/util.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/yesno.c (100%)
 create mode 100644 scripts/kconfig/nconfig/Makefile
 rename scripts/kconfig/{ => nconfig}/nconf.c (99%)
 rename scripts/kconfig/{ => nconfig}/nconf.gui.c (100%)
 rename scripts/kconfig/{ => nconfig}/nconf.h (100%)
 create mode 100644 scripts/kconfig/qconfig/Makefile
 rename scripts/kconfig/{ => qconfig}/qconf.cc (99%)
 rename scripts/kconfig/{ => qconfig}/qconf.h (100%)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 844bc9d..77aa0ef 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -1,8 +1,10 @@
 # ===========================================================================
 # Kernel configuration targets
 # These targets are used from top-level makefile
+# This specific makefile only contains special targets and targets for
+# the line-oriented program. Other interface flavours are included at the end.
 
-PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config \
+PHONY += oldconfig config silentoldconfig update-po-config \
 	localmodconfig localyesconfig
 
 ifdef KBUILD_KCONFIG
@@ -14,21 +16,9 @@ endif
 # We need this, in case the user has it in its environment
 unexport CONFIG_
 
-xconfig: $(obj)/qconf
-	$< $(Kconfig)
-
-gconfig: $(obj)/gconf
-	$< $(Kconfig)
-
-menuconfig: $(obj)/mconf
-	$< $(Kconfig)
-
 config: $(obj)/conf
 	$< --oldaskconfig $(Kconfig)
 
-nconfig: $(obj)/nconf
-	$< $(Kconfig)
-
 oldconfig: $(obj)/conf
 	$< --$@ $(Kconfig)
 
@@ -53,7 +43,7 @@ localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
-update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
+update-po-config: $(obj)/kxgettext $(obj)/gkonfig/gconf.glade.h
 	$(Q)echo "  GEN     config.pot"
 	$(Q)xgettext --default-domain=linux                         \
 	    --add-comments --keyword=_ --keyword=N_                 \
@@ -110,6 +100,7 @@ help:
 	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
 	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
+	@echo  '  qconfig	  - Update current config utilising a QT based front-end'
 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
@@ -125,81 +116,28 @@ help:
 	@echo  '  listnewconfig   - List new options'
 	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their default value'
 
-# lxdialog stuff
-check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
-
 # Use recursively expanded variables so we do not call gcc unless
 # we really need to do so. (Do not call gcc as part of make mrproper)
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
                     -DLOCALE
 
 # ===========================================================================
-# Shared Makefile for the various kconfig executables:
+# Shared Makefile for some of the kconfig executables:
 # conf:	  Used for defconfig, oldconfig and related targets
-# nconf:  Used for the nconfig target.
-#         Utilizes ncurses
-# mconf:  Used for the menuconfig target
-#         Utilizes the lxdialog package
-# qconf:  Used for the xconfig target
-#         Based on QT which needs to be installed to compile it
-# gconf:  Used for the gconfig target
-#         Based on GTK which needs to be installed to compile it
 # object files used by all kconfig flavours
 
-lxdialog := lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o
-lxdialog += lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o
-
 conf-objs	:= conf.o  zconf.tab.o
-mconf-objs     := mconf.o zconf.tab.o $(lxdialog)
-nconf-objs     := nconf.o zconf.tab.o nconf.gui.o
 kxgettext-objs	:= kxgettext.o zconf.tab.o
-qconf-cxxobjs	:= qconf.o
-qconf-objs	:= zconf.tab.o
-gconf-objs	:= gconf.o zconf.tab.o
 
 hostprogs-y := conf
 
-ifeq ($(MAKECMDGOALS),nconfig)
-	hostprogs-y += nconf
-endif
-
-ifeq ($(MAKECMDGOALS),menuconfig)
-	hostprogs-y += mconf
-endif
-
 ifeq ($(MAKECMDGOALS),update-po-config)
 	hostprogs-y += kxgettext
 endif
 
-ifeq ($(MAKECMDGOALS),xconfig)
-	qconf-target := 1
-endif
-ifeq ($(MAKECMDGOALS),gconfig)
-	gconf-target := 1
-endif
-
-
-ifeq ($(qconf-target),1)
-	hostprogs-y += qconf
-endif
-
-ifeq ($(gconf-target),1)
-	hostprogs-y += gconf
-endif
-
-clean-files	:= qconf.moc .tmp_qtcheck .tmp_gtkcheck
-clean-files	+= zconf.tab.c zconf.lex.c zconf.hash.c gconf.glade.h
-clean-files     += mconf qconf gconf nconf
+clean-files	:= zconf.tab.c zconf.lex.c zconf.hash.c
 clean-files     += config.pot linux.pot
 
-# Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
-PHONY += $(obj)/dochecklxdialog
-$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
-$(obj)/dochecklxdialog:
-	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTLOADLIBES_mconf)
-
-always := dochecklxdialog
-
 # Add environment specific flags
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
 
@@ -210,113 +148,16 @@ HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 LEX_PREFIX_zconf	:= zconf
 YACC_PREFIX_zconf	:= zconf
 
-HOSTLOADLIBES_qconf	= $(KC_QT_LIBS)
-HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS)
-
-HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
-HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
-                          -Wno-missing-prototypes
-
-HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
-
-HOSTLOADLIBES_nconf	= $(shell \
-				pkg-config --libs menu panel ncurses 2>/dev/null \
-				|| echo "-lmenu -lpanel -lncurses"  )
-$(obj)/qconf.o: $(obj)/.tmp_qtcheck
-
-ifeq ($(qconf-target),1)
-$(obj)/.tmp_qtcheck: $(src)/Makefile
--include $(obj)/.tmp_qtcheck
-
-# QT needs some extra effort...
-$(obj)/.tmp_qtcheck:
-	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
-	if ! pkg-config --exists QtCore 2> /dev/null; then \
-	    echo "* Unable to find the QT4 tool qmake. Trying to use QT3"; \
-	    pkg-config --exists qt 2> /dev/null && pkg=qt; \
-	    pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
-	    if [ -n "$$pkg" ]; then \
-	      cflags="\$$(shell pkg-config $$pkg --cflags)"; \
-	      libs="\$$(shell pkg-config $$pkg --libs)"; \
-	      moc="\$$(shell pkg-config $$pkg --variable=prefix)/bin/moc"; \
-	      dir="$$(pkg-config $$pkg --variable=prefix)"; \
-	    else \
-	      for d in $$QTDIR /usr/share/qt* /usr/lib/qt*; do \
-	        if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
-	      done; \
-	      if [ -z "$$dir" ]; then \
-	        echo >&2 "*"; \
-	        echo >&2 "* Unable to find any QT installation. Please make sure that"; \
-	        echo >&2 "* the QT4 or QT3 development package is correctly installed and"; \
-	        echo >&2 "* either qmake can be found or install pkg-config or set"; \
-	        echo >&2 "* the QTDIR environment variable to the correct location."; \
-	        echo >&2 "*"; \
-	        false; \
-	      fi; \
-	      libpath=$$dir/lib; lib=qt; osdir=""; \
-	      $(HOSTCXX) -print-multi-os-directory > /dev/null 2>&1 && \
-	        osdir=x$$($(HOSTCXX) -print-multi-os-directory); \
-	      test -d $$libpath/$$osdir && libpath=$$libpath/$$osdir; \
-	      test -f $$libpath/libqt-mt.so && lib=qt-mt; \
-	      cflags="-I$$dir/include"; \
-	      libs="-L$$libpath -Wl,-rpath,$$libpath -l$$lib"; \
-	      moc="$$dir/bin/moc"; \
-	    fi; \
-	    if [ ! -x $$dir/bin/moc -a -x /usr/bin/moc ]; then \
-	      echo "*"; \
-	      echo "* Unable to find $$dir/bin/moc, using /usr/bin/moc instead."; \
-	      echo "*"; \
-	      moc="/usr/bin/moc"; \
-	    fi; \
-	else \
-	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
-	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
-	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
-	  [ -n "$$moc" ] || moc="\$$(shell pkg-config QtCore --variable=prefix)/bin/moc"; \
-	fi; \
-	echo "KC_QT_CFLAGS=$$cflags" > $@; \
-	echo "KC_QT_LIBS=$$libs" >> $@; \
-	echo "KC_QT_MOC=$$moc" >> $@
-endif
-
-$(obj)/gconf.o: $(obj)/.tmp_gtkcheck
-
-ifeq ($(gconf-target),1)
--include $(obj)/.tmp_gtkcheck
-
-# GTK needs some extra effort, too...
-$(obj)/.tmp_gtkcheck:
-	@if `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0`; then		\
-		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
-			touch $@;								\
-		else									\
-			echo >&2 "*"; 							\
-			echo >&2 "* GTK+ is present but version >= 2.0.0 is required.";	\
-			echo >&2 "*";							\
-			false;								\
-		fi									\
-	else										\
-		echo >&2 "*"; 								\
-		echo >&2 "* Unable to find the GTK+ installation. Please make sure that"; 	\
-		echo >&2 "* the GTK+ 2.0 development package is correctly installed..."; 	\
-		echo >&2 "* You need gtk+-2.0, glib-2.0 and libglade-2.0."; 		\
-		echo >&2 "*"; 								\
-		false;									\
-	fi
-endif
-
 $(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c
 
-$(obj)/qconf.o: $(obj)/qconf.moc
-
-quiet_cmd_moc = MOC     $@
-      cmd_moc = $(KC_QT_MOC) -i $< -o $@
+# NCurses/Dialog Interface
+include $(obj)/menuconfig/Makefile
 
-$(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
-	$(call cmd,moc)
+# Qt Interface
+include $(obj)/qconfig/Makefile
 
-# Extract gconf menu items for I18N support
-$(obj)/gconf.glade.h: $(obj)/gconf.glade
-	$(Q)intltool-extract --type=gettext/glade --srcdir=$(srctree) \
-	$(obj)/gconf.glade
+# NCurses Interface
+include $(obj)/nconfig/Makefile
 
+# Gtk Interface
+include $(obj)/gconfig/Makefile
diff --git a/scripts/kconfig/POTFILES.in b/scripts/kconfig/POTFILES.in
index 9674573..6422033 100644
--- a/scripts/kconfig/POTFILES.in
+++ b/scripts/kconfig/POTFILES.in
@@ -1,12 +1,12 @@
-scripts/kconfig/lxdialog/checklist.c
-scripts/kconfig/lxdialog/inputbox.c
-scripts/kconfig/lxdialog/menubox.c
-scripts/kconfig/lxdialog/textbox.c
-scripts/kconfig/lxdialog/util.c
-scripts/kconfig/lxdialog/yesno.c
-scripts/kconfig/mconf.c
+scripts/kconfig/menuconfig/checklist.c
+scripts/kconfig/menuconfig/inputbox.c
+scripts/kconfig/menuconfig/menubox.c
+scripts/kconfig/menuconfig/textbox.c
+scripts/kconfig/menuconfig/util.c
+scripts/kconfig/menuconfig/yesno.c
+scripts/kconfig/menuconfig/mconf.c
 scripts/kconfig/conf.c
 scripts/kconfig/confdata.c
-scripts/kconfig/gconf.c
-scripts/kconfig/gconf.glade.h
-scripts/kconfig/qconf.cc
+scripts/kconfig/gconfig/gconf.c
+scripts/kconfig/gconfig/gconf.glade.h
+scripts/kconfig/qconfig/qconf.cc
diff --git a/scripts/kconfig/gconfig/Makefile b/scripts/kconfig/gconfig/Makefile
new file mode 100644
index 0000000..b5a5e6d
--- /dev/null
+++ b/scripts/kconfig/gconfig/Makefile
@@ -0,0 +1,62 @@
+# ===========================================================================
+# Kernel configuration targets
+# These targets are used from top-level makefile
+
+PHONY += gconfig
+
+gconfig: $(obj)/gconf
+	$< $(Kconfig)
+
+# ===========================================================================
+# Shared Makefile for some of the kconfig executables:
+# gconf:  Used for the gconfig target
+#         Based on GTK which needs to be installed to compile it
+# object files used by all kconfig flavours listed above
+
+gconf-objs	:= gconfig/gconf.o zconf.tab.o
+
+ifeq ($(MAKECMDGOALS),gconfig)
+	gconf-target := 1
+endif
+
+ifeq ($(gconf-target),1)
+	hostprogs-y += gconf
+endif
+
+clean-files	+= gconfig/gconf.glade.h gconf
+
+
+HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
+HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
+                          -Wno-missing-prototypes
+
+$(obj)/gconfig/gconf.o: $(obj)/gconfig/.tmp_gtkcheck
+
+ifeq ($(gconf-target),1)
+-include $(obj)/.tmp_gtkcheck
+
+# GTK needs some extra effort, too...
+$(obj)/gconfig/.tmp_gtkcheck:
+	@if `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0`; then		\
+		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
+			touch $@;								\
+		else									\
+			echo >&2 "*"; 							\
+			echo >&2 "* GTK+ is present but version >= 2.0.0 is required.";	\
+			echo >&2 "*";							\
+			false;								\
+		fi									\
+	else										\
+		echo >&2 "*"; 								\
+		echo >&2 "* Unable to find the GTK+ installation. Please make sure that"; 	\
+		echo >&2 "* the GTK+ 2.0 development package is correctly installed..."; 	\
+		echo >&2 "* You need gtk+-2.0, glib-2.0 and libglade-2.0."; 		\
+		echo >&2 "*"; 								\
+		false;									\
+	fi
+endif
+
+# Extract gconf menu items for I18N support
+$(obj)/gconfig/gconf.glade.h: $(obj)/gconfig/gconf.glade
+	$(Q)intltool-extract --type=gettext/glade --srcdir=$(srctree) \
+	$(obj)/gconfig/gconf.glade
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconfig/gconf.c
similarity index 99%
rename from scripts/kconfig/gconf.c
rename to scripts/kconfig/gconfig/gconf.c
index f2bee70..aab4abf 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconfig/gconf.c
@@ -11,8 +11,8 @@
 #endif
 
 #include <stdlib.h>
-#include "lkc.h"
-#include "images.c"
+#include "../lkc.h"
+#include "../images.c"
 
 #include <glade/glade.h>
 #include <gtk/gtk.h>
@@ -1486,7 +1486,7 @@ int main(int ac, char *av[])
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
 	if (env)
-		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.glade", NULL);
+		glade_file = g_strconcat(env, "/scripts/kconfig/gconfig/gconf.glade", NULL);
 	else if (av[0][0] == '/')
 		glade_file = g_strconcat(av[0], ".glade", NULL);
 	else
diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconfig/gconf.glade
similarity index 100%
rename from scripts/kconfig/gconf.glade
rename to scripts/kconfig/gconfig/gconf.glade
diff --git a/scripts/kconfig/lxdialog/.gitignore b/scripts/kconfig/menuconfig/.gitignore
similarity index 100%
rename from scripts/kconfig/lxdialog/.gitignore
rename to scripts/kconfig/menuconfig/.gitignore
diff --git a/scripts/kconfig/lxdialog/BIG.FAT.WARNING b/scripts/kconfig/menuconfig/BIG.FAT.WARNING
similarity index 100%
rename from scripts/kconfig/lxdialog/BIG.FAT.WARNING
rename to scripts/kconfig/menuconfig/BIG.FAT.WARNING
diff --git a/scripts/kconfig/menuconfig/Makefile b/scripts/kconfig/menuconfig/Makefile
new file mode 100644
index 0000000..14d0f5c
--- /dev/null
+++ b/scripts/kconfig/menuconfig/Makefile
@@ -0,0 +1,42 @@
+# ===========================================================================
+# Kernel configuration targets
+# These targets are used from top-level makefile
+
+PHONY += menuconfig
+
+menuconfig: $(obj)/mconf
+	$< $(Kconfig)
+
+# lxdialog stuff
+check-lxdialog  := $(srctree)/$(src)/menuconfig/check-lxdialog.sh
+
+# Use recursively expanded variables so we do not call gcc unless
+# we really need to do so. (Do not call gcc as part of make mrproper)
+HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
+                    -DLOCALE
+
+# ===========================================================================
+# Shared Makefile for some of the kconfig executables:
+# mconf:  Used for the menuconfig target
+#         Utilizes the lxdialog package
+# object files used by all kconfig flavours listed above
+
+lxdialog := menuconfig/checklist.o menuconfig/util.o menuconfig/inputbox.o
+lxdialog += menuconfig/textbox.o menuconfig/yesno.o menuconfig/menubox.o
+
+mconf-objs     := menuconfig/mconf.o zconf.tab.o $(lxdialog)
+
+ifeq ($(MAKECMDGOALS),menuconfig)
+	hostprogs-y += mconf
+endif
+
+clean-files     += mconf
+
+# Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
+HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
+PHONY += $(obj)/dochecklxdialog
+$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
+$(obj)/dochecklxdialog:
+	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTLOADLIBES_mconf)
+
+always := dochecklxdialog
diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/menuconfig/check-lxdialog.sh
similarity index 100%
rename from scripts/kconfig/lxdialog/check-lxdialog.sh
rename to scripts/kconfig/menuconfig/check-lxdialog.sh
diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/menuconfig/checklist.c
similarity index 100%
rename from scripts/kconfig/lxdialog/checklist.c
rename to scripts/kconfig/menuconfig/checklist.c
diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/menuconfig/dialog.h
similarity index 100%
rename from scripts/kconfig/lxdialog/dialog.h
rename to scripts/kconfig/menuconfig/dialog.h
diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/menuconfig/inputbox.c
similarity index 100%
rename from scripts/kconfig/lxdialog/inputbox.c
rename to scripts/kconfig/menuconfig/inputbox.c
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/menuconfig/mconf.c
similarity index 99%
rename from scripts/kconfig/mconf.c
rename to scripts/kconfig/menuconfig/mconf.c
index 59184bb..014c4d6 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/menuconfig/mconf.c
@@ -19,8 +19,8 @@
 #include <unistd.h>
 #include <locale.h>
 
-#include "lkc.h"
-#include "lxdialog/dialog.h"
+#include "../lkc.h"
+#include "dialog.h"
 
 static const char mconf_readme[] = N_(
 "Overview\n"
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/menuconfig/menubox.c
similarity index 100%
rename from scripts/kconfig/lxdialog/menubox.c
rename to scripts/kconfig/menuconfig/menubox.c
diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/menuconfig/textbox.c
similarity index 100%
rename from scripts/kconfig/lxdialog/textbox.c
rename to scripts/kconfig/menuconfig/textbox.c
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/menuconfig/util.c
similarity index 100%
rename from scripts/kconfig/lxdialog/util.c
rename to scripts/kconfig/menuconfig/util.c
diff --git a/scripts/kconfig/lxdialog/yesno.c b/scripts/kconfig/menuconfig/yesno.c
similarity index 100%
rename from scripts/kconfig/lxdialog/yesno.c
rename to scripts/kconfig/menuconfig/yesno.c
diff --git a/scripts/kconfig/nconfig/Makefile b/scripts/kconfig/nconfig/Makefile
new file mode 100644
index 0000000..3d1b129
--- /dev/null
+++ b/scripts/kconfig/nconfig/Makefile
@@ -0,0 +1,26 @@
+# ===========================================================================
+# Kernel configuration targets
+# These targets are used from top-level makefile
+
+PHONY += nconfig
+
+nconfig: $(obj)/nconf
+	$< $(Kconfig)
+
+# ===========================================================================
+# nconf:  Used for the nconfig target.
+#         Utilizes ncurses
+# object files used by all kconfig flavours listed above
+
+nconf-objs     := nconfig/nconf.o zconf.tab.o nconfig/nconf.gui.o
+
+ifeq ($(MAKECMDGOALS),nconfig)
+	hostprogs-y += nconf
+endif
+
+clean-files     += nconf
+
+HOSTLOADLIBES_nconf	= $(shell \
+				pkg-config --libs menu panel ncurses 2>/dev/null \
+				|| echo "-lmenu -lpanel -lncurses"  )
+
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconfig/nconf.c
similarity index 99%
rename from scripts/kconfig/nconf.c
rename to scripts/kconfig/nconfig/nconf.c
index 4fbecd2..79ec5f1 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconfig/nconf.c
@@ -9,7 +9,7 @@
 #include <string.h>
 #include <stdlib.h>
 
-#include "lkc.h"
+#include "../lkc.h"
 #include "nconf.h"
 #include <ctype.h>
 
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconfig/nconf.gui.c
similarity index 100%
rename from scripts/kconfig/nconf.gui.c
rename to scripts/kconfig/nconfig/nconf.gui.c
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconfig/nconf.h
similarity index 100%
rename from scripts/kconfig/nconf.h
rename to scripts/kconfig/nconfig/nconf.h
diff --git a/scripts/kconfig/qconfig/Makefile b/scripts/kconfig/qconfig/Makefile
new file mode 100644
index 0000000..d2e6463
--- /dev/null
+++ b/scripts/kconfig/qconfig/Makefile
@@ -0,0 +1,104 @@
+# ===========================================================================
+# Kernel configuration targets
+# These targets are used from kconfig top-level makefile
+
+PHONY +=  xconfig
+
+xconfig: $(obj)/qconf
+	$< $(Kconfig)
+
+# ===========================================================================
+# qconf:  Used for the xconfig/qconfig target
+#         Based on Qt4+ which needs to be installed to compile it
+
+# Meta object files (moc files) have to be considered for every class that uses the Q_OBJECT macro.
+# We collect all class header files below, build moc_[filename].o object filenames and store those in "MOCS".
+# Assumtion: All header files in this directory contain c++ code.
+
+# Object files used by this kconfig flavours listed below. Meta object files (moc files) are generated by
+# the Qt moc tool. We have to build and link those generated files, too.
+qconf-cxxobjs	:= qconfig/qconf.o
+
+# Object files used by all kconfig flavours listed below
+qconf-objs	:= zconf.tab.o
+
+ifeq ($(MAKECMDGOALS),qconfig)
+	qconf-target := 1
+endif
+
+ifeq ($(MAKECMDGOALS),xconfig)
+	qconf-target := 1
+endif
+
+ifeq ($(qconf-target),1)
+	hostprogs-y += qconf
+endif
+
+clean-files	+= qconfig/*.moc qconfig/.tmp_qtcheck qconf
+
+HOSTLOADLIBES_qconf	= $(KC_QT_LIBS)
+HOSTCXXFLAGS	= $(KC_QT_CFLAGS)
+
+$(obj)/qconfig/qconf.o: $(obj)/qconfig/qconf.moc $(src)/qconfig/.tmp_qtcheck
+
+ifeq ($(qconf-target),1)
+$(obj)/qconfig/.tmp_qtcheck: $(src)/Makefile
+-include $(obj)/qconfig/.tmp_qtcheck
+
+# QT needs some extra effort...
+$(obj)/qconfig/.tmp_qtcheck:
+	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
+	if ! pkg-config --exists QtCore 2> /dev/null; then \
+	    echo "* Unable to find the QT4 tool qmake. Trying to use QT3"; \
+	    pkg-config --exists qt 2> /dev/null && pkg=qt; \
+	    pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
+	    if [ -n "$$pkg" ]; then \
+	      cflags="\$$(shell pkg-config $$pkg --cflags)"; \
+	      libs="\$$(shell pkg-config $$pkg --libs)"; \
+	      moc="\$$(shell pkg-config $$pkg --variable=prefix)/bin/moc"; \
+	      dir="$$(pkg-config $$pkg --variable=prefix)"; \
+	    else \
+	      for d in $$QTDIR /usr/share/qt* /usr/lib/qt*; do \
+	        if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
+	      done; \
+	      if [ -z "$$dir" ]; then \
+	        echo >&2 "*"; \
+	        echo >&2 "* Unable to find any QT installation. Please make sure that"; \
+	        echo >&2 "* the QT4 or QT3 development package is correctly installed and"; \
+	        echo >&2 "* either qmake can be found or install pkg-config or set"; \
+	        echo >&2 "* the QTDIR environment variable to the correct location."; \
+	        echo >&2 "*"; \
+	        false; \
+	      fi; \
+	      libpath=$$dir/lib; lib=qt; osdir=""; \
+	      $(HOSTCXX) -print-multi-os-directory > /dev/null 2>&1 && \
+	        osdir=x$$($(HOSTCXX) -print-multi-os-directory); \
+	      test -d $$libpath/$$osdir && libpath=$$libpath/$$osdir; \
+	      test -f $$libpath/libqt-mt.so && lib=qt-mt; \
+	      cflags="-I$$dir/include"; \
+	      libs="-L$$libpath -Wl,-rpath,$$libpath -l$$lib"; \
+	      moc="$$dir/bin/moc"; \
+	    fi; \
+	    if [ ! -x $$dir/bin/moc -a -x /usr/bin/moc ]; then \
+	      echo "*"; \
+	      echo "* Unable to find $$dir/bin/moc, using /usr/bin/moc instead."; \
+	      echo "*"; \
+	      moc="/usr/bin/moc"; \
+	    fi; \
+	else \
+	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
+	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
+	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
+	  [ -n "$$moc" ] || moc="\$$(shell pkg-config QtCore --variable=prefix)/bin/moc"; \
+	fi; \
+	echo "KC_QT_CFLAGS=$$cflags" > $@; \
+	echo "KC_QT_LIBS=$$libs" >> $@; \
+	echo "KC_QT_MOC=$$moc" >> $@
+endif
+
+quiet_cmd_moc = MOC     $@
+      cmd_moc = $(KC_QT_MOC) -i $< -o $@
+
+$(obj)/qconfig/%.moc: $(obj)/qconfig/%.h $(obj)/qconfig/.tmp_qtcheck
+	$(call cmd,moc)
+
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconfig/qconf.cc
similarity index 99%
rename from scripts/kconfig/qconf.cc
rename to scripts/kconfig/qconfig/qconf.cc
index 9d3b04b..9ea6dcb 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconfig/qconf.cc
@@ -43,11 +43,11 @@
 
 #include <stdlib.h>
 
-#include "lkc.h"
+#include "../lkc.h"
 #include "qconf.h"
 
 #include "qconf.moc"
-#include "images.c"
+#include "../images.c"
 
 #ifdef _
 # undef _
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconfig/qconf.h
similarity index 100%
rename from scripts/kconfig/qconf.h
rename to scripts/kconfig/qconfig/qconf.h
-- 
1.9.1

