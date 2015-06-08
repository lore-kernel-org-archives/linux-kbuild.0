Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35149 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753322AbbFHUTd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jun 2015 16:19:33 -0400
From: Jim Davis <jim.epost@gmail.com>
Subject: [PATCH] scripts/package/Makefile: rpmbuild is needed for rpm targets
Date: Mon,  8 Jun 2015 13:19:08 -0700
Message-Id: <1433794748-6570-1-git-send-email-jim.epost@gmail.com>
In-Reply-To: <CA+r1ZhiyQbakrxr4saPE_mFjwjGG4aJxLHm3oCvqD=4=ByBA_w@mail.gmail.com>
References: <CA+r1ZhiyQbakrxr4saPE_mFjwjGG4aJxLHm3oCvqD=4=ByBA_w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jim Davis <jim.epost@gmail.com>

Before rpm release 4.1, in 2002, either the rpm command or the
rpmbuild command could be used in the rpm-pkg or binrpm-pkg targets,
and the Makefile chose the rpm command if the rpmbuild command wasn't
found.

After release 4.1, however, the rpm command could no longer be used in
place of the rpmbuild command.  As the rpmbuild command is not
installed by default, this can lead to failures with the rpm-pkg and
binrpm-pkg targets:

rpm --define "_builddir ." --target \
    x86_64 -bb ./binkernel.spec
    rpm --target: unknown option
    scripts/package/Makefile:60: recipe for target 'binrpm-pkg' failed

Change the Makefile to use rpmbuild unconditionally to avoid this.

Signed-off-by: Jim Davis <jim.epost@gmail.com>
---
 scripts/package/Makefile | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 99ca6e7..8b11d5a 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -21,10 +21,6 @@
 # Note that the rpm-pkg target cannot be used with KBUILD_OUTPUT,
 # but the binrpm-pkg target can; for some reason O= gets ignored.

-# Do we have rpmbuild, otherwise fall back to the older rpm
-RPM := $(shell if [ -x "/usr/bin/rpmbuild" ]; then echo rpmbuild; \
-	           else echo rpm; fi)
-
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
 # Include only those top-level files that are needed by make, plus the GPL copy
@@ -51,7 +47,7 @@ rpm-pkg rpm: FORCE
 	rm -f $(objtree)/.scmversion
 	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
-	$(RPM) $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
+	rpmbuild --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
 	rm $(KERNELPATH).tar.gz kernel.spec

 # binrpm-pkg
@@ -62,7 +58,7 @@ binrpm-pkg: FORCE
 	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
 	mv -f $(objtree)/.tmp_version $(objtree)/.version

-	$(RPM) $(RPMOPTS) --define "_builddir $(objtree)" --target \
+	rpmbuild --define "_builddir $(objtree)" --target \
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 	rm binkernel.spec

--
2.4.2
