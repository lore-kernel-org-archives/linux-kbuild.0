Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37478 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758942AbYAXWDw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:52 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 21/77] kbuild: ignore *.order files
Date: Thu, 24 Jan 2008 23:03:02 +0100
Message-Id: <1201212238-4369-21-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Tejun Heo <htejun@gmail.com>

Introducing the new modules.order patch created a number
of additional files. Teach git to ignore them.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Tejun Heo <htejun@gmail.com>
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 8d14531..8363e48 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,6 +17,7 @@
 *.i
 *.lst
 *.symtypes
+*.order
 
 #
 # Top-level generic files
-- 
1.5.4.rc3.14.g44397

