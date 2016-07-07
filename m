Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from david.siemens.de ([192.35.17.14]:46271 "EHLO david.siemens.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751275AbcGGPFZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jul 2016 11:05:25 -0400
From: Henning Schild <henning.schild@siemens.com>
Subject: [PATCH] builddeb: fix file permissions before packaging
Date: Thu,  7 Jul 2016 16:50:37 +0200
Message-Id: <1467903037-11785-1-git-send-email-henning.schild@siemens.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: Henning Schild <henning.schild@siemens.com>

Builddep is not very explicit about file permissions. Actually the file
permissions in the package are largely influenced by the umask of the
user cloning the git and building the package. If that umask does not
set go+r the resulting linux-headers package will prevent non-root users
from building out-of-tree modules. And that is probably just one
unexpected effect.
Being a packaging/install tool builddep should make sure the file
permissions are set correctly and not just derived from a value that is
never checked.

This patch derives the "r" and "x" bits for all files from the file
owner, all directories in the package will be 755.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/package/builddeb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 86e56fe..615e0ed 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -26,6 +26,11 @@ create_package() {
 	# Fix ownership and permissions
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
+	# in case we are in a restrictive umask environment like 0077
+	# set permissions for dirs and derive "go"-"rx" permissions from "u"
+	find $pdir -type d -exec chmod 0755 {} +
+	find $pdir -type f -perm -u+r -exec chmod go+r {} +
+	find $pdir -type f -perm -u+x -exec chmod go+x {} +
 
 	# Create the package
 	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch}" -p$pname -P"$pdir"
-- 
2.7.3

