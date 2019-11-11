Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:49052 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726742AbfKKCqg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Nov 2019 21:46:36 -0500
Subject: Re: [RFC PATCH v2 1/3] scripts: Add sortorctable to sort ORC unwind
 tables
References: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
 <20191108071108.72132-2-shile.zhang@linux.alibaba.com>
 <20191108095520.GK4114@hirez.programming.kicks-ass.net>
From: Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <aff231a0-f9c2-5106-a63b-46c6bc8fca40@linux.alibaba.com>
Date: Mon, 11 Nov 2019 10:46:33 +0800
MIME-Version: 1.0
In-Reply-To: <20191108095520.GK4114@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org



On 2019/11/8 17:55, Peter Zijlstra wrote:
> On Fri, Nov 08, 2019 at 03:11:06PM +0800, shile.zhang@linux.alibaba.com wrote:
>> From: Shile Zhang <shile.zhang@linux.alibaba.com>
>>
>> Sort orc_unwind and orc_unwind_ip tables at build time instead of runtime
>> in boot pharse can save more boot time.
> I still object to adding a copy of sortextable instead of making one
> tool for all sorts.

I got your point, thanks for your kindly advice!
I'll try to do rework it soon.
