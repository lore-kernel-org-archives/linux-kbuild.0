Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:52579 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932120AbbGTFNW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jul 2015 01:13:22 -0400
Received: from /spool/local
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <sam.bobroff@au1.ibm.com>;
	Mon, 20 Jul 2015 15:13:19 +1000
From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Subject: [PATCH v2 1/1] merge_config.sh: exit on missing input files
Date: Mon, 20 Jul 2015 15:12:19 +1000
Message-Id: <400239d8e6d962b6bb752136ac9eef704f1eb31f.1437369135.git.sam.bobroff@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

Add a check for the existence of input files and exit (with failure)
if they are missing.

Without this additional check, missing files produce error messages
but still result in an output file being generated and a successful
exit code.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
The current behaviour (of continuing to run with missing files) seems
like a bug to me, and I've prepared the patch with what seems to be
the safest fix: adding a test to explicitly check for file existence.

Additionally, it seems like it might be a good idea (either with or
without this patch) to add "set -e" to the script because this patch
only handles missing files, not other errors (which will currently be
ignored and return a successful exit code). Should I add this to the
patch?

This can be tested using the top level pseries_le_defconfig target and
removing arch/powerpc/configs/le.config:

$ rm arch/powerpc/configs/le.config
$ make pseries_le_defconfig

Unpatched behaviour:

	Using ../arch/powerpc/configs/pseries_defconfig as base
	Merging ../arch/powerpc/configs/le.config
	sed: can't read ../arch/powerpc/configs/le.config: No such file or directory
	cat: ../arch/powerpc/configs/le.config: No such file or directory
	#
	# merged configuration written to ./.config (needs make)
	#
	  GEN     ./Makefile
	scripts/kconfig/conf  --olddefconfig Kconfig
	#
	# configuration written to .config
	#

Patched behaviour:

	Using ../arch/powerpc/configs/pseries_defconfig as base
	Merging ../arch/powerpc/configs/le.config
	The merge file '../arch/powerpc/configs/le.config' does not exist.  Exit.
	arch/powerpc/Makefile:289: recipe for target 'pseries_le_defconfig' failed

 scripts/kconfig/merge_config.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index ec8e203..0d883b3 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -100,6 +100,10 @@ cat $INITFILE > $TMP_FILE
 # Merge files, printing warnings on overridden values
 for MERGE_FILE in $MERGE_LIST ; do
 	echo "Merging $MERGE_FILE"
+	if [ ! -r "$MERGE_FILE" ]; then
+		echo "The merge file '$MERGE_FILE' does not exist.  Exit." >&2
+		exit 1
+	fi
 	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
 
 	for CFG in $CFG_LIST ; do
-- 
2.1.4

