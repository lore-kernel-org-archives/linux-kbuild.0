Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36742 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754172AbeGGBH3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 21:07:29 -0400
Received: by mail-qt0-f195.google.com with SMTP id f1-v6so11398897qti.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jul 2018 18:07:28 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 2/7] tools: build: Use HOSTLDFLAGS with fixdep
Date: Fri,  6 Jul 2018 18:07:04 -0700
Message-Id: <20180707010709.16648-3-labbott@redhat.com>
In-Reply-To: <20180707010709.16648-1-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

The final link of fixdep uses LDFLAGS but not the existing HOSTLDFLAGS.
Fix this.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
This was another one where I couldn't tell of the use of LDFLAGS was a
typo or intentional, hence keeping both.
---
 tools/build/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/build/Makefile b/tools/build/Makefile
index 5eb4b5ad79cb..cd0fd2cd165b 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -43,7 +43,7 @@ $(OUTPUT)fixdep-in.o: FORCE
 	$(Q)$(MAKE) $(build)=fixdep
 
 $(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
-	$(QUIET_LINK)$(HOSTCC) $(LDFLAGS) -o $@ $<
+	$(QUIET_LINK)$(HOSTCC) $(HOSTLDFLAGS) $(LDFLAGS) -o $@ $<
 
 FORCE:
 
-- 
2.17.1

