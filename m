Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:47673 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753228AbZGESRs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jul 2009 14:17:48 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] kbuild: deb-pkg fix install scripts for posix sh
Date: Sun,  5 Jul 2009 20:17:34 +0200
Message-Id: <1246817854-27396-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, maximilian attems <max@stro.at>, Frans Pop <elendil@planet.nl>, Andres Salomon <dilinger@debian.org>

bash versus dash and posh disagree on expanding $@ within double quotes:
export x="$@"
see http://bugs.debian.org/381091 for details
just use the arglist with $*.

dpkg: error processing linux-image-2.6.31-rc1_2.6.31-rc1-18_i386.deb (--install):
 subprocess pre-installation script returned error exit status 2
export: 6: 2.6.31-rc1-18: bad variable name
fixes http://bugzilla.kernel.org/show_bug.cgi?id=13567

seen on Ubuntu as there dash is the default sh,
versus bash on Debian.

Reported-by: Pauli <suokkos@gmail.com>
Cc: Frans Pop <elendil@planet.nl>
Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b19f1f4..8b357b0 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -89,7 +89,7 @@ for script in postinst postrm preinst prerm ; do
 set -e
 
 # Pass maintainer script parameters to hook scripts
-export DEB_MAINT_PARAMS="\$@"
+export DEB_MAINT_PARAMS="\$*"
 
 test -d $debhookdir/$script.d && run-parts --arg="$version" $debhookdir/$script.d
 exit 0
-- 
1.5.6.5

