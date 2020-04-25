Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:33398 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgDYGHd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 02:07:33 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] unicore32: do not evaluate compiler's library path when cleaning
Date: Sat, 25 Apr 2020 15:06:40 +0900
Message-Id: <20200425060640.823362-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Guan Xuetao <gxt@pku.edu.cn>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org

Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
-Wframe-larger-than="), 'make ARCH=unicore32 clean' emits error
messages as follows:

  $ make ARCH=unicore32 clean
  gcc: error: missing argument to '-Wframe-larger-than='
  gcc: error: missing argument to '-Wframe-larger-than='

We do not care compiler flags when cleaning.

Use the '=' operator for lazy expansion because we do not use
GNU_LIBC_A or GNU_LIBGCC_A when cleaning.

Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/unicore32/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/unicore32/lib/Makefile b/arch/unicore32/lib/Makefile
index 098981a01841..5af06645b8f0 100644
--- a/arch/unicore32/lib/Makefile
+++ b/arch/unicore32/lib/Makefile
@@ -10,12 +10,12 @@ lib-y	+= strncpy_from_user.o strnlen_user.o
 lib-y	+= clear_user.o copy_page.o
 lib-y	+= copy_from_user.o copy_to_user.o
 
-GNU_LIBC_A		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
+GNU_LIBC_A		= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
 GNU_LIBC_A_OBJS		:= memchr.o memcpy.o memmove.o memset.o
 GNU_LIBC_A_OBJS		+= strchr.o strrchr.o
 GNU_LIBC_A_OBJS		+= rawmemchr.o			# needed by strrchr.o
 
-GNU_LIBGCC_A		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
+GNU_LIBGCC_A		= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
 GNU_LIBGCC_A_OBJS	:= _ashldi3.o _ashrdi3.o _lshrdi3.o
 GNU_LIBGCC_A_OBJS	+= _divsi3.o _modsi3.o _ucmpdi2.o _umodsi3.o _udivsi3.o
 
-- 
2.25.1
