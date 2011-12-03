Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:49195 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752891Ab1LCJYY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Dec 2011 04:24:24 -0500
Received: by wgbdr13 with SMTP id dr13so2933012wgb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Dec 2011 01:24:23 -0800 (PST)
MIME-Version: 1.0
From: Cheng Renquan <crquan@gmail.com>
Date: Sat, 3 Dec 2011 01:24:02 -0800
Message-ID: <CAH5vBdJ=Ws7FvO-KXUmOvg6jTuGCX9mZG77A8-38g1Lh=CchnA@mail.gmail.com>
Subject: [PATCH] headers_install: avoid those .install & ..install.cmd unused files
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>

The modules_install, firmware_install, all install commands
don't generate such hidden unused files under destination;
I think headers_install also should not to generate such .install
& ..install.cmd files;
Usually, we call "make headers_install INSTALL_HDR_PATH=/some/path"
expecting it install just the header files, not those dot files;

The original "call if_changed" could generate ..install.cmd and
together with "touch .install" could make the 2nd time headers_install
quite faster but it's not meaningful here, because we usually only install once;


diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index a57f5bd..b3deff2 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -54,8 +54,7 @@ quiet_cmd_install = INSTALL $(printdir) ($(words
$(all-files))\
         $(PERL) $< $(objtree)/$(obj) $(install) $(SRCARCH) $(objhdr-y); \
         for F in $(wrapper-files); do                                   \
                 echo "\#include <asm-generic/$$F>" > $(install)/$$F;    \
-        done;                                                           \
-        touch $@
+        done

 quiet_cmd_remove = REMOVE  $(unwanted)
       cmd_remove = rm -f $(unwanted-file)
@@ -66,8 +65,7 @@ quiet_cmd_check = CHECK   $(printdir) ($(words
$(all-files)) files)
       cmd_check = for f in $(all-files); do                          \
                   echo "$(install)/$${f}"; done                      \
                   | xargs                                            \
-                  $(PERL) $< $(INSTALL_HDR_PATH)/include $(SRCARCH); \
-	          touch $@
+                  $(PERL) $< $(INSTALL_HDR_PATH)/include $(SRCARCH)

 PHONY += __headersinst __headerscheck

@@ -80,7 +78,7 @@ targets += $(install-file)
 $(install-file): scripts/headers_install.pl $(input-files) FORCE
 	$(if $(unwanted),$(call cmd,remove),)
 	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
-	$(call if_changed,install)
+	$(call cmd,install)

 else
 __headerscheck: $(subdirs) $(check-file)
@@ -88,7 +86,7 @@ __headerscheck: $(subdirs) $(check-file)

 targets += $(check-file)
 $(check-file): scripts/headers_check.pl $(output-files) FORCE
-	$(call if_changed,check)
+	$(call cmd,check)

 endif


-- 
Cheng Renquan (程任全)
