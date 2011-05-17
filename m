Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:61164 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752074Ab1EQCOZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2011 22:14:25 -0400
Message-Id: <20110517021423.661004726@goodmis.org>
Date: Mon, 16 May 2011 22:10:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC][PATCH 2/2] ftrace/kbuild: Add recordmcount files to force full build
References: <20110517021027.390391519@goodmis.org>
Content-Disposition: inline; filename=0002-ftrace-kbuild-Add-recordmcount-files-to-force-full-b.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

From: Steven Rostedt <srostedt@redhat.com>

Modifications to recordmcount must be performed on all object
files to stay consistent with what the kernel code may expect.
Add the recordmcount files to the force-deps to make sure
any change to them causes a full recompile.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/Makefile.build |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0ff5a58..057d6e9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -252,6 +252,7 @@ sub_cmd_record_mcount =					\
 	if [ $(@) != "scripts/mod/empty.o" ]; then	\
 		$(objtree)/scripts/recordmcount "$(@)";	\
 	fi;
+force-deps += $(srctree)/scripts/recordmcount.c $(srctree)/scripts/recordmcount.h
 else
 sub_cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
@@ -259,6 +260,7 @@ sub_cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH
 	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CFLAGS)" \
 	"$(LD)" "$(NM)" "$(RM)" "$(MV)" \
 	"$(if $(part-of-module),1,0)" "$(@)";
+force-deps += $(srctree)/scripts/recordmcount.pl
 endif
 cmd_record_mcount = 						\
 	if [ "$(findstring -pg,$(_c_flags))" = "-pg" ]; then	\
-- 
1.7.2.3


