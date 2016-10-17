Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:52663 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758992AbcJQU2K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2016 16:28:10 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] tags: honor COMPILED_SOURCE with apart output directory
Date: Mon, 17 Oct 2016 22:27:59 +0200
Message-Id: <1476736079-11963-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

When the kernel is compiled with an "O=" argument, the object files are
not necessarily in the source tree, and more probably in another tree.

In this situation, the current used check doesn't work, and
COMPILED_SOURCE tags is broken with O= builds.

This patch fixes it by looking for object files both in source tree and
potential destination tree.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 scripts/tags.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index b3775a9604ea..c0220fa05617 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -106,7 +106,9 @@ all_compiled_sources()
 		case "$i" in
 			*.[cS])
 				j=${i/\.[cS]/\.o}
-				if [ -e $j ]; then
+				k=${i/"$tree"/"$O"\/}
+				k=${k/\.[cS]/\.o}
+				if [ -e $j -o -e "$k" ]; then
 					echo $i
 				fi
 				;;
-- 
2.1.4

