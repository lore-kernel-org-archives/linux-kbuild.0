Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40503 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750864AbeBPUXe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 15:23:34 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 3/3] checkpatch: kconfig: prefer 'help' over '---help---'
Date: Fri, 16 Feb 2018 21:22:55 +0100
Message-Id: <20180216202255.25307-4-ulfalizer@gmail.com>
In-Reply-To: <20180216202255.25307-1-ulfalizer@gmail.com>
References: <20180216202255.25307-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: apw@canonical.com, joe@perches.com
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

IMO, we should discourage '---help---' for new help texts, even in cases
where it would be consistent with other help texts in the file. This
will help if we ever want to get rid of '---help---' in the future.

Also simplify the code to only check for exactly '---help---'. Since
commit c2264564df3d ("kconfig: warn of unhandled characters in Kconfig
commands"), '---help---' is a proper keyword and can only appear in that
form. Prior to that commit, '---help---' working was more of a syntactic
quirk.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/checkpatch.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 54b782fab4fd..2784f6ab309f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2817,7 +2817,11 @@ sub process {
 
 				if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
 					$is_start = 1;
-				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:---)?help(?:---)?$/) {
+				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
+					if ($lines[$ln - 1] =~ "---help---") {
+						WARN("CONFIG_DESCRIPTION",
+						     "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
+					}
 					$length = -1;
 				}
 
-- 
2.14.1

