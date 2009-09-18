Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:48506 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752739AbZIRTuL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2009 15:50:11 -0400
Message-Id: <200909181949.n8IJnPLf018952@imap1.linux-foundation.org>
Subject: [patch 05/18] checkincludes.pl: close file as soon as we're done with it
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:49:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
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
