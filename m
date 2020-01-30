Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727247AbgA3RWX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 12:22:23 -0500
Date: Thu, 30 Jan 2020 12:22:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [GIT PULL] kconfig: localmodconfig: Minor clean ups to
 streamline_config.pl
Message-ID: <20200130122221.30029e32@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>


Linus,

Just a couple of clean ups to streamline_config.pl


Please pull the latest localmodconfig-v5.6 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
localmodconfig-v5.6

Tag SHA1: ae4a98169606cf4b84bce31c4ec0003da8dd60e6
Head SHA1: 37bf46aae4acb76e7cc0fb4d1131ece682f456d4


Masahiro Yamada (2):
      kconfig: localmodconfig: Remove unused $config
      kconfig: localmodconfig: Fix indentation for closing brace

----
 scripts/kconfig/streamline_config.pl | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
---------------------------
diff --git a/scripts/kconfig/streamline_config.pl
b/scripts/kconfig/streamline_config.pl index 08d76d7b3b81..e2f8504f5a2d
100755 --- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -56,8 +56,6 @@ sub dprint {
     print STDERR @_;
 }
 
-my $config = ".config";
-
 my $uname = `uname -r`;
 chomp $uname;
 
@@ -374,7 +372,7 @@ if (defined($lsmod_file)) {
 	    $lsmod = "$dir/lsmod";
 	    last;
 	}
-}
+    }
     if (!defined($lsmod)) {
 	# try just the path
 	$lsmod = "lsmod";
