Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:34923 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752000AbZHSDAl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Aug 2009 23:00:41 -0400
Message-Id: <20090819030036.847387453@goodmis.org>
References: <20090819025634.987354707@goodmis.org>
Date: Tue, 18 Aug 2009 22:56:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 04/14] kconfig: streamline_config.pl do not stop with no depends
Content-Disposition: inline; filename=0004-kconfig-streamline_config.pl-do-not-stop-with-no-dep.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Theodore Tso <tytso@mit.edu>, Arjan van de Ven <arjan@infradead.org>, Greg KH <greg@kroah.com>, "Luis R. Rodriguez" <mcgrof@gmail.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>, Alan Jenkins <sourcejedi.lkml@googlemail.com>, Andi Kleen <andi@firstfloor.org>

From: Steven Rostedt <srostedt@redhat.com>

If a config does not have a prompt, it must be selected.
streamline_config.pl keeps track of all configs that select other configs.
If a config that does not have a prompt needs to be set to enable a
current module, it will include all configs that select it.
Note, streamline_config.pl does not enable modules that are not already
enabled. It only keeps enabled those that were enabled and might be
needed to compile the current modules.

The code to find the selects of a config is after the code that
adds the depends. But if a config needed selects but had no dependencies,
it would not be set. Because the code would stop before getting to
the select.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 79d8557..1774905 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -237,13 +237,11 @@ while ($repeat) {
     foreach my $config (keys %configs) {
 	$config =~ s/^CONFIG_//;
 
-	if (!defined($depends{$config})) {
-	    next;
+	if (defined($depends{$config})) {
+	    # This config has dependencies. Make sure they are also included
+	    parse_config_dep_select $depends{$config};
 	}
 
-	# This config has dependencies. Make sure they are also included
-	parse_config_dep_select $depends{$config};
-
 	if (defined($prompt{$config}) || !defined($selects{$config})) {
 	    next;
 	}
-- 
1.6.3.3

-- 
