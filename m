Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpoutwbe01.prod.mesa1.secureserver.net ([208.109.78.112]:53718
	"HELO smtpoutwbe01.prod.mesa1.secureserver.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1763427AbZLQAHz convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 19:07:55 -0500
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Message-Id: <20091216170114.0b50c25debf12a9aa545bf810459b532.5b12d5606d.wbe@email.secureserver.net>
From: "Jiafu He" <jay@goldhive.com>
Subject: [PATCH] Makefile.build: Fix built-in.o linking errors
Date: Wed, 16 Dec 2009 17:01:14 -0700
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

This patch fixes two linking errors regarding the empty built-in.o:
- Error "...built-in.o: no such file or directory" happens if
"dirx/Makefile" contains only "obj-m += diry/ dirz/" and the empty
"dirx/built-in.o" is missing. Adding $(subdir-m) into check for
builtin-target fixes this error.
- Linking the child builtin.o's using arm-xscale-linux-gnueabi linker
fails with an EABI version mismatch error "... has EABI version 0, but
... has EABI verion 4". The cause is built-in.o created by $(AR) has
EABI verison 0, while the non-empty built-in.o's have EABI version 4.
The fix is to use $(CC) to create the empty built-in.o.

The fixes have been tested with x86/x86_64 native platforms and the
arm-xscale-linux-gnueabi cross-compiler.

Signed-off-by: Jiafu He <jay@goldhive.com>
-----
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 341b589..c8c8c81 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -82,7 +82,7 @@ ifneq ($(strip $(lib-y) $(lib-m) $(lib-n) $(lib-)),)
 lib-target := $(obj)/lib.a
 endif
 
-ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(lib-target)),)
+ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(subdir-m)
$(lib-target)),)
 builtin-target := $(obj)/built-in.o
 endif
 
@@ -291,7 +291,7 @@ quiet_cmd_link_o_target = LD      $@
 cmd_link_o_target = $(if $(strip $(obj-y)),\
                      $(LD) $(ld_flags) -r -o $@ $(filter $(obj-y), $^)
\
                      $(cmd_secanalysis),\
-                     rm -f $@; $(AR) rcs $@)
+                     rm -f $@; $(CC) -c -xassembler /dev/null -o $@)
 
 $(builtin-target): $(obj-y) FORCE
        $(call if_changed,link_o_target)
-----

