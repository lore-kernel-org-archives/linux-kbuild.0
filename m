Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:37282 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751338AbdFEMAd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jun 2017 08:00:33 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v3] tags: honor COMPILED_SOURCE with apart output directory
Date: Mon,  5 Jun 2017 13:59:15 +0200
Message-Id: <1496663955-8499-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

When the kernel is compiled with an "O=" argument, the object files are
not necessarily in the source tree, and more probably in another tree.

In this situation, the current used check doesn't work, and
COMPILED_SOURCE tags is broken with O= builds.

This patch fixes it by looking for object files both in source tree and
potential destination tree.

It was verified that in the case of O= usage, the current directory is
the build tree, ie. the tree referenced by O=xxx, and j is the source
tree path concatenated with relative path of the object to the source
tree root, hence the simple expression to compute "k" as the built
object.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
Since v1: amended k expression, Marek's comments
Since v2: removed k from Masahiro's comments
---
 scripts/tags.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index a2ff3388e5ea..2a61db329adf 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -106,6 +106,7 @@ all_compiled_sources()
 		case "$i" in
 			*.[cS])
 				j=${i/\.[cS]/\.o}
+				j="${j#$tree}"
 				if [ -e $j ]; then
 					echo $i
 				fi
-- 
2.1.4

