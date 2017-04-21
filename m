Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48761 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1041590AbdDURnq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 13:43:46 -0400
From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 1/1] objtool: make it visible in make V=1 output
Date: Fri, 21 Apr 2017 17:16:20 +0200
Message-Id: <20170421151620.14297-1-jslaby@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>

It is currently impossible to see what is going on with objtool when
building, so call echo-cmd to see the actions:
  gcc -Wp,-MD,arch/x86/entry/.entry_64.o.d  -nostdinc -isystem ...
  ./tools/objtool/objtool check "arch/x86/entry/entry_64.o";

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
---
 scripts/Makefile.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d883116ebaa4..dbe0dde80b00 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -272,14 +272,14 @@ define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
 	$(call cmd_and_fixdep,cc_o_c)					  \
 	$(cmd_modversions_c)						  \
-	$(cmd_objtool)						          \
+	$(call echo-cmd,objtool) $(cmd_objtool)				  \
 	$(call echo-cmd,record_mcount) $(cmd_record_mcount)
 endef
 
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)					  \
 	$(cmd_modversions_S)						  \
-	$(cmd_objtool)
+	$(call echo-cmd,objtool) $(cmd_objtool)
 endef
 
 # List module undefined symbols (or empty line if not enabled)
-- 
2.12.2

