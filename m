Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:51175 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfLQERk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:17:40 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kconfig: localmodconfig: remove unused $config
Date: Tue, 17 Dec 2019 13:16:36 +0900
Message-Id: <20191217041637.29558-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This is unused since commit cdfc47950a53 ("kconfig: search for a config
to base the local(mod|yes)config on").

Having unused $config is confusing because $config is used as a local
variable in various sub-routines.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/streamline_config.pl | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 08d76d7b3b81..bbaa1e11a4e9 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -56,8 +56,6 @@ sub dprint {
     print STDERR @_;
 }
 
-my $config = ".config";
-
 my $uname = `uname -r`;
 chomp $uname;
 
-- 
2.17.1
