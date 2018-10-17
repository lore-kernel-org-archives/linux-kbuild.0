Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38736 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbeJQIBI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 04:01:08 -0400
Date: Tue, 16 Oct 2018 21:08:09 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Message-ID: <20181017000809.GA21292@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Adds -Wshadow=local on KBUILD_HOSTCFLAGS to show shadow warnings
on tools built for HOST.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e8b599b4dcde..fb0a9ac195e7 100644
--- a/Makefile
+++ b/Makefile
@@ -360,7 +360,7 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
+KBUILD_HOSTCFLAGS   := -Wall -Wshadow=local -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
 		$(HOSTCFLAGS)
 KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
-- 
2.19.1
