Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:30259 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757185Ab2JEUwv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Oct 2012 16:52:51 -0400
Message-ID: <1349470370.6755.74.camel@gandalf.local.home>
Subject: [PATCH] localmodconfig: Document localmodconfig in README
From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 05 Oct 2012 16:52:50 -0400
Content-Type: text/plain; charset="ISO-8859-15"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

Someone (over a year ago :-p) asked me to document localmodconfig in the
README file in the source code. I thought it was a good idea but other
things were more important and I simply forgot about it. Well, I
stumbled on the email asking me about this and I'm sending it out now.

Signed-off-by: Steven "Mr. Procrastinator" Rostedt <rostedt@goodmis.org>

diff --git a/README b/README
index 9beaed0..4d80e18 100644
--- a/README
+++ b/README
@@ -206,6 +206,24 @@ CONFIGURING the kernel:
      "make randconfig"  Create a ./.config file by setting symbol
                         values to random values.
 
+     "make localmodconfig" Create a config based on current config and
+                           loaded modules (lsmod). Disables any module
+                           option that is not needed for the loaded modules.
+
+                           To create a localmodconfig for another machine,
+                           store the lsmod of that machine into a file
+                           and pass it in as a LSMOD parameter.
+
+                   target$ lsmod > /tmp/mylsmod
+                   target$ scp /tmp/mylsmod host:/tmp
+
+                   host$ make LSMOD=/tmp/mylsmod localmodconfig
+
+                           The above also works when cross compiling.
+
+     "make localyesconfig" Similar to localmodconfig, except it will convert
+                           all module options to built in (=y) options.
+
    You can find more information on using the Linux kernel config tools
    in Documentation/kbuild/kconfig.txt.
 


