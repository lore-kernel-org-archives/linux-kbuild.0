Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpoutwbe11.prod.mesa1.secureserver.net ([208.109.78.27]:37115
	"HELO smtpoutwbe11.prod.mesa1.secureserver.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751507AbZLRBaU convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 20:30:20 -0500
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Message-Id: <20091217183017.0b50c25debf12a9aa545bf810459b532.ce89a43b17.wbe@email.secureserver.net>
From: "Jiafu He" <jay@goldhive.com>
Subject: [PATCH 2/2] Makefile.build: Fix built-in.o linking errors EABI version
 mismatch
Date: Thu, 17 Dec 2009 18:30:17 -0700
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Michal wrote:
> 
> Ack on this part, I need to think a bit more about the second part :).
> Could you please send two separate patches, they fix two independent
> issues after all.
> 
Here it the 2nd patch resent. Thanks.

This patch fixes the EABI version mismatch link error "built-in.o has
EABI version 0, but ... has EABI verion 4". The problem happens when
linking the child builtin.o's using arm-xscale-linux-gnueabi linker. The
cause is built-in.o created by $(AR) has an EABI verison 0, while the
non-empty built-in.o's have EABI version 4. Use $(CC) to create the
empty built-in.o fixes the problem.

Signed-off-by: Jiafu He <jay@goldhive.com>
-----
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 341b589..6a990ef 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
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

