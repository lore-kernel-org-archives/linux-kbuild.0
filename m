Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46092 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbfCOQZd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Mar 2019 12:25:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id a22so6781135pgg.13
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2019 09:25:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] Revert "modsign: Abort modules_install when signing fails"
Date: Fri, 15 Mar 2019 09:25:03 -0700
Message-Id: <20190315162503.131510-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Douglas Anderson <dianders@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

This reverts commit caf6fe91ddf62a96401e21e9b7a07227440f4185.

The commit was fine but is no longer needed as of commit 3a2429e1faf4
("kbuild: change if_changed_rule for multi-line recipe").  Let's go
back to using ";" to be consistent.

For some discussion, see:

https://lkml.kernel.org/r/CAK7LNASde0Q9S5GKeQiWhArfER4S4wL1=R_FW8q0++_X3T5=hQ@mail.gmail.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index ff5ca9817a85..0dae402661f3 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -23,7 +23,7 @@ quiet_cmd_modules_install = INSTALL $@
     mkdir -p $(2) ; \
     cp $@ $(2) ; \
     $(mod_strip_cmd) $(2)/$(notdir $@) ; \
-    $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) && \
+    $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
     $(mod_compress_cmd) $(2)/$(notdir $@)
 
 # Modules built outside the kernel source tree go into extra by default
-- 
2.21.0.360.g471c308f928-goog
