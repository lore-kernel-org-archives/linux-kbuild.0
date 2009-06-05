Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:36379 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754709AbZFEXlI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 19:41:08 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 05/39] kbuild, deb-pkg: pass Debian maintainer script parameters to packaging hook scripts
Date: Sat,  6 Jun 2009 01:42:23 +0200
Message-Id: <1244245377-17441-5-git-send-email-sam@ravnborg.org>
In-Reply-To: <20090605233720.GA13588@uranus.ravnborg.org>
References: <20090605233720.GA13588@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Frans Pop <elendil@planet.nl>, Andres Salomon <dilinger@debian.org>, Sam Ravnborg <sam@ravnborg.org>

From: Frans Pop <elendil@planet.nl>

The Debian packaging scripts created by the deb-pkg target do not pass
on the standard Debian maintainer script parameters to hook scripts,
which means that those scripts cannot tell whether they are being called
during e.g. install vs. upgrade, or removal vs. purge of the package.

As there are several variantions in how hook scripts are called from
kernel packages, we pass the parameters in the environment variable
DEB_MAINT_PARAMS rather than as extra arguments.

Bump version of builddep script to 1.3.

Signed-off-by: Frans Pop <elendil@planet.nl>
Acked-by: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/package/builddeb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 4876ff3..5eecbbe 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -1,6 +1,6 @@
 #!/bin/sh
 #
-# builddeb 1.2
+# builddeb 1.3
 # Copyright 2003 Wichert Akkerman <wichert@wiggy.net>
 #
 # Simple script to generate a deb package for a Linux kernel. All the
@@ -75,6 +75,9 @@ for script in postinst postrm preinst prerm ; do
 
 set -e
 
+# Pass maintainer script parameters to hook scripts
+export DEB_MAINT_PARAMS="\$@"
+
 test -d /etc/kernel/$script.d && run-parts --arg="$version" /etc/kernel/$script.d
 exit 0
 EOF
-- 
1.6.3.rc3.40.g75b44

