Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from charm.itp.tuwien.ac.at ([128.131.48.139]:43224 "EHLO
	charm.itp.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030AbYIQU6H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 16:58:07 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Generate a debian/copyright
Date: Wed, 17 Sep 2008 22:09:53 +0200
Message-Id: <1221682195-26809-5-git-send-email-max@stro.at>
In-Reply-To: <1221682195-26809-4-git-send-email-max@stro.at>
References: <1221682195-26809-1-git-send-email-max@stro.at>
 <1221682195-26809-2-git-send-email-max@stro.at>
 <1221682195-26809-3-git-send-email-max@stro.at>
 <1221682195-26809-4-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, dilinger@debian.org, maximilian attems <max@stro.at>

add a basic debian/copyright to the binary package.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 757206f..ed33624 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -88,6 +88,26 @@ linux-2.6 ($version-$revision) unstable; urgency=low
  -- ${maintainer}  $(date -R)
 EOF
 
+# Generate copyright file
+cat <<EOF > debian/copyright
+This is a packacked upstream version of the Linux kernel.
+
+The sources may be found at most Linux ftp sites, including
+ftp://ftp.kernel.org/pub/linux/kernel
+
+Copyright: 1991 - 2008 Linus Torvalds and others.
+
+see git history
+git://git.eu.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; version 2 dated June, 1991.
+
+On Debian GNU/Linux systems, the complete text of the GNU General
+Public License can be found in \`/usr/share/common-licenses/GPL'.
+EOF
+
 # Generate a control file
 if [ "$ARCH" == "um" ]; then
 
-- 
1.5.6.5

