Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40071 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755344Ab2ITObQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Sep 2012 10:31:16 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id BF8D099430
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Sep 2012 16:31:15 +0200 (CEST)
Message-ID: <505B28AE.3050103@suse.de>
Date: Thu, 20 Sep 2012 10:31:10 -0400
From: Jeff Mahoney <jeffm@suse.de>
MIME-Version: 1.0
Subject: [PATCH] x86/kbuild: archscripts depends on scripts_basic
References: <505A02F8.4040804@suse.de> <505A03EC.8090502@linux.intel.com>
In-Reply-To: <505A03EC.8090502@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

While building the SUSE kernel packages, which build the scripts,
make clean, and then build everything, we have been running into spurious
build failures. We tracked them down to a simple dependency issue:

$ make mrproper
  CLEAN   arch/x86/tools
  CLEAN   scripts/basic
$ cp patches/config/x86_64/desktop .config
$ make archscripts
  HOSTCC  arch/x86/tools/relocs
/bin/sh: scripts/basic/fixdep: No such file or directory
make[3]: *** [arch/x86/tools/relocs] Error 1
make[2]: *** [archscripts] Error 2
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2

This was introduced by commit
6520fe55 (x86, realmode: 16-bit real-mode code support for relocs),
which added the archscripts dependency to archprepare.

This patch adds the scripts_basic dependency to the x86 archscripts.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 arch/x86/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -142,7 +142,7 @@ KBUILD_CFLAGS += $(call cc-option,-mno-a
 KBUILD_CFLAGS += $(mflags-y)
 KBUILD_AFLAGS += $(mflags-y)
 -archscripts:
+archscripts: scripts_basic
 	$(Q)$(MAKE) $(build)=arch/x86/tools relocs
  ###

