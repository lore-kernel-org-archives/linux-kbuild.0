Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from byss.tchmachines.com ([208.76.80.75]:34597 "EHLO
	byss.tchmachines.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885AbZBVSy7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Feb 2009 13:54:59 -0500
Date: Sun, 22 Feb 2009 10:54:55 -0800
From: Josh Hunt <josh@scalex86.org>
Subject: [PATCH] Fix mkspec to cleanup RPM_BUILD_ROOT
Message-ID: <20090222185455.GB17685@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kiran@scalex86.org, mingo@elte.hu

The contents of the %clean section in mkspec is currently commented
out leaving RPM_BUILD_ROOT and its contents on the build machine.
This patch removes it once the rpm build process is complete.

Signed-off-by: Josh Hunt <josh@scalex86.org>
---

Index: linux-2.6/scripts/package/mkspec
===================================================================
--- linux-2.6.orig/scripts/package/mkspec       2009-02-20
15:51:22.000000000 -0800
+++ linux-2.6/scripts/package/mkspec    2009-02-20 16:06:32.000000000
-0800
@@ -96,7 +96,7 @@ echo "%endif"
 
 echo ""
 echo "%clean"
-echo '#echo -rf $RPM_BUILD_ROOT'
+echo 'rm -rf $RPM_BUILD_ROOT'
 echo ""
 echo "%files"
 echo '%defattr (-, root, root)'

