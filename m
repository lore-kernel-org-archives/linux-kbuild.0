Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dd12738.kasserver.com ([85.13.134.246]:45025 "EHLO
	dd12738.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751635Ab1EXUkK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 May 2011 16:40:10 -0400
Received: from dd12738.kasserver.com (dd0800.kasserver.com [85.13.143.204])
	by dd12738.kasserver.com (Postfix) with SMTP id CF171D602BD
	for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2011 22:29:35 +0200 (CEST)
Subject: kernel=?UTF-8?B?IA==?=build=?UTF-8?B?IA==?=issue=?UTF-8?B?IA==?=whith=?UTF-8?B?ICI=?=make=?UTF-8?B?IA==?=tar-pkg=?UTF-8?B?IiA=?=with=?UTF-8?B?IA==?=INSTALL=?UTF-8?B?Xw==?=FW=?UTF-8?B?Xw==?=PATH=?UTF-8?B?IFs=?=patch=?UTF-8?B?IA==?=included=?UTF-8?B?XQ==?=
from: "Maximilian Pasternak" <m.kbuild@bluescreen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20110524202935.CF171D602BD@dd12738.kasserver.com>
Date: Tue, 24 May 2011 22:29:35 +0200 (CEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,

i sent this some time ago to "linux-kernel" but did not get an answer
so i try it again - hopefully this is the right list.

I found "make tar-pkg" with set INSTALL_FW_PATH does not work like expected.

Initial situation:
------------------
building a kernel package with
| make tar-pkg INSTALL_FW_PATH=/somewhere


Expected result:
----------------
* tar-archive including the firmware in folder /somehere


Result:
-------
* tar-archive without firmware
* firmware on hd in folder /somewhere


Reason:
-------
Makefile:
| # Firmware install
| INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware
| export INSTALL FW PATH
 ...
| firmware_install: FORCE
| @mkdir -p $(objtree)/firmware
| $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.fwinst obj=firmware
__fw_install

Here INSTALL_MOD_PATH is not considered but is needed for packageing.


Potential fix:
--------------

--- BEGIN PATCH -------------------------------------------------------
diff -ur linux-2.6.38_orig/Makefile linux-2.6.38/Makefile
--- linux-2.6.38_orig/Makefile 2011-03-13 18:24:19.000000000 +0200
+++ linux-2.6.38/Makefile 2011-03-13 18:31:05.000000000 +0200
@@ -1028,8 +1028,9 @@

#
---------------------------------------------------------------------------
# Firmware install
-INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware
-export INSTALL_FW_PATH
+INSTALL_FW_PATH=/lib/firmware
+INSTALL_FW_TO_PATH=$(INSTALL_MOD_PATH)$(INSTALL_FW_PATH)
+export INSTALL_FW_TO_PATH

PHONY += firmware_install
firmware_install: FORCE
diff -ur linux-2.6.38_orig/scripts/Makefile.fwinst
linux-2.6.38/scripts/Makefile.fwinst
--- linux-2.6.38_orig/scripts/Makefile.fwinst 2011-03-13
18:25:47.000000000 +0200
+++ linux-2.6.38/scripts/Makefile.fwinst 2011-03-13
18:29:38.000000000 +0200
@@ -24,14 +24,14 @@
mod-fw += $(fw-shipped-y)
endif

-installed-mod-fw := $(addprefix $(INSTALL_FW_PATH)/,$(mod-fw))
+installed-mod-fw := $(addprefix $(INSTALL_FW_TO_PATH)/,$(mod-fw))

-installed-fw := $(addprefix $(INSTALL_FW_PATH)/,$(fw-shipped-all))
-installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/.
+installed-fw := $(addprefix $(INSTALL_FW_TO_PATH)/,$(fw-shipped-all))
+installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_TO_PATH)/.

# Workaround for make < 3.81, where .SECONDEXPANSION doesn't work.
-PHONY += $(INSTALL_FW_PATH)/$$(%) install-all-dirs
-$(INSTALL_FW_PATH)/$$(%): install-all-dirs
+PHONY += $(INSTALL_FW_TO_PATH)/$$(%) install-all-dirs
+$(INSTALL_FW_TO_PATH)/$$(%): install-all-dirs
@true
install-all-dirs: $(installed-fw-dirs)
@true
@@ -42,7 +42,7 @@
$(installed-fw-dirs):
$(call cmd,mkdir)

-$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% |
$(INSTALL_FW_PATH)/$$(dir %)
+$(installed-fw): $(INSTALL_FW_TO_PATH)/%: $(obj)/% |
$(INSTALL_FW_TO_PATH)/$$(dir %)
$(call cmd,install)

PHONY += __fw_install __fw_modinst FORCE
--- END PATCH ---------------------------------------------------------


Thank you

Maximilian




