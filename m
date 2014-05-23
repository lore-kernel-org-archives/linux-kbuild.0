Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:33935 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310AbaEWXlv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 May 2014 19:41:51 -0400
Received: by mail-pb0-f43.google.com with SMTP id up15so4808415pbc.2
        for <linux-kbuild@vger.kernel.org>; Fri, 23 May 2014 16:41:50 -0700 (PDT)
From: Kevin Hilman <khilman@linaro.org>
Subject: [PATCH] scripts/dtc: pad DTBs to facilitate later modification
Date: Fri, 23 May 2014 16:41:47 -0700
Message-Id: <1400888507-11637-1-git-send-email-khilman@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linaro-kernel@lists.linaro.org, Nicolas Pitre <nico@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Michal Marek <mmarek@suse.cz>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

By default, add some padding to the DT blobs to facilitate later
patching.

An example need for DTB patching is the need to modifiy the command
line on platforms where ATAGS are not (or cannot) be used to pass the
commandline.  For example, we do not support a big-endian kernel
reading ATAGS from a little-endian u-boot, so the only way to pass a
command line in the DT.

Also, without ATAG support (or if u-boot was built without
CONFIG_INITRD_TAG) the only way to pass an initrd is by adding an
initrd= option to command line (in the DT).

Therefore, to facilitate adding to the DT command line directly in the
DTB, add some padding.

Cc: Nicolas Pitre <nico@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Kevin Hilman <khilman@linaro.org>
---
I kinda pulled 64 bytes out of the air here since it's enough to add
some common things to the commandline like debug, earlyprink
initrd=<addr>,<size>, etc., but I'm certainlly not opposed to more
padding.

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 6a5b0decb797..d7a57c2620f3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -264,7 +264,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
+	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 -p 64 \
 		-i $(dir $<) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
-- 
1.9.2

