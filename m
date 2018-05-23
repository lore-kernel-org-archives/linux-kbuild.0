Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:38056 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753619AbeEWATv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 20:19:51 -0400
Received: by mail-pl0-f66.google.com with SMTP id c11-v6so11875350plr.5
        for <linux-kbuild@vger.kernel.org>; Tue, 22 May 2018 17:19:51 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv3 2/2] x86/vdso: Add build salt to the vDSO
Date: Tue, 22 May 2018 17:19:39 -0700
Message-Id: <20180523001939.9431-3-labbott@redhat.com>
In-Reply-To: <20180523001939.9431-1-labbott@redhat.com>
References: <20180523001939.9431-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Laura Abbott <labbott@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org


The vDSO is linked separately from the kernel and modules. Ensure it picks
up the comment section, if available.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v3: Invoke the generated linker script. The ".." nightmare is pretty
ugly but I didn't see an easier way to pick up the generated file.
That was actually part of my motivation for using an #include since
paths for those are standardized.
---
 arch/x86/entry/vdso/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index d998a487c9b1..f54aa97dc9f0 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -162,7 +162,9 @@ $(obj)/vdso32.so.dbg: FORCE \
 quiet_cmd_vdso = VDSO    $@
       cmd_vdso = $(CC) -nostdlib -o $@ \
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
-		       -Wl,-T,$(filter %.lds,$^) $(filter %.o,$^) && \
+		       -Wl,-T,$(filter %.lds,$^) \
+		       -Wl,-T$(obj)/../../../../scripts/build-salt.lds \
+		       $(filter %.o,$^) && \
 		 sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
 
 VDSO_LDFLAGS = -fPIC -shared $(call cc-ldoption, -Wl$(comma)--hash-style=both) \
-- 
2.17.0

