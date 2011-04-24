Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:44914 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757793Ab1DXX2d (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 24 Apr 2011 19:28:33 -0400
Message-ID: <4DB4B1F9.5040805@verizon.net>
Date: Sun, 24 Apr 2011 19:27:53 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH] kbuild: don't warn about linux/version.h not including itself
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz

This patch makes checkversion.pl not warn that include/linux/version.h
dosen't include itself.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/checkversion.pl |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/checkversion.pl b/scripts/checkversion.pl
index b444e89..b9150c7 100755
--- a/scripts/checkversion.pl
+++ b/scripts/checkversion.pl
@@ -47,7 +47,7 @@ foreach my $file (@ARGV) {
     }
 
     # Report used version IDs without include?
-    if ($fUseVersion && ! $iLinuxVersion) {
+    if ($fUseVersion && ! $iLinuxVersion && $file !~ "include/linux/version.h") {
 	print "$file: $.: need linux/version.h\n";
     }
 
-- 
1.7.5.rc1

