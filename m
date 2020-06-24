Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38574 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390646AbgFXMe1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:34:27 -0400
From: Alexander Popov <alex.popov@linux.com>
Subject: [PATCH v2 3/5] arm64: vdso: Don't use gcc plugins for building vgettimeofday.c
Date: Wed, 24 Jun 2020 15:33:28 +0300
Message-Id: <20200624123330.83226-4-alex.popov@linux.com>
In-Reply-To: <20200624123330.83226-1-alex.popov@linux.com>
References: <20200624123330.83226-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Alexander Popov <alex.popov@linux.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc: notify@kernel.org

Don't use gcc plugins for building arch/arm64/kernel/vdso/vgettimeofday.c
to avoid unneeded instrumentation.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 arch/arm64/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 556d424c6f52..0f1ad63b3326 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -29,7 +29,7 @@ ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
 ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
 ccflags-y += -DDISABLE_BRANCH_PROFILING
 
-CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS)
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) $(GCC_PLUGINS_CFLAGS)
 KBUILD_CFLAGS			+= $(DISABLE_LTO)
 KASAN_SANITIZE			:= n
 UBSAN_SANITIZE			:= n
-- 
2.25.4
