Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40730 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbeJXMao (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Oct 2018 08:30:44 -0400
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v3 5/5] Adds -Wshadow on KBUILD_HOSTCFLAGS
Date: Wed, 24 Oct 2018 01:03:54 -0300
Message-Id: <20181024040354.24879-6-leobras.c@gmail.com>
In-Reply-To: <20181024040354.24879-1-leobras.c@gmail.com>
References: <20181024040354.24879-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Adds -Wshadow on KBUILD_HOSTCFLAGS to show shadow warnings
on tools built for HOST.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e8b599b4dcde..3edae5d359b5 100644
--- a/Makefile
+++ b/Makefile
@@ -360,7 +360,7 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
+KBUILD_HOSTCFLAGS   := -Wall -Wshadow -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
 		$(HOSTCFLAGS)
 KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
-- 
2.19.1
