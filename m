Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:59726 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfAKDX5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jan 2019 22:23:57 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] powerpc: math-emu: remove unneeded header search paths
Date: Fri, 11 Jan 2019 12:22:33 +0900
Message-Id: <1547176954-17739-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
References: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>

The header search path -I. in kernel Makefiles is very suspicious;
it allows the compiler to search for headers in the top of $(srctree),
where obviously no header file exists.

-Iinclude/math-emu seems unnecessary because all files include headers
in the form of #include <math-emu/...>.

I was able to build without these header search paths.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/powerpc/math-emu/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/math-emu/Makefile b/arch/powerpc/math-emu/Makefile
index 494df26..a879403 100644
--- a/arch/powerpc/math-emu/Makefile
+++ b/arch/powerpc/math-emu/Makefile
@@ -17,4 +17,4 @@ obj-$(CONFIG_SPE)		+= math_efp.o
 CFLAGS_fabs.o = -fno-builtin-fabs
 CFLAGS_math.o = -fno-builtin-fabs
 
-ccflags-y = -I. -Iinclude/math-emu -w
+ccflags-y = -w
-- 
2.7.4
