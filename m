Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:46098 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbeC2AsP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 20:48:15 -0400
Received: by mail-pf0-f196.google.com with SMTP id h69so2021693pfe.13
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 17:48:15 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 1/3] kbuild: Support HOSTLDFLAGS
Date: Wed, 28 Mar 2018 17:48:03 -0700
Message-Id: <20180329004805.7278-2-labbott@redhat.com>
In-Reply-To: <20180329004805.7278-1-labbott@redhat.com>
References: <20180329004805.7278-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>


In addition to HOSTCFLAGS, there's HOSTLDFLAGS. Ensure these get passed to
calls to build host binaries.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 scripts/Makefile.host      | 6 +++---
 tools/build/Makefile.build | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index e6dc6ae2d7c4..a3a0e2282a56 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -84,7 +84,7 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
 # Create executable from a single .c file
 # host-csingle -> Executable
 quiet_cmd_host-csingle 	= HOSTCC  $@
-      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) -o $@ $< \
+      cmd_host-csingle	= $(HOSTCC) $(HOSTLDFLAGS) $(hostc_flags) -o $@ $< \
 	  	$(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
 $(host-csingle): $(obj)/%: $(src)/%.c FORCE
 	$(call if_changed_dep,host-csingle)
@@ -102,7 +102,7 @@ $(call multi_depend, $(host-cmulti), , -objs)
 # Create .o file from a single .c file
 # host-cobjs -> .o
 quiet_cmd_host-cobjs	= HOSTCC  $@
-      cmd_host-cobjs	= $(HOSTCC) $(hostc_flags) -c -o $@ $<
+      cmd_host-cobjs	= $(HOSTCC) $(HOSTLDFLAGS) $(hostc_flags) -c -o $@ $<
 $(host-cobjs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,host-cobjs)
 
@@ -126,7 +126,7 @@ $(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
 # Compile .c file, create position independent .o file
 # host-cshobjs -> .o
 quiet_cmd_host-cshobjs	= HOSTCC  -fPIC $@
-      cmd_host-cshobjs	= $(HOSTCC) $(hostc_flags) -fPIC -c -o $@ $<
+      cmd_host-cshobjs	= $(HOSTCC) $(HOSTLDFLAGS) $(hostc_flags) -fPIC -c -o $@ $<
 $(host-cshobjs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,host-cshobjs)
 
diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
index cd72016c3cfa..cab55f0d90e1 100644
--- a/tools/build/Makefile.build
+++ b/tools/build/Makefile.build
@@ -64,7 +64,7 @@ quiet_cmd_cc_o_c = CC       $@
       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
 
 quiet_cmd_host_cc_o_c = HOSTCC   $@
-      cmd_host_cc_o_c = $(HOSTCC) $(host_c_flags) -c -o $@ $<
+      cmd_host_cc_o_c = $(HOSTCC) $(HOSTLDFLAGS) $(host_c_flags) -c -o $@ $<
 
 quiet_cmd_cxx_o_c = CXX      $@
       cmd_cxx_o_c = $(CXX) $(cxx_flags) -c -o $@ $<
-- 
2.16.2

