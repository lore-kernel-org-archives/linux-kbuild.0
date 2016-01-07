Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34838 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751920AbcAGRz1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2016 12:55:27 -0500
Date: Thu, 7 Jan 2016 19:55:24 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] ld-version: fix it on Fedora
Message-ID: <1452189189-31188-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org

On Fedora 23, ld --version outputs:
GNU ld version 2.25-15.fc23

But ld-version.sh fails to parse this, so e.g.  mips build fails to
enable VDSO, printing a warning that binutils >= 2.24 is required.

To fix, teach ld-version to parse this format.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Which tree should this be merged through? Mine? MIPS?

 scripts/ld-version.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index 198580d..25d23c8 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -2,6 +2,8 @@
 # extract linker version number from stdin and turn into single number
 	{
 	gsub(".*)", "");
+	gsub(".*version ", "");
+	gsub("-.*", "");
 	split($1,a, ".");
 	print a[1]*10000000 + a[2]*100000 + a[3]*10000 + a[4]*100 + a[5];
 	exit
-- 
MST
