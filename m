Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:42261 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757122Ab2IRNnl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Sep 2012 09:43:41 -0400
From: Mark Asselstine <mark.asselstine@windriver.com>
Subject: [PATCH] firmware: fix directory creation rule matching with make 3.80
Date: Tue, 18 Sep 2012 09:36:43 -0400
Message-ID: <1347975403-30332-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <50586B69020000780009C00D@nat28.tlf.novell.com>
References: <50586B69020000780009C00D@nat28.tlf.novell.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, JBeulich@suse.com
Cc: linux-kbuild@vger.kernel.org

commit 6c7080a61fc7 [firmware: fix directory creation rule matching
with make 3.82] broke builds with make 3.80. This is caused by the
literal substitution behaving differently with this version of
make. The following works with make 3.82, 3.81 and 3.80.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Jan I was able to reproduce your error and this change fixes it, can
you try this out? I would prefer to keep things working with the
latest versions of make. I am still looking into any possible
consequences of removing the double dollar sign.

 scripts/Makefile.fwinst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
index c3f69ae..e264fab 100644
--- a/scripts/Makefile.fwinst
+++ b/scripts/Makefile.fwinst
@@ -42,7 +42,7 @@ quiet_cmd_install = INSTALL $(subst $(srctree)/,,$@)
 $(installed-fw-dirs):
 	$(call cmd,mkdir)
 
-$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $$(dir $(INSTALL_FW_PATH)/%)
+$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $(dir $(INSTALL_FW_PATH)/%)
 	$(call cmd,install)
 
 PHONY +=  __fw_install __fw_modinst FORCE
-- 
1.7.9.5

