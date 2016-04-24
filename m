Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36120 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752818AbcDXQnE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 24 Apr 2016 12:43:04 -0400
Received: by mail-wm0-f66.google.com with SMTP id w143so15468465wmw.3
        for <linux-kbuild@vger.kernel.org>; Sun, 24 Apr 2016 09:43:03 -0700 (PDT)
From: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Subject: [PATCH] scripts/tags.sh: Exit gracefully if *tags tool not found
Date: Sun, 24 Apr 2016 18:42:00 +0200
Message-Id: <1461516120-5600-1-git-send-email-eugeniu.m.rosca@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, mpe@ellerman.id.au, kirill.shutemov@linux.intel.com, naveen.n.rao@linux.vnet.ibm.com, akpm@linux-foundation.org, sboyd@codeaurora.org, paul.gortmaker@windriver.com
Cc: linux-kbuild@vger.kernel.org, Eugeniu Rosca <eugeniu.m.rosca@gmail.com>

If the needed host utility is not found, current behavior is:

$> make cscope
  GEN     cscope
./scripts/tags.sh: line 140: cscope: command not found
$> make gtags
  GEN     gtags
./scripts/tags.sh: line 145: gtags: command not found
$> make tags
  GEN     tags
xargs: ctags: No such file or directory
sed: can't read tags: No such file or directory
Makefile:1509: recipe for target 'tags' failed
make: *** [tags] Error 2
$> make TAGS
  GEN     TAGS
xargs: etags: No such file or directory
sed: can't read TAGS: No such file or directory
Makefile:1509: recipe for target 'TAGS' failed
make: *** [TAGS] Error 2

This patch allows to exit gracefully in such a situation:

$> make cscope
  GEN     cscope
cscope - not installed?
$> make gtags
  GEN     gtags
gtags - not installed?
$> make tags
  GEN     tags
ctags - not installed?
$> make TAGS
  GEN     TAGS
etags - not installed?

Signed-off-by: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
---
 scripts/tags.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index f72f48f..e7f6125 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -289,6 +289,13 @@ xtags()
 	fi
 }
 
+# Check if a specific utility is accessible on the host
+tool_exists() {
+	[ -x "$(which $1 2> /dev/null)" ] || \
+		{ echo "$1 - not installed?" && return 1; }
+	return 0
+}
+
 # Support um (which uses SUBARCH)
 if [ "${ARCH}" = "um" ]; then
 	if [ "$SUBARCH" = "i386" ]; then
@@ -318,20 +325,24 @@ fi
 remove_structs=
 case "$1" in
 	"cscope")
+		tool_exists cscope || exit 0
 		docscope
 		;;
 
 	"gtags")
+		tool_exists gtags || exit 0
 		dogtags
 		;;
 
 	"tags")
+		tool_exists ctags || exit 0
 		rm -f tags
 		xtags ctags
 		remove_structs=y
 		;;
 
 	"TAGS")
+		tool_exists etags || exit 0
 		rm -f TAGS
 		xtags etags
 		remove_structs=y
-- 
2.7.4

