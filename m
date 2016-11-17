Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:32820 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752906AbcKQA2l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Nov 2016 19:28:41 -0500
Received: by mail-qt0-f173.google.com with SMTP id p16so118093614qta.0
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Nov 2016 16:28:41 -0800 (PST)
Date: Wed, 16 Nov 2016 19:28:39 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH] kbuild: cmd_export_list: tighten the sed script
Message-ID: <alpine.LFD.2.20.1611161924280.22196@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


When LTO is used, some ___ksymtab_string sections are seen by this sed
script, creating lines containing a single ) such as:

EXPORT(foo)
)
)
EXPORT(bar)

Let's make it so the + character is also required for any line to be
printed.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 53b43f26bb..3066c8e61d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -428,7 +428,7 @@ endif
 
 quiet_cmd_export_list = EXPORTS $@
 cmd_export_list = $(OBJDUMP) -h $< | \
-	sed -ne '/___ksymtab/{s/.*+/$(ref_prefix)/;s/ .*/)/;p}' >$(ksyms-lds);\
+	sed -ne '/___ksymtab/s/.*+\([^ ]*\).*/$(ref_prefix)\1)/p' >$(ksyms-lds);\
 	rm -f $(dummy-object);\
 	$(AR) rcs$(KBUILD_ARFLAGS) $(dummy-object);\
 	$(LD) $(ld_flags) -r -o $@ -T $(ksyms-lds) $(dummy-object);\
