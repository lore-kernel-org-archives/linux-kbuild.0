Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:18091 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758494Ab2FOXZB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Jun 2012 19:25:01 -0400
Message-ID: <1339802699.25903.47.camel@gandalf.stny.rr.com>
Subject: kbuild: Document oldnoconfig to what it really does
From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 15 Jun 2012 19:24:59 -0400
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>

The make target 'oldnoconfig' is a misnomer. It doesn't set new symbols
to 'n', but instead sets it to their default values.

Unfortunately, assuming that it actually did this, broke ktest in some
of its tests. For example, the tests to create a minimum config and even
a config bisect, depends on removing various configs and using
oldnoconfig to get rid of other configs that may have depended on it.

But because some configs that it was trying to disable, were in fact
default enabled, this caused those configs to re-enable and corrupt the
test.

I thought about fixing oldnoconfig, but I'm afraid that people are
already dependent on its current behavior. Instead, I'm just updating
the documentation to state that it sets the new symbols to their default
values and not to 'n'.

Ideally, this would be called, 'olddefconfig' and we have an
'oldnoconfig' that actually disables the new symbols. But it's useless
for me now. If it changed, ktest would need to be consistent between
each version, and that would be to difficult to detect. I'll handle this
issue with ktest with other means.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7966265..da36bde 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -114,7 +114,7 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
-	@echo  '  oldnoconfig     - Same as silentoldconfig but set new symbols to n (unset)'
+	@echo  '  oldnoconfig     - Same as silentoldconfig but sets new symbols to their default value'
 
 # lxdialog stuff
 check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh


