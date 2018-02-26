Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37887 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751823AbeBZSmn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Feb 2018 13:42:43 -0500
Received: by mail-wm0-f68.google.com with SMTP id 139so6062822wmn.2
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2018 10:42:42 -0800 (PST)
From: Robin Jarry <robin.jarry@6wind.com>
Subject: [PATCH v2 2/3] kbuild: use HOSTLDFLAGS for single .c executables
Date: Mon, 26 Feb 2018 19:41:47 +0100
Message-Id: <c59adbdd18dc083fc1e08a9a889e67282fcbbaa2.1519668832.git.robin.jarry@6wind.com>
In-Reply-To: <cover.1519668832.git.robin.jarry@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com> <cover.1519668832.git.robin.jarry@6wind.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

When compiling executables from a single .c file, the linker is also
invoked. Pass the HOSTLDFLAGS like for other linker commands.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>
---
 scripts/Makefile.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index e6dc6ae2d7c4..aa971cc3f339 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -84,7 +84,7 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
 # Create executable from a single .c file
 # host-csingle -> Executable
 quiet_cmd_host-csingle 	= HOSTCC  $@
-      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) -o $@ $< \
+      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(HOSTLDFLAGS) -o $@ $< \
 	  	$(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
 $(host-csingle): $(obj)/%: $(src)/%.c FORCE
 	$(call if_changed_dep,host-csingle)
-- 
2.11.0

