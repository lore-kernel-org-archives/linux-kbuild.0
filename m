Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:52150 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729896AbfKHHLW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 02:11:22 -0500
From: shile.zhang@linux.alibaba.com
Subject: [RFC PATCH v2 0/3] Speed booting by sorting ORC unwind tables at build time
Date: Fri,  8 Nov 2019 15:11:05 +0800
Message-Id: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>

From: Shile Zhang <shile.zhang@linux.alibaba.com>

This series tries to sort the ORC unwind tables in vmlinux link phase at
build time, help to speed up kernel boot. It's significant for boot time
sensitive products, such as embedded device in IoT, or serverless in
cloud.

Thanks!

Changes from RFC v2:
- removed new added Kconfig and runtime sort code, advised by Josh Poimboeuf.
- some minor refactoring.

v1:
https://www.lkml.org/lkml/2019/11/7/611

Shile Zhang (3):
  scripts: Add sortorctable to sort ORC unwind tables
  kbuild: Sort ORC unwind tables in vmlinux link phase
  x86/unwind/orc: remove run-time ORC unwind tables sort

 arch/x86/kernel/unwind_orc.c |   7 +-
 scripts/.gitignore           |   1 +
 scripts/Makefile             |   2 +
 scripts/link-vmlinux.sh      |  14 ++
 scripts/sortorctable.c       | 251 +++++++++++++++++++++++++++++++++++
 scripts/sortorctable.h       |  26 ++++
 6 files changed, 298 insertions(+), 3 deletions(-)
 create mode 100644 scripts/sortorctable.c
 create mode 100644 scripts/sortorctable.h

-- 
2.24.0.rc2
