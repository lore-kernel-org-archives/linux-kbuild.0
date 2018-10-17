Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60773 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727678AbeJRBCj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 21:02:39 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/3] kbuild: Add -Wshadow to sparse
Date: Wed, 17 Oct 2018 19:05:52 +0200
Message-Id: <20181017170554.18841-2-bigeasy@linutronix.de>
In-Reply-To: <20181017170554.18841-1-bigeasy@linutronix.de>
References: <20181017170554.18841-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, linux-kbuild@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-sparse@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

I remember that `sparse' used to warn about shadowed variables but it
seems not to do it by default anymore. It was useful.

Enable `-Wshadow' while invoking sparse.

Cc: linux-sparse@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bf3786e4ffece..0160c6b5dd45d 100644
--- a/Makefile
+++ b/Makefile
@@ -390,7 +390,7 @@ PYTHON3		= python3
 CHECK		= sparse
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
-		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
+		  -Wbitwise -Wno-return-void -Wno-unknown-attribute -Wshadow $(CF)
 NOSTDINC_FLAGS  =
 CFLAGS_MODULE   =
 AFLAGS_MODULE   =
-- 
2.19.1
