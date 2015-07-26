Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.sigma-star.at ([95.130.255.111]:14385 "EHLO
	mail.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753074AbbGZWHk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Jul 2015 18:07:40 -0400
From: Richard Weinberger <richard@nod.at>
Subject: [PATCH] localmodconfig: Use Kbuild files too
Date: Mon, 27 Jul 2015 00:06:55 +0200
Message-Id: <1437948415-16290-1-git-send-email-richard@nod.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: rostedt@goodmis.org, artafinde@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>

In kbuild it is allowed to define objects in files named "Makefile"
and "Kbuild".
Currently localmodconfig reads objects only from "Makefile"s and misses
modules like nouveau.

Reported-and-tested-by: Leonidas Spyropoulos <artafinde@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 9cb8522..f3d3fb4 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -137,7 +137,7 @@ my $ksource = ($ARGV[0] ? $ARGV[0] : '.');
 my $kconfig = $ARGV[1];
 my $lsmod_file = $ENV{'LSMOD'};
 
-my @makefiles = `find $ksource -name Makefile 2>/dev/null`;
+my @makefiles = `find $ksource -name Makefile -or -name Kbuild 2>/dev/null`;
 chomp @makefiles;
 
 my %depends;
-- 
2.4.6

