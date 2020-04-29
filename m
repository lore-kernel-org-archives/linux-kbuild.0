Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:58852 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726355AbgD2Gqm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 02:46:42 -0400
From: Huaixin Chang <changhuaixin@linux.alibaba.com>
Subject: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Date: Wed, 29 Apr 2020 14:46:24 +0800
Message-Id: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com, luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com

Move building of fast lookup table from boot to sorttable tool. This saves us
6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.

Huaixin Chang (2):
  scripts/sorttable: Build orc fast lookup table via sorttable tool
  x86/unwind/orc: Remove unwind_init() from x86 boot

 arch/x86/include/asm/unwind.h |  2 -
 arch/x86/kernel/setup.c       |  2 -
 arch/x86/kernel/unwind_orc.c  | 51 ----------------------
 scripts/sorttable.h           | 99 ++++++++++++++++++++++++++++++++++++++++---
 4 files changed, 92 insertions(+), 62 deletions(-)

-- 
2.14.4.44.g2045bb6
