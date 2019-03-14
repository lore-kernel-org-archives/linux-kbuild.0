Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35303 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfCNR7L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Mar 2019 13:59:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id e17so4515867pgd.2
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Mar 2019 10:59:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] kbuild: If the module stripping command fails the build should abort
Date: Thu, 14 Mar 2019 10:57:05 -0700
Message-Id: <20190314175705.11671-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Douglas Anderson <dianders@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

If the call to strip returns an error code then it makes sense for the
build to fail.  Currently we'll just chug along and ship unstripped
modules.

Fixes: e2a666d52b48 ("kbuild: sign the modules at install time")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index ff5ca9817a85..5d05c43c6f31 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -22,7 +22,7 @@ quiet_cmd_modules_install = INSTALL $@
       cmd_modules_install = \
     mkdir -p $(2) ; \
     cp $@ $(2) ; \
-    $(mod_strip_cmd) $(2)/$(notdir $@) ; \
+    $(mod_strip_cmd) $(2)/$(notdir $@) && \
     $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) && \
     $(mod_compress_cmd) $(2)/$(notdir $@)
 
-- 
2.21.0.360.g471c308f928-goog
