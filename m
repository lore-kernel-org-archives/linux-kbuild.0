Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:55720 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757343AbZCaPTE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2009 11:19:04 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH 5/7] deb-pkg: Generate a debian/copyright
Date: Tue, 31 Mar 2009 17:19:30 +0200
Message-Id: <1238512772-21180-5-git-send-email-max@stro.at>
In-Reply-To: <1238512772-21180-4-git-send-email-max@stro.at>
References: <1238512772-21180-1-git-send-email-max@stro.at>
 <1238512772-21180-2-git-send-email-max@stro.at>
 <1238512772-21180-3-git-send-email-max@stro.at>
 <1238512772-21180-4-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, akpm@linux-foundation.org, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

add a basic debian/copyright to the binary package.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 9d21ec5..c9ff47e 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -91,6 +91,26 @@ linux-2.6 ($version-$revision) unstable; urgency=low
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
+On Debian GNU/Linux systems, the complete text of the GNU General Public
+License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
+EOF
+
 # Generate a control file
 if [ "$ARCH" == "um" ]; then
 
-- 
1.6.2.1

