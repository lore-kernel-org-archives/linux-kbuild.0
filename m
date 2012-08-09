Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:46823 "EHLO
	viridian.itc.Virginia.EDU" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754489Ab2HINcY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 09:32:24 -0400
From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 1/4] localmodconfig: set default value for ksource in streamline_config.pl
Date: Thu,  9 Aug 2012 09:23:20 -0400
Message-Id: <1344518603-19508-2-git-send-email-wfp5p@virginia.edu>
In-Reply-To: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
References: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: rostedt@goodmis.org

Running streamline_config.pl as it's shown it in the comment header,
you will get a warning about $ksource being uninitialized.  This is
because $ksource is set to ARGV[0], but the examples don't require any
arguments.  Fix by setting ksource to . if no ARGV[0] is given.

This also fixes passing a config file to the script.  For example,
without this is if you run streamline_config.pl . config.old, it will
ignore config.old and try to read .config anyway.  With this change it
will read config.old instead of .config -- which appears to be the
intent of the code.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 2fbbbc1d..e3687f9 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -135,7 +135,7 @@ GetOptions("localmodconfig" => \$localmodconfig,
 	   "localyesconfig" => \$localyesconfig);
 
 # Get the build source and top level Kconfig file (passed in)
-my $ksource = $ARGV[0];
+my $ksource = ($ARGV[0] ? $ARGV[0] : '.');
 my $kconfig = $ARGV[1];
 my $lsmod_file = $ENV{'LSMOD'};
 
-- 
1.7.11.3

