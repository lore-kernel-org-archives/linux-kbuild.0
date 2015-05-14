Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:53033 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932480AbbENMgJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 May 2015 08:36:09 -0400
From: Yves-Alexis Perez <corsac@debian.org>
Subject: [PATCH] builddeb: generate a changes file from the build
Date: Thu, 14 May 2015 14:35:08 +0200
Message-Id: <1431606908-20880-1-git-send-email-corsac@debian.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yves-Alexis Perez <corsac@debian.org>

A changes file (also called Debian upload control file) contains
information about binary packages, including the changelog entry, the
maintainer, the package list and the checksums.

It can be used by various Debian tools like dput and dcmd to execute
action on all the build packages at once, for example uploading the
packages to an dedicated Debian repository.
---
 scripts/package/builddeb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 88dbf23..46c2838 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -383,4 +383,7 @@ EOF
 	create_package "$dbg_packagename" "$dbg_dir"
 fi
 
+# Generate a change file
+(cd $KBUILD_OUTPUT; dpkg-genchanges -b > ../linux_${packageversion}_${debarch}.changes)
+
 exit 0
-- 
2.1.4

