Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from que31.charter.net ([209.225.8.23]:41231 "EHLO que31.charter.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751917Ab1F3XuV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Jun 2011 19:50:21 -0400
From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Subject: [PATCH] gitignore: ignore debian build directory
Date: Thu, 30 Jun 2011 18:42:50 -0500
Message-Id: <1309477370-5866-1-git-send-email-Gregory.Dietsche@cuw.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

Have git ignore the Debian directory created when running:
	make deb-pkg

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 .gitignore |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 9dacde0..dc243a6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,6 +46,11 @@ modules.builtin
 /Module.symvers
 
 #
+#Debian directory (make deb-pkg)
+#
+/debian/
+
+#
 # git files that we don't want to ignore even it they are dot-files
 #
 !.gitignore
-- 
1.7.2.5

