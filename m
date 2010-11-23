Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:50252 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751458Ab0KWWVE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Nov 2010 17:21:04 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] headers_install: check exit status of unifdef
Date: Tue, 23 Nov 2010 17:25:42 -0500
Message-Id: <1290551142-18849-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

If unifdef fails for any reason (like segfaulting), we should be aborting
the install steps.  So check its exit status in this unlikely scenario.

Reported-by: Diego Elio Pettenò <flameeyes@gentoo.org>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 scripts/headers_install.pl |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
index 4ca3be3..00856f1 100644
--- a/scripts/headers_install.pl
+++ b/scripts/headers_install.pl
@@ -44,7 +44,8 @@ foreach my $file (@files) {
 	close $out;
 	close $in;
 
-	system $unifdef . " $tmpfile > $installdir/$file";
+	system $unifdef . " $tmpfile > $installdir/$file"
+	    and die "$tmpfile: $!\n";
 	unlink $tmpfile;
 }
 exit 0;
-- 
1.7.3.2

