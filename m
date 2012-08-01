Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:53929 "EHLO
	hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752871Ab2HAC5J (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Jul 2012 22:57:09 -0400
Received: from homiemail-a52.g.dreamhost.com (caibbdcaaaaf.dreamhost.com [208.113.200.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 6C0F1DF6A5
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Jul 2012 19:57:09 -0700 (PDT)
Message-ID: <50189ADA.4050009@shealevy.com>
Date: Tue, 31 Jul 2012 22:56:26 -0400
From: Shea Levy <shea@shealevy.com>
MIME-Version: 1.0
Subject: [PATCH] Fix firmware installation for images w/o subdirs
Content-Type: multipart/mixed;
 boundary="------------090903070902080200010400"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------090903070902080200010400
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On some setups (probably due to too new a GNU Make), firmware
installation fails with
*** No rule to make target `lib/firmware/./', needed by 
`lib/firmware/<file>.fw'.  Stop.
when a file in the top-level firmware/ directory is needed.

Original patch idea by Denys Dmytriyenko, see
http://permalink.gmane.org/gmane.linux.embedded.yocto.meta-ti/27

Signed-off-by: Shea Levy <shea@shealevy.com>
---
  scripts/Makefile.fwinst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)



--------------090903070902080200010400
Content-Type: text/x-patch;
 name="0001-Fix-firmware-installation-for-images-w-o-subdirs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Fix-firmware-installation-for-images-w-o-subdirs.patch"

diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
index 6bf8e87..4d908d1 100644
--- a/scripts/Makefile.fwinst
+++ b/scripts/Makefile.fwinst
@@ -27,7 +27,7 @@ endif
 installed-mod-fw := $(addprefix $(INSTALL_FW_PATH)/,$(mod-fw))
 
 installed-fw := $(addprefix $(INSTALL_FW_PATH)/,$(fw-shipped-all))
-installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/.
+installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/./
 
 # Workaround for make < 3.81, where .SECONDEXPANSION doesn't work.
 PHONY += $(INSTALL_FW_PATH)/$$(%) install-all-dirs


--------------090903070902080200010400--
