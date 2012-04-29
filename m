Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:53915 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752518Ab2D2IZo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Apr 2012 04:25:44 -0400
Date: Sun, 29 Apr 2012 10:25:42 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: jobserver disabled for make tar*-pkg
Message-ID: <20120429082542.GM27374@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


When I do make -jX tar*-pkg make complains that the job server 
disabled and I should add + to the target rule. I tried this patch,
but the message still happens. Anyone knows where the real target
rule is and can fix it please?

-Andi

(cut'n'pasted, just for illustration)

iff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 87bf080..212ee19 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -105,8 +105,8 @@ clean-dirs += $(objtree)/debian/
 # tarball targets
 # ---------------------------------------------------------------------------
 tar%pkg: FORCE
-       $(MAKE) KBUILD_SRC=
-       $(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
+       +$(MAKE) KBUILD_SRC=
+       +$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
 
 clean-dirs += $(objtree)/tar-install/

-- 
ak@linux.intel.com -- Speaking for myself only.
