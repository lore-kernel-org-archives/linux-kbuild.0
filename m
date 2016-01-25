Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv-mh.provo.novell.com ([137.65.248.74]:54245 "EHLO
	prv-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933186AbcAYQpv convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Mon, 25 Jan 2016 11:45:51 -0500
Message-Id: <56A65F4B02000078000CAC75@prv-mh.provo.novell.com>
Date: Mon, 25 Jan 2016 09:45:47 -0700
From: "Jan Beulich" <JBeulich@suse.com>
Subject: scripts/kconfig: allow building with make 3.80 again
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.de>
Cc: mpe@ellerman.id.au, linux-kbuild@vger.kernel.org

Documentation/Changes still lists this as the minimal required version,
so it ought to remain usable for the time being.

Fixes: d2036f30cf ("scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 scripts/kconfig/Makefile |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- 4.5-rc1/scripts/kconfig/Makefile
+++ 4.5-rc1-kconfig-make-3-80/scripts/kconfig/Makefile
@@ -96,13 +96,15 @@ savedefconfig: $(obj)/conf
 defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
 	$< $(silent) --defconfig $(Kconfig)
-else ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
+else
+ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 else
 	@$(kecho) "*** Default configuration is based on target '$(KBUILD_DEFCONFIG)'"
 	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
 endif
+endif
 
 %_defconfig: $(obj)/conf
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)



