Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:39367 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752708AbeFHVxm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 17:53:42 -0400
Date: Fri, 8 Jun 2018 23:53:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] kconfig: fix localmodconfig
Message-ID: <20180608215338.GA28473@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kevin Locke <kevin@kevinlocke.name>, Andrei Vagin <avagin@virtuozzo.com>

From 47857284fd19ef953e3beb7338154924a74b62d2 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 8 Jun 2018 23:48:31 +0200
Subject: [PATCH 1/1] kconfig: fix localmodconfig

When kconfig syntax moved to use $(FOO) for environment variables
localmodconfig was not updated.
Fix so it now works with the new syntax $(FOO)

Fixes: 104daea149c45cc84842ce77a9bd6436d19f3dd8 ("kconfig: reference environment variables directly and remove 'option env='")
Reported-by: Kevin Locke <kevin@kevinlocke.name>
Reported-by: Andrei Vagin <avagin@virtuozzo.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/streamline_config.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index a2e83ab17de3..4686531e2f8c 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -165,10 +165,10 @@ sub read_kconfig {
     my $last_source = "";
 
     # Check for any environment variables used
-    while ($source =~ /\$(\w+)/ && $last_source ne $source) {
+    while ($source =~ /\$\((\w+)\)/ && $last_source ne $source) {
 	my $env = $1;
 	$last_source = $source;
-	$source =~ s/\$$env/$ENV{$env}/;
+	$source =~ s/\$\($env\)/$ENV{$env}/;
     }
 
     open(my $kinfile, '<', $source) || die "Can't open $kconfig";
-- 
2.12.0

