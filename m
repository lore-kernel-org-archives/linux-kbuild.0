Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:61181 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932545AbcCHQsd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Mar 2016 11:48:33 -0500
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] ld-version: Fix awk regex compile failure
Date: Tue, 8 Mar 2016 16:47:53 +0000
Message-ID: <1457455673-12219-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>, Michal Marek <mmarek@suse.com>, Andi Kleen <ak@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Hogan <james.hogan@imgtec.com>, "Michael S. Tsirkin" <mst@redhat.com>, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

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
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Michal Marek <mmarek@suse.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # 4.4.x-
---
I've only tested this with GNU Awk 4.0.2, which seems a bit more
lenient than whatever version of awk Geert's build machine is using.

I'd appreciated if somebody experiencing the error could give this patch
a spin to check it fixes it.
---
 scripts/ld-version.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index d154f0877fd8..7bfe9fa1c8dc 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -1,7 +1,7 @@
 #!/usr/bin/awk -f
 # extract linker version number from stdin and turn into single number
 	{
-	gsub(".*)", "");
+	gsub(".*\\)", "");
 	gsub(".*version ", "");
 	gsub("-.*", "");
 	split($1,a, ".");
-- 
2.4.10

