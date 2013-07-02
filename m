Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:60762 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752989Ab3GBPXn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Jul 2013 11:23:43 -0400
Received: by mail-ee0-f42.google.com with SMTP id c4so2875064eek.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2013 08:23:42 -0700 (PDT)
From: davidgraeff <david.graeff@web.de>
Subject: [PATCH 9/9] kconfig: qt flavour, add missing updateTree
Date: Tue,  2 Jul 2013 17:22:30 +0200
Message-Id: <1372778550-22110-10-git-send-email-david.graeff@web.de>
In-Reply-To: <1372778550-22110-1-git-send-email-david.graeff@web.de>
References: <kconfig-port-gtk-qt>
 <1372778550-22110-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, davidgraeff <david.graeff@web.de>

* Remove all #includes for moc files
* Add ui option to show/hide subtrees of disabled options.
* Update the entire model on current item change like gconf
---
 scripts/kconfig/qconfig/infoViewWidget.cc         |  4 +---
 scripts/kconfig/qconfig/mainwindow.cc             | 22 +++++++++++++---------
 scripts/kconfig/qconfig/mainwindow.h              |  2 ++
 scripts/kconfig/qconfig/mainwindow.ui             | 16 ++++++++++++++++
 scripts/kconfig/qconfig/searchfiltermodelproxy.cc |  4 +---
 scripts/kconfig/qconfig/searchmodel.cc            |  4 +---
 6 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/scripts/kconfig/qconfig/infoViewWidget.cc b/scripts/kconfig/qconfig/infoViewWidget.cc
index 21024a8..abcfa09 100644
--- a/scripts/kconfig/qconfig/infoViewWidget.cc
+++ b/scripts/kconfig/qconfig/infoViewWidget.cc
@@ -10,9 +10,7 @@
 #include <QSettings>
 #include "../expr.h"
 #include "../lkc.h"
-#ifdef INCLUDEMOC
-#include "infoViewWidget.moc"
-#endif
+
 InfoViewWidget::InfoViewWidget(QWidget* parent)
     : Parent(parent), sym(0), _menu(0)
 {
diff --git a/scripts/kconfig/qconfig/mainwindow.cc b/scripts/kconfig/qconfig/mainwindow.cc
index 04216f9..bb7870e 100644
--- a/scripts/kconfig/qconfig/mainwindow.cc
+++ b/scripts/kconfig/qconfig/mainwindow.cc
@@ -20,9 +20,7 @@
 #include "../images.c"
 #include "../expr.h"
 #include "../lkc.h"
-#ifdef INCLUDEMOC
-#include "mainwindow.moc"
-#endif
+
 bool qconf_MainWindow::check_conf_changed()
 {
     bool changed = conf_get_changed();
@@ -291,12 +289,13 @@ void qconf_MainWindow::on_actionLoad_triggered()
 
 void qconf_MainWindow::on_actionBack_triggered()
 {
-    QModelIndex parent = ui->treeAll->rootIndex().parent();
-    if (view_mode==SINGLE_VIEW) {
-        ui->treeAll->setRootIndex(parent);
-        ui->actionBack->setEnabled(parent.isValid());
-        updateCurrentPositionLabel();
-    }
+    // if (view_mode==SINGLE_VIEW)
+    QModelIndex current = ui->treeAll->rootIndex();
+    QModelIndex parent = current.parent();
+    ui->treeAll->setRootIndex(parent);
+    ui->actionBack->setEnabled(parent.isValid());
+    ui->treeAll->scrollTo(current);
+    updateCurrentPositionLabel();
 }
 
 void qconf_MainWindow::on_actionSingleView_triggered()
@@ -376,3 +375,8 @@ void qconf_MainWindow::updateCurrentPositionLabel()
     }
     ui->labelPosition->setText(t);
 }
+
+void qconf_MainWindow::on_actionHide_disabled_subtrees_triggered()
+{
+    mBaseModel->setHideChildren(ui->actionHide_disabled_subtrees->isChecked());
+}
diff --git a/scripts/kconfig/qconfig/mainwindow.h b/scripts/kconfig/qconfig/mainwindow.h
index e741386..c52db88 100644
--- a/scripts/kconfig/qconfig/mainwindow.h
+++ b/scripts/kconfig/qconfig/mainwindow.h
@@ -45,6 +45,8 @@ private Q_SLOTS:
     void on_treeAll_activated(const QModelIndex &index);
     void on_listSearch_clicked(const QModelIndex &index);
 
+    void on_actionHide_disabled_subtrees_triggered();
+
 private:
     Ui::qconf_MainWindow *ui;
     ConfigModel* mBaseModel;
diff --git a/scripts/kconfig/qconfig/mainwindow.ui b/scripts/kconfig/qconfig/mainwindow.ui
index c6662af..0f548c8 100644
--- a/scripts/kconfig/qconfig/mainwindow.ui
+++ b/scripts/kconfig/qconfig/mainwindow.ui
@@ -20,6 +20,9 @@
       <property name="orientation">
        <enum>Qt::Horizontal</enum>
       </property>
+      <property name="childrenCollapsible">
+       <bool>false</bool>
+      </property>
       <widget class="QTabWidget" name="tabWidget">
        <property name="currentIndex">
         <number>0</number>
@@ -149,6 +152,8 @@
     <property name="title">
      <string>Option</string>
     </property>
+    <addaction name="actionHide_disabled_subtrees"/>
+    <addaction name="separator"/>
     <addaction name="actionShow_Name"/>
     <addaction name="actionShow_Range"/>
     <addaction name="actionShow_Data_Value"/>
@@ -380,6 +385,17 @@
     <string>FullView</string>
    </property>
   </action>
+  <action name="actionHide_disabled_subtrees">
+   <property name="checkable">
+    <bool>true</bool>
+   </property>
+   <property name="checked">
+    <bool>true</bool>
+   </property>
+   <property name="text">
+    <string>Hide disabled subtrees</string>
+   </property>
+  </action>
  </widget>
  <layoutdefault spacing="6" margin="11"/>
  <customwidgets>
diff --git a/scripts/kconfig/qconfig/searchfiltermodelproxy.cc b/scripts/kconfig/qconfig/searchfiltermodelproxy.cc
index daebe9f..5cf9377 100644
--- a/scripts/kconfig/qconfig/searchfiltermodelproxy.cc
+++ b/scripts/kconfig/qconfig/searchfiltermodelproxy.cc
@@ -4,9 +4,7 @@
  */
 #include "searchfiltermodelproxy.h"
 #include "configModel.h"
-#ifdef INCLUDEMOC
-#include "searchfiltermodelproxy.moc"
-#endif
+
 SearchFilterModelProxy::SearchFilterModelProxy(QObject *parent) :
     QSortFilterProxyModel(parent)
 {
diff --git a/scripts/kconfig/qconfig/searchmodel.cc b/scripts/kconfig/qconfig/searchmodel.cc
index 974ad53..b98311a 100644
--- a/scripts/kconfig/qconfig/searchmodel.cc
+++ b/scripts/kconfig/qconfig/searchmodel.cc
@@ -2,9 +2,7 @@
 #include <QPalette>
 #include "../expr.h"
 #include "../lkc.h"
-#ifdef INCLUDEMOC
-#include "searchmodel.moc"
-#endif
+
 
 SearchModel::item::item(struct menu* menu) {
     this->menu = menu;
-- 
1.8.1.2

