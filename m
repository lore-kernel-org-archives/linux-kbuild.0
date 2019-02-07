Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f202.google.com ([209.85.166.202]:41083 "EHLO
        mail-it1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfBGWCq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 17:02:46 -0500
Received: by mail-it1-f202.google.com with SMTP id 71so2302718ita.6
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Feb 2019 14:02:46 -0800 (PST)
Date: Thu,  7 Feb 2019 14:01:51 -0800
In-Reply-To: <20190207220155.81351-1-ndesaulniers@google.com>
Message-Id: <20190207220155.81351-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190207220155.81351-1-ndesaulniers@google.com>
Subject: [PATCH 3/4] Makefile: lld: tell clang to use lld
From: ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is needed because clang doesn't select which linker to use based on
$LD but rather -fuse-ld=$(LD). This is problematic especially for
cc-ldoption, which checks for linker flag support via invoking the
compiler, rather than the linker.

Link: https://github.com/ClangBuiltLinux/linux/issues/342
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 0eae4277206e..6307c17259ea 100644
--- a/Makefile
+++ b/Makefile
@@ -502,6 +502,9 @@ endif
 CLANG_FLAGS	+= -no-integrated-as
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
+ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
+CLANG_FLAGS	+= -fuse-ld=lld
+endif
 export CLANG_FLAGS
 endif
 
-- 
2.20.1.791.gb4d0f1c61a-goog
