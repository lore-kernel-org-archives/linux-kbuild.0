Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:63199 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886Ab3HSRw2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Aug 2013 13:52:28 -0400
Received: by mail-we0-f176.google.com with SMTP id q56so933131wes.21
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2013 10:52:27 -0700 (PDT)
From: David Graeff <david.graeff@web.de>
Subject: [PATCH v3 6/6] kconfig: Update POTFILES.in to reflect new directory structure.
Date: Mon, 19 Aug 2013 19:50:47 +0200
Message-Id: <1376934647-39773-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-gtk-qt>
References: <kconfig-port-gtk-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: David Graeff <david.graeff@web.de>, yann.morin.1998@free.fr, sam@ravnborg.org, mmarek@suse.cz

* Rename lxdialog to menuconfig.
* Add gconfig/qconfig source/ui files.

diff --git a/scripts/kconfig/POTFILES.in b/scripts/kconfig/POTFILES.in
index 9674573..e8a6603 100644
--- a/scripts/kconfig/POTFILES.in
+++ b/scripts/kconfig/POTFILES.in
@@ -1,12 +1,21 @@
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
+scripts/kconfig/gconfig/gconf_treeview_model.c
+[type: gettext/glade]scripts/kconfig/gconfig/gconf.ui
+scripts/kconfig/qconfig/configItem.cc
+scripts/kconfig/qconfig/configModel.cc
+scripts/kconfig/qconfig/configmodeldelegate.cc
+scripts/kconfig/qconfig/infoViewWidget.cc
+scripts/kconfig/qconfig/mainwindow.cc
+scripts/kconfig/qconfig/qconf.cc
+scripts/kconfig/qconfig/searchfiltermodelproxy.cc
+scripts/kconfig/qconfig/searchmodel.cc
+[type: gettext/qtdesigner]scripts/kconfig/qconfig/mainwindow.ui
\ No newline at end of file
-- 
1.8.1.2

