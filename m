Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:65175 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756235AbZIKUAd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Sep 2009 16:00:33 -0400
Message-Id: <20090911200035.536991976@goodmis.org>
References: <20090911195849.451244684@goodmis.org>
Date: Fri, 11 Sep 2009 15:59:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 11/15] kconfig: unset IKCONFIG_PROC and clean up nesting
Content-Disposition: inline; filename=0011-kconfig-unset-IKCONFIG_PROC-and-clean-up-nesting.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Dick Streefland <dick@streefland.net>, Stephen Rothwell <sfr@canb.auug.org.au>

From: Steven Rostedt <srostedt@redhat.com>

Due to cut and paste error IKCONFIG was both set and cleared.
It was suppose to be IKCONFIG_PROC to be cleared.

Also cleaned up if nesting.

Reported-by: Alan Jenkins <sourcejedi.lkml@googlemail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 9fa3f81..69b7c3f 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -323,7 +323,7 @@ while(<CIN>) {
 	    # enable IKCONFIG at least as a module
 	    print "CONFIG_IKCONFIG=m\n";
 	    # don't ask about PROC
-	    print "# CONFIG_IKCONFIG is not set\n";
+	    print "# CONFIG_IKCONFIG_PROC is not set\n";
 	} else {
 	    print;
 	}
@@ -333,15 +333,12 @@ while(<CIN>) {
     if (/^(CONFIG.*)=(m|y)/) {
 	if (defined($configs{$1})) {
 	    $setconfigs{$1} = $2;
-	    print;
 	} elsif ($2 eq "m") {
 	    print "# $1 is not set\n";
-	} else {
-	    print;
+	    next;
 	}
-    } else {
-	print;
     }
+    print;
 }
 close(CIN);
 
-- 
1.6.3.3

-- 
