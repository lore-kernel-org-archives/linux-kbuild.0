Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:60018 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725834AbgFCObb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 10:31:31 -0400
From: Huaixin Chang <changhuaixin@linux.alibaba.com>
Subject: [PATCH v2 0/3] Build ORC fast lookup table in scripts/sorttable tool
Date: Wed,  3 Jun 2020 22:31:20 +0800
Message-Id: <20200603143123.57364-1-changhuaixin@linux.alibaba.com>
In-Reply-To: <20200601173840.3f36m6l4fsu5bill@treble>
References: <20200601173840.3f36m6l4fsu5bill@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: jpoimboe@redhat.com
Cc: bp@alien8.de, changhuaixin@linux.alibaba.com, hpa@zytor.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com

Move building of fast lookup table from boot to sorttable tool. This saves us
6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.

Changelog v2:
1. Type of section orc_lookup needs to be SHT_PROGBITS.
2. unwind_init() cannot be removed totally as setting lookup_num_blocks is needed.

Huaixin Chang (3):
  scripts/sorttable: Change section type of orc_lookup to SHT_PROGBITS
  scripts/sorttable: Build orc fast lookup table via sorttable tool
  x86/unwind/orc: Simplify unwind_init() for x86 boot

 arch/x86/kernel/unwind_orc.c      | 40 ----------------
 include/asm-generic/vmlinux.lds.h |  2 +
 scripts/sorttable.h               | 99 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 94 insertions(+), 47 deletions(-)

-- 
2.14.4.44.g2045bb6
