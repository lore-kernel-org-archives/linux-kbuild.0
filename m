Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:34407 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfCHMpN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 07:45:13 -0500
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH v1 4/5] scripts: checkpatch.pl: don't complain that debian/rules is executable
Date: Fri,  8 Mar 2019 13:44:23 +0100
Message-Id: <1552049064-32044-5-git-send-email-info@metux.net>
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, info@metux.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

checkpatch.pl complains when adding executable "debian/rules",
obviously a false alarm. Therefore add an exception for that.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b737ca9..7bcc70a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2576,6 +2576,7 @@ sub process {
 		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
 			my $permhere = $here . "FILE: $realfile\n";
 			if ($realfile !~ m@scripts/@ &&
+			    $realfile !~ "debian/rules" &&
 			    $realfile !~ /\.(py|pl|awk|sh)$/) {
 				ERROR("EXECUTE_PERMISSIONS",
 				      "do not set execute permissions for source files\n" . $permhere);
-- 
1.9.1
