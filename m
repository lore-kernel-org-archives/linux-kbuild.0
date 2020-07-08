Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:39011 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729597AbgGHNab (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 09:30:31 -0400
From: Maxime Chretien <maxime.chretien@bootlin.com>
Subject: [PATCH] kconfig qconf: Add grey background for hidden options
Date: Wed,  8 Jul 2020 15:30:15 +0200
Message-Id: <20200708133015.12286-1-maxime.chretien@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Chretien <maxime.chretien@bootlin.com>

This is useful to see which configuration parameters can be edited
or not when "Show All Options" is enabled.

Signed-off-by: Maxime Chretien <maxime.chretien@bootlin.com>
---
 scripts/kconfig/qconf.cc | 7 +++++++
 scripts/kconfig/qconf.h  | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c0ac8f7b5f1a..be9ff4651da1 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -208,6 +208,13 @@ void ConfigItem::updateMenu(void)
 	}
 	if (!sym_has_value(sym) && visible)
 		prompt += " (NEW)";
+
+	if(!visible) {
+		setBackground(promptColIdx, QBrush(QColor("#E0E0E0")));
+	} else {
+		setBackground(promptColIdx, QBrush());
+	}
+
 set_prompt:
 	setText(promptColIdx, prompt);
 }
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index c879d79ce817..79e47e8c1ae7 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -174,6 +174,10 @@ class ConfigItem : public QTreeWidgetItem {
 	{
 		return Parent::text(idx);
 	}
+	void setBackground(colIdx idx, const QBrush& brush)
+	{
+		Parent::setBackground(idx, brush);
+	}
 	void setPixmap(colIdx idx, const QIcon &icon)
 	{
 		Parent::setIcon(idx, icon);
-- 
2.27.0
