Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38763 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfEILtL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:49:11 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
Date: Thu,  9 May 2019 04:48:25 -0700
Message-Id: <20190509114824.25866-1-natechancellor@gmail.com>
In-Reply-To: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <natechancellor@gmail.com>

This is no longer a valid option in clang, it was removed in 3.5, which
we don't support.

https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Let me know if you want this incremental to your patch. I figured it
made more sense to remove this then do the cc-option/cc-disable-warning
removal because it will simplify the commit message.

 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index d24f5a8009ee..e4788eb2c9b9 100644
--- a/Makefile
+++ b/Makefile
@@ -740,7 +740,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
-KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.21.0
