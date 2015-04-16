Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:60344 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750753AbbDPVDc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 17:03:32 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Kbuild: Add ID files to .gitignore
Date: Thu, 16 Apr 2015 14:02:41 -0700
Message-Id: <1429218161-12999-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

I use GNU id-utils to find code (essentially a database backed grep),
which generates an ID file to maintain its data.

Add ID to the .gitignore file.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index acb6afe..15766be 100644
--- a/.gitignore
+++ b/.gitignore
@@ -88,6 +88,9 @@ GRTAGS
 GSYMS
 GTAGS
 
+# id-utils files
+ID
+
 *.orig
 *~
 \#*#
-- 
1.9.3

