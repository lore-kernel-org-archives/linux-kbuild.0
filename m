Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from charm.itp.tuwien.ac.at ([128.131.48.139]:43226 "EHLO
	charm.itp.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753479AbYIQU6J (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 16:58:09 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Fix Section and Source field
Date: Wed, 17 Sep 2008 22:09:52 +0200
Message-Id: <1221682195-26809-4-git-send-email-max@stro.at>
In-Reply-To: <1221682195-26809-3-git-send-email-max@stro.at>
References: <1221682195-26809-1-git-send-email-max@stro.at>
 <1221682195-26809-2-git-send-email-max@stro.at>
 <1221682195-26809-3-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, dilinger@debian.org, maximilian attems <max@stro.at>

Base section has been removed, the base is defined by Priority field.
Source is linux-2.6.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 19d933e..757206f 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -81,7 +81,7 @@ fi
 maintainer="${name} <${email}>"
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux ($version-$revision) unstable; urgency=low
+linux-2.6 ($version-$revision) unstable; urgency=low
 
   * New upstream release
 
@@ -92,8 +92,8 @@ EOF
 if [ "$ARCH" == "um" ]; then
 
 cat <<EOF > debian/control
-Source: linux
-Section: base
+Source: linux-2.6
+Section: admin
 Priority: optional
 Maintainer: $maintainer
 Standards-Version: 3.8.0
@@ -114,8 +114,8 @@ EOF
 
 else
 cat <<EOF > debian/control
-Source: linux
-Section: base
+Source: linux-2.6
+Section: admin
 Priority: optional
 Maintainer: $maintainer
 Standards-Version: 3.8.0
-- 
1.5.6.5

