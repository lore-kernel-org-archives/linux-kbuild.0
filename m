Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:39187 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754423Ab3GJTcF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Jul 2013 15:32:05 -0400
Message-ID: <51DDB6BC.5060203@mentor.com>
Date: Wed, 10 Jul 2013 20:32:12 +0100
From: Jim Baxter <jim_baxter@mentor.com>
MIME-Version: 1.0
Subject: Building CONFIG_SAMPLES separately.
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Moseley, Drew" <drew_moseley@mentor.com>

Hi,

I was wondering if there is a reason the modules under the samples
directory only build if you use the command make uImage modules?

I have created a patch so that they compile if you enable CONFIG_SAMPLES
and then build the kernel separately, i.e.
make uImage
make modules

This two step approach is how the kernel is built if you use bitbake in
yocto, currently it does not output the kernel module object file for
the sample modules.

This is the patch I am considering:

diff --git a/Makefile b/Makefile
index 29339b4..1acd69f 100644
--- a/Makefile
+++ b/Makefile
@@ -772,9 +772,6 @@ vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
 ifdef CONFIG_HEADERS_CHECK
        $(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
-ifdef CONFIG_SAMPLES
-       $(Q)$(MAKE) $(build)=samples
-endif
 ifdef CONFIG_BUILD_DOCSRC
        $(Q)$(MAKE) $(build)=Documentation
 endif
@@ -943,6 +940,9 @@ all: modules

 PHONY += modules
 modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
+ifdef CONFIG_SAMPLES
+       $(Q)$(MAKE) $(build)=samples
+endif
        $(Q)$(AWK) '!x[$$0]++'
$(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
        @$(kecho) '  Building modules, stage 2.';
        $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost


Thank you for any help or advice,
Jim Baxter
