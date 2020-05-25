Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:49788 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727937AbgE0BLq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 21:11:46 -0400
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
From: changhuaixin <changhuaixin@linux.alibaba.com>
In-Reply-To: <20200522182815.ezanmvbemhzq2fmm@treble>
Date: Mon, 25 May 2020 11:33:00 +0800
Content-Transfer-Encoding: 8BIT
Message-Id: <F00701B2-F4AD-48B2-9710-33E4CFA5C5AA@linux.alibaba.com>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
 <20200522182815.ezanmvbemhzq2fmm@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: changhuaixin <changhuaixin@linux.alibaba.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, bp@alien8.de, hpa@zytor.com, luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com

Thanks for your kindly reply. Let me have a check.

> On May 23, 2020, at 2:28 AM, Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> 
> On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
>> Move building of fast lookup table from boot to sorttable tool. This saves us
>> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.
>> 
>> Huaixin Chang (2):
>>  scripts/sorttable: Build orc fast lookup table via sorttable tool
>>  x86/unwind/orc: Remove unwind_init() from x86 boot
>> 
>> arch/x86/include/asm/unwind.h |  2 -
>> arch/x86/kernel/setup.c       |  2 -
>> arch/x86/kernel/unwind_orc.c  | 51 ----------------------
>> scripts/sorttable.h           | 99 ++++++++++++++++++++++++++++++++++++++++---
>> 4 files changed, 92 insertions(+), 62 deletions(-)
> 
> I tested this (rebased on tip/master), it seems to break ORC
> completely... e.g. /proc/self/stack is empty.
> 
> -- 
> Josh
