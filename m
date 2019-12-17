Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:50927 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfLQERa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:17:30 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kconfig: localmodconfig: fix indentation for closing brace
Date: Tue, 17 Dec 2019 13:16:37 +0900
Message-Id: <20191217041637.29558-2-masahiroy@kernel.org>
In-Reply-To: <20191217041637.29558-1-masahiroy@kernel.org>
References: <20191217041637.29558-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This is the closing brace for the foreach loop. Fix the misleading
indentation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index bbaa1e11a4e9..e2f8504f5a2d 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -372,7 +372,7 @@ if (defined($lsmod_file)) {
 	    $lsmod = "$dir/lsmod";
 	    last;
 	}
-}
+    }
     if (!defined($lsmod)) {
 	# try just the path
 	$lsmod = "lsmod";
-- 
2.17.1
