Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:44351 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754086Ab0KXAtW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Nov 2010 19:49:22 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH v3] headers_install: check exit status of unifdef
Date: Tue, 23 Nov 2010 19:54:02 -0500
Message-Id: <1290560042-30381-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1290552096-28568-1-git-send-email-vapier@gentoo.org>
References: <1290552096-28568-1-git-send-email-vapier@gentoo.org>
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
v3
	- fix thinko pointed out by Randy

 scripts/headers_install.pl |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
index 4ca3be3..efb3be1 100644
--- a/scripts/headers_install.pl
+++ b/scripts/headers_install.pl
@@ -45,6 +45,13 @@ foreach my $file (@files) {
 	close $in;
 
 	system $unifdef . " $tmpfile > $installdir/$file";
+	# unifdef will exit 0 on success, and will exit 1 when the
+	# file was processed successfully but no changes were made,
+	# so abort only when it's higher than that.
+	my $e = $? >> 8;
+	if ($e > 1) {
+		die "$tmpfile: $!\n";
+	}
 	unlink $tmpfile;
 }
 exit 0;
-- 
1.7.3.2

