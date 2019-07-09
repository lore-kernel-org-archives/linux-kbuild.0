Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:53545 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfGIJc4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:56 -0400
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 3/4] scripts: checkpatch.pl: don't complain that debian/rules is executable
Date: Tue,  9 Jul 2019 11:32:38 +0200
Message-Id: <1562664759-16009-3-git-send-email-info@metux.net>
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
References: <1562664759-16009-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, info@metux.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com

checkpatch.pl complains when adding executable "debian/rules",
obviously a false alarm. Therefore add an exception for that.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 342c7c7..caf0146 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2587,6 +2587,7 @@ sub process {
 		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
 			my $permhere = $here . "FILE: $realfile\n";
 			if ($realfile !~ m@scripts/@ &&
+			    $realfile !~ "debian/rules" &&
 			    $realfile !~ /\.(py|pl|awk|sh)$/) {
 				ERROR("EXECUTE_PERMISSIONS",
 				      "do not set execute permissions for source files\n" . $permhere);
-- 
1.9.1
