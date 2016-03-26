Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:23243 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752150AbcCZR3t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Mar 2016 13:29:49 -0400
From: Sasha Levin <sasha.levin@oracle.com>
Subject: [added to the 4.1 stable tree] ld-version: Fix awk regex compile failure
Date: Sat, 26 Mar 2016 13:28:38 -0400
Message-Id: <1459013330-15318-34-git-send-email-sasha.levin@oracle.com>
In-Reply-To: <1459013330-15318-1-git-send-email-sasha.levin@oracle.com>
References: <1459013330-15318-1-git-send-email-sasha.levin@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: stable@vger.kernel.org, stable-commits@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Michal Marek <mmarek@suse.com>, Andi Kleen <ak@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Sasha Levin <sasha.levin@oracle.com>

From: James Hogan <james.hogan@imgtec.com>

This patch has been added to the 4.1 stable tree. If you have any
objections, please let us know.

===============

[ Upstream commit 4b7b1ef2c2f83d702272555e8adb839a50ba0f8e ]

The ld-version.sh script fails on some versions of awk with the
following error, resulting in build failures for MIPS:

awk: scripts/ld-version.sh: line 4: regular expression compile failed (missing '(')

This is due to the regular expression ".*)", meant to strip off the
beginning of the ld version string up to the close bracket, however
brackets have a meaning in regular expressions, so lets escape it so
that awk doesn't expect a corresponding open bracket.

Fixes: ccbef1674a15 ("Kbuild, lto: add ld-version and ld-ifversion ...")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Tested-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: Michal Marek <mmarek@suse.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mips@linux-mips.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org # 4.4.x-
Patchwork: https://patchwork.linux-mips.org/patch/12838/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
---
 scripts/ld-version.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index 198580d..1659b40 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -1,7 +1,7 @@
 #!/usr/bin/awk -f
 # extract linker version number from stdin and turn into single number
 	{
-	gsub(".*)", "");
+	gsub(".*\\)", "");
 	split($1,a, ".");
 	print a[1]*10000000 + a[2]*100000 + a[3]*10000 + a[4]*100 + a[5];
 	exit
-- 
2.5.0

