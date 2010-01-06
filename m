Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:9527 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754754Ab0AFQJi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jan 2010 11:09:38 -0500
Date: Wed, 6 Jan 2010 17:09:23 +0100 (CET)
From: John Kacur <jkacur@redhat.com>
Subject: [PATCH] Don't mkdir -p include/config in the sourcetree when using
 O=outputdir option
Message-ID: <alpine.LFD.2.00.1001061705140.3744@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

From ee63a191e50a33f6c47a00dc8f69b009a5406890 Mon Sep 17 00:00:00 2001
From: John Kacur <jkacur@redhat.com>
Date: Wed, 6 Jan 2010 16:18:02 +0100
Subject: [PATCH] Don't mkdir -p include/config in the sourcetree when using O=outputdir option

Problem: When using the option to put output files in a separate directory, make oldconfig (or related steps like silentoldconfig) create the include/config dierectory in the source tree. This causes the prepare3 check to fail, requiring the user to run make mrproper in the source tree to continue with the make.

Solution: Add the $(objtree) directory to the %config target.

The following is an example of how the Makefile currently can fail.
[jkacur@tycho rt.linux.git]$ make mrproper
[jkacur@tycho rt.linux.git]$ mkdir /bld/2.6.33-rc3
[jkacur@tycho rt.linux.git]$ cp /bld/config /bld/2.6.33-rc3/.config
[jkacur@tycho rt.linux.git]$ make O=/bld/2.6.33-rc3/ oldconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/docproc
  HOSTCC  scripts/basic/hash
  GEN     /bld/2.6.33-rc3/Makefile
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/kxgettext.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf -o arch/x86/Kconfig
[jkacur@tycho rt.linux.git]$ make O=/bld/2.6.33-rc3/
  GEN     /bld/2.6.33-rc3/Makefile
scripts/kconfig/conf -s arch/x86/Kconfig
  Using /home/jkacur/rt.linux.git as source for kernel
  /home/jkacur/rt.linux.git is not clean, please run 'make mrproper'
  in the '/home/jkacur/rt.linux.git' directory.
make[1]: *** [prepare3] Error 1
make: *** [sub-make] Error 2
[jkacur@tycho rt.linux.git]$ ls -ld include/config/
drwxrwxr-x 2 jkacur jkacur 6 2010-01-06 15:58 include/config/

Signed-off-by: John Kacur <jkacur@redhat.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1231094..7d8d722 100644
--- a/Makefile
+++ b/Makefile
@@ -458,7 +458,7 @@ config: scripts_basic outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 %config: scripts_basic outputmakefile FORCE
-	$(Q)mkdir -p include/linux include/config
+	$(Q)mkdir -p $(objtree)/include/linux include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 else
-- 
1.6.0.6

