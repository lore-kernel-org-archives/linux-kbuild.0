Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52235 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726373AbgEVS20 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 14:28:26 -0400
Date: Fri, 22 May 2020 13:28:15 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Message-ID: <20200522182815.ezanmvbemhzq2fmm@treble>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Huaixin Chang <changhuaixin@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, bp@alien8.de, hpa@zytor.com, luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com

On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
> Move building of fast lookup table from boot to sorttable tool. This saves us
> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.
> 
> Huaixin Chang (2):
>   scripts/sorttable: Build orc fast lookup table via sorttable tool
>   x86/unwind/orc: Remove unwind_init() from x86 boot
> 
>  arch/x86/include/asm/unwind.h |  2 -
>  arch/x86/kernel/setup.c       |  2 -
>  arch/x86/kernel/unwind_orc.c  | 51 ----------------------
>  scripts/sorttable.h           | 99 ++++++++++++++++++++++++++++++++++++++++---
>  4 files changed, 92 insertions(+), 62 deletions(-)

I tested this (rebased on tip/master), it seems to break ORC
completely... e.g. /proc/self/stack is empty.

-- 
Josh
