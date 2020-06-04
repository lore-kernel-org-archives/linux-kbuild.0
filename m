Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45601 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgFDNvJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:51:09 -0400
From: Alexander Popov <alex.popov@linux.com>
Subject: [PATCH 4/5] gcc-plugins/stackleak: Don't instrument itself
Date: Thu,  4 Jun 2020 16:49:56 +0300
Message-Id: <20200604134957.505389-5-alex.popov@linux.com>
In-Reply-To: <20200604134957.505389-1-alex.popov@linux.com>
References: <20200604134957.505389-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Alexander Popov <alex.popov@linux.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc: notify@kernel.org

There is no need to try instrumenting functions in kernel/stackleak.c.
Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
is disabled.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/Makefile b/kernel/Makefile
index 4cb4130ced32..d372134ac9ec 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_RSEQ) += rseq.o
 
 obj-$(CONFIG_SYSCTL_KUNIT_TEST) += sysctl-test.o
 
+CFLAGS_stackleak.o += $(DISABLE_STACKLEAK_PLUGIN)
 obj-$(CONFIG_GCC_PLUGIN_STACKLEAK) += stackleak.o
 KASAN_SANITIZE_stackleak.o := n
 KCOV_INSTRUMENT_stackleak.o := n
-- 
2.25.2
