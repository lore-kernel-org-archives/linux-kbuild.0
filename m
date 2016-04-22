Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f44.google.com ([209.85.192.44]:35012 "EHLO
	mail-qg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932333AbcDVRsw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2016 13:48:52 -0400
Received: by mail-qg0-f44.google.com with SMTP id f74so56373324qge.2
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Apr 2016 10:48:51 -0700 (PDT)
Date: Fri, 22 Apr 2016 13:48:48 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next: Tree for Apr 22 (adjust_autoksyms.sh)
In-Reply-To: <571A56C4.7030907@infradead.org>
Message-ID: <alpine.LFD.2.20.1604221345340.27452@knanqh.ubzr>
References: <20160422153503.24aa389e@canb.auug.org.au> <571A56C4.7030907@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Fri, 22 Apr 2016, Randy Dunlap wrote:

> on x86_64:
> 
> I'm seeing:
> 
> /bin/sh: scripts/adjust_autoksyms.sh: No such file or directory
> /local/lnx/next/linux-next-20160422/Makefile:937: recipe for target 'vmlinux' failed
> 
> when using O=subdir for the build output directory.
> 
> 
> Is there a missing $(objtree) somewhere?

Rather a $(srctree).  Please try the patch below.

----- >8

Subject: [PATCH] kbuild: fix CONFIG_TRIM_UNUSED_KSYMS=y with a separate output  directory

This fixes the following:

/bin/sh: scripts/adjust_autoksyms.sh: No such file or directory

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/Makefile b/Makefile
index e3af48068c..e9ad498238 100644
--- a/Makefile
+++ b/Makefile
@@ -934,7 +934,7 @@ quiet_cmd_link-vmlinux = LINK    $@
 # execute if the rest of the kernel build went well.
 vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
 	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
 endif
 ifdef CONFIG_HEADERS_CHECK
@@ -949,13 +949,13 @@ endif
 	+$(call if_changed,link-vmlinux)
 
 autoksyms_recursive: $(vmlinux-deps)
-	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
 	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
 PHONY += autoksyms_recursive
 
 # standalone target for easier testing
 include/generated/autoksyms.h: FORCE
-	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh true
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh true
 
 # Build samples along the rest of the kernel
 ifdef CONFIG_SAMPLES
