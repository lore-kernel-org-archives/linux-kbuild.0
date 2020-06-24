Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43251 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388761AbgFXMdz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:33:55 -0400
From: Alexander Popov <alex.popov@linux.com>
Subject: [PATCH v2 0/5] Improvements of the stackleak gcc plugin
Date: Wed, 24 Jun 2020 15:33:25 +0300
Message-Id: <20200624123330.83226-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Alexander Popov <alex.popov@linux.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc: notify@kernel.org

This is the v2 of the patch series with various improvements of the
stackleak gcc plugin.

The first three patches disable unneeded gcc plugin instrumentation for
some files.

The fourth patch is the main improvement. It eliminates an unwanted
side-effect of kernel code instrumentation performed by stackleak gcc
plugin. This patch is a deep reengineering of the idea described on
grsecurity blog:
  https://grsecurity.net/resolving_an_unfortunate_stackleak_interaction

The final patch adds 'verbose' stackleak parameter for printing additional
info about the kernel code instrumentation during kernel building.

I would like to thank Alexander Monakov <amonakov@ispras.ru> for his
advisory on gcc internals.

This patch series was tested for gcc version 4.8, 5, 6, 7, 8, 9, and 10
on x86_64, i386 and arm64.
That was done using the project 'kernel-build-containers':
  https://github.com/a13xp0p0v/kernel-build-containers

Changes from v1:
 - rebase onto 5.8.0-rc2;
 - don't exclude alloca() from the instrumentation logic, because it
   will be used in kernel stack offset randomization;
 - reorder patches in the series;
 - don't use gcc plugins for building vgettimeofday.c in arm and
   arm64 vDSO;
 - follow alphabetic order in include/linux/compiler_attributes.h.

Link to v1:
 https://lore.kernel.org/lkml/20200604134957.505389-1-alex.popov@linux.com/


Alexander Popov (5):
  gcc-plugins/stackleak: Don't instrument itself
  ARM: vdso: Don't use gcc plugins for building vgettimeofday.c
  arm64: vdso: Don't use gcc plugins for building vgettimeofday.c
  gcc-plugins/stackleak: Use asm instrumentation to avoid useless
    register saving
  gcc-plugins/stackleak: Add 'verbose' plugin parameter

 arch/arm/vdso/Makefile                 |   2 +-
 arch/arm64/kernel/vdso/Makefile        |   2 +-
 include/linux/compiler_attributes.h    |  13 ++
 kernel/Makefile                        |   1 +
 kernel/stackleak.c                     |  16 +-
 scripts/Makefile.gcc-plugins           |   2 +
 scripts/gcc-plugins/stackleak_plugin.c | 248 +++++++++++++++++++++----
 7 files changed, 239 insertions(+), 45 deletions(-)

-- 
2.25.4
