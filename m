Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:41145 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756191AbZIKUAb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Sep 2009 16:00:31 -0400
Message-Id: <20090911200034.376726399@goodmis.org>
References: <20090911195849.451244684@goodmis.org>
Date: Fri, 11 Sep 2009 15:58:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 07/15] kconfig: add check if end exists in extract-ikconfig
Content-Disposition: inline; filename=0007-kconfig-add-check-if-end-exists-in-extract-ikconfig.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Dick Streefland <dick@streefland.net>, Stephen Rothwell <sfr@canb.auug.org.au>

From: Steven Rostedt <srostedt@redhat.com>

Both start and end should be tested for existence before continuing
to parse the config.gz file.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/extract-ikconfig |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/extract-ikconfig b/scripts/extract-ikconfig
index 72997c3..42d6bce 100755
--- a/scripts/extract-ikconfig
+++ b/scripts/extract-ikconfig
@@ -17,6 +17,10 @@ dump_config() {
 	return
     fi
     end=`$binoffset $file $IKCFG_ED 2>/dev/null`
+    [ "$?" != "0" ] && end="-1"
+    if [ "$end" -eq "-1" ]; then
+	return
+    fi
 
     start=`expr $start + 8`
     size=`expr $end - $start`
-- 
1.6.3.3

-- 
