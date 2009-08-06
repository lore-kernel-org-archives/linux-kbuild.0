Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:45071 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752978AbZHFXFE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Aug 2009 19:05:04 -0400
Message-Id: <200908062304.n76N4XMK003222@imap1.linux-foundation.org>
Subject: [patch 6/8] checkincludes.pl: close file as soon as we're done with it
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:04:33 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, lrodriguez@Atheros.comlrodriguez@Atheros.com

From: "Luis R. Rodriguez" <lrodriguez@Atheros.com>

Signed-off-by: Luis R. Rodriguez <lrodriguez@atheros.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/checkincludes.pl |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/checkincludes.pl~checkincludespl-close-file-as-soon-as-were-done-with-it scripts/checkincludes.pl
--- a/scripts/checkincludes.pl~checkincludespl-close-file-as-soon-as-were-done-with-it
+++ a/scripts/checkincludes.pl
@@ -13,12 +13,12 @@ foreach $file (@ARGV) {
 			++$includedfiles{$1};
 		}
 	}
+
+	close(FILE);
 	
 	foreach $filename (keys %includedfiles) {
 		if ($includedfiles{$filename} > 1) {
 			print "$file: $filename is included more than once.\n";
 		}
 	}
-
-	close(FILE);
 }
_
