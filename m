Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:40029 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933345AbeGJAqR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 20:46:17 -0400
Received: by mail-qt0-f194.google.com with SMTP id h4-v6so16997066qtj.7
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jul 2018 17:46:17 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv2 2/7] tools: build: Use HOSTLDFLAGS with fixdep
Date: Mon,  9 Jul 2018 17:45:57 -0700
Message-Id: <20180710004602.21599-3-labbott@redhat.com>
In-Reply-To: <20180710004602.21599-1-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

The final link of fixdep uses LDFLAGS but not the existing HOSTLDFLAGS.
Fix this.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Switch to just using HOSTLDFLAGS instead of both LDFLAGS and
HOSTLDFLAGS.
---
 tools/build/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/build/Makefile b/tools/build/Makefile
index 5eb4b5ad79cb..5edf65e684ab 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -43,7 +43,7 @@ $(OUTPUT)fixdep-in.o: FORCE
 	$(Q)$(MAKE) $(build)=fixdep
 
 $(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
-	$(QUIET_LINK)$(HOSTCC) $(LDFLAGS) -o $@ $<
+	$(QUIET_LINK)$(HOSTCC) $(HOSTLDFLAGS) -o $@ $<
 
 FORCE:
 
-- 
2.17.1

