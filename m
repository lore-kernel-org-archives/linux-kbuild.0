Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from thoth.sbs.de ([192.35.17.2]:50987 "EHLO thoth.sbs.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753518AbcGVMq7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Jul 2016 08:46:59 -0400
From: Henning Schild <henning.schild@siemens.com>
Subject: [PATCHv2] builddeb: fix file permissions before packaging
Date: Fri, 22 Jul 2016 14:46:52 +0200
Message-Id: <1469191612-21934-1-git-send-email-henning.schild@siemens.com>
In-Reply-To: <57920E64.2030502@suse.com>
References: <57920E64.2030502@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Henning Schild <henning.schild@siemens.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Builddep is not very explicit about file permissions. Actually the file
permissions in the package are largely influenced by the umask of the
user cloning the git and building the package. If that umask does not
set go+r the resulting linux-headers package will prevent non-root users
from building out-of-tree modules. And that is probably just one
unexpected effect.
Being a packaging/install tool builddep should make sure the file
permissions are set correctly and not just derived from a value that is
never checked.

This patch sets ugo read permissions for all packaged files and derives
the executable bit for directories and executables from the file-owner.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/package/builddeb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 86e56fe..f72ba49 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -26,6 +26,8 @@ create_package() {
 	# Fix ownership and permissions
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
+	# in case we are in a restrictive umask environment like 0077
+	chmod -R a+rX "$pdir"
 
 	# Create the package
 	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch}" -p$pname -P"$pdir"
-- 
2.7.3

