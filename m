Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fed1rmfepo101.cox.net ([68.230.241.143]:51919 "EHLO
	fed1rmfepo101.cox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405Ab2E1AAu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 May 2012 20:00:50 -0400
From: Eric Nelson <eric.nelson@boundarydevices.com>
Subject: [PATCH V3] checkpatch: check for whitespace before semicolon at EOL
Date: Sun, 27 May 2012 17:00:46 -0700
Message-Id: <1338163246-6727-1-git-send-email-eric.nelson@boundarydevices.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: apw@canonical.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, joe@perches.com, Eric Nelson <eric.nelson@boundarydevices.com>

Requires --strict option during invocation:
	~/linux$ scripts/checkpatch --strict foo.patch

This tests for a bad habits of mine like this:

	return 0 ;

Note that it does allow a special case of a bare semicolon
for empty loops:

	while (foo())
		;

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 scripts/checkpatch.pl |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index faea0ec..2262e1f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2448,6 +2448,13 @@ sub process {
 				     "space prohibited between function name and open parenthesis '('\n" . $herecurr);
 			}
 		}
+
+# check for whitespace before a non-naked semicolon
+		if ($line =~ /^\+.*\S\s+;/) {
+			CHK("SPACING",
+			    "space prohibited before semicolon\n" . $herecurr);
+		}
+
 # Check operator spacing.
 		if (!($line=~/\#\s*include/)) {
 			my $ops = qr{
-- 
1.7.9

