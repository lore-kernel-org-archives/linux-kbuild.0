Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:41170 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752577AbZGPJXA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Jul 2009 05:23:00 -0400
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com ([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1MRNB5-0002PT-8k
	for linux-kbuild@vger.kernel.org; Thu, 16 Jul 2009 05:22:59 -0400
Date: Thu, 16 Jul 2009 05:20:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD:  Combine config and %config targets.
Message-ID: <alpine.LFD.2.00.0907160519001.11423@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Since the rules appear to be identical, might as well combine the
targets of config and %config in the same rule.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  AFAICT, there seems to be no reason to keep these as separate rules
since they are identical.


diff --git a/Makefile b/Makefile
index be0abac..cea9a7d 100644
--- a/Makefile
+++ b/Makefile
@@ -443,11 +443,7 @@ ifeq ($(config-targets),1)
 include $(srctree)/arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG

-config: scripts_basic outputmakefile FORCE
-	$(Q)mkdir -p include/linux include/config
-	$(Q)$(MAKE) $(build)=scripts/kconfig $@
-
-%config: scripts_basic outputmakefile FORCE
+config %config: scripts_basic outputmakefile FORCE
 	$(Q)mkdir -p include/linux include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================
