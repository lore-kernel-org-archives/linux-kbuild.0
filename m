Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:46825 "EHLO
	viridian.itc.Virginia.EDU" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755460Ab2HINcY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 09:32:24 -0400
From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 4/4] localmodconfig: use my variable for loop in streamline_config.pl
Date: Thu,  9 Aug 2012 09:23:23 -0400
Message-Id: <1344518603-19508-5-git-send-email-wfp5p@virginia.edu>
In-Reply-To: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
References: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: rostedt@goodmis.org

perlcritic complains about $kconfig being reused in the foreach loop
at the end of read_kconfig.  Change it to a my variable.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 22b66ca..39b6314 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -252,7 +252,7 @@ sub read_kconfig {
     close($kinfile);
 
     # read in any configs that were found.
-    foreach $kconfig (@kconfigs) {
+    foreach my $kconfig (@kconfigs) {
 	if (!defined($read_kconfigs{$kconfig})) {
 	    $read_kconfigs{$kconfig} = 1;
 	    read_kconfig($kconfig);
-- 
1.7.11.3

