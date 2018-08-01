Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36604 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389234AbeHAPoI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Aug 2018 11:44:08 -0400
From: David Howells <dhowells@redhat.com>
Subject: Can we fix samples/ dependency on headers please?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31060.1533131891.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date: Wed, 01 Aug 2018 14:58:11 +0100
Message-ID: <31061.1533131891@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: dhowells@redhat.com, viro@zeniv.linux.org.uk, arnd@arndb.de, sfr@canb.auug.org.au, nico@linaro.org, linux-kernel@vger.kernel.org

Hi,

I'm currently having to mark various userspace programs I've added to the
samples/ directory as BROKEN in samples/Kconfig because the root Makefile
mucks up the dependencies between building samples and headers_install.

The main culprit seems to be:

	commit dd92478a15fa3bfd746ee08b4ef59401c1537804
	Author: Nicolas Pitre <nicolas.pitre@linaro.org>
	Date:   Sun Feb 28 22:00:00 2016 -0500
	kbuild: build sample modules along with the rest of the kernel
 
which make the samples build in parallel with the build, thereby voiding the
explicit dependency:

	Documentation/ samples/: headers_install

and thereby breaking:

	commit ddea05fa148b4d8e66498e522a616d87f9cf81e3
	Author: Arnd Bergmann <arnd@arndb.de>
	Date:   Mon Jul 4 16:39:35 2016 +0200
	kbuild: make samples depend on headers_install

The obvious fix is to revert commit dd92478a15fa3bfd746ee08b4ef59401c1537804
(see attached patch).

David
---
commit 5c186b58db93e2644012e2fcb4c6ca2e74c6754b
Author: David Howells <dhowells@redhat.com>
Date:   Wed Aug 1 14:48:22 2018 +0100

    Revert "kbuild: build sample modules along with the rest of the kernel"
    
    This reverts commit dd92478a15fa3bfd746ee08b4ef59401c1537804.
    
    The problem with this commit is that some of the samples require the header
    installation to occur first, but building them in parallel with the rest of
    the build breaks that requirement.
    
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/Makefile b/Makefile
index ca2af1ab91eb..30fc0a37ad41 100644
--- a/Makefile
+++ b/Makefile
@@ -1009,16 +1009,14 @@ vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
 ifdef CONFIG_HEADERS_CHECK
 	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
+ifdef CONFIG_SAMPLES
+	$(Q)$(MAKE) $(build)=samples
+endif
 ifdef CONFIG_GDB_SCRIPTS
 	$(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)
 endif
 	+$(call if_changed,link-vmlinux)
 
-# Build samples along the rest of the kernel
-ifdef CONFIG_SAMPLES
-vmlinux-dirs += samples
-endif
-
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
