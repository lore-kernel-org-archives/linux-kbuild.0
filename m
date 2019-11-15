Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:45902 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbfKOIY4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 03:24:56 -0500
Subject: Re: [RFC PATCH v3 0/7] Speed booting by sorting ORC unwind tables at
 build time
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115072511.GA114447@gmail.com>
From: Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <ea339e91-0718-4b8c-dda4-5e4f70d68f24@linux.alibaba.com>
Date: Fri, 15 Nov 2019 16:24:52 +0800
MIME-Version: 1.0
In-Reply-To: <20191115072511.GA114447@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org



On 2019/11/15 15:25, Ingo Molnar wrote:
> * Shile Zhang <shile.zhang@linux.alibaba.com> wrote:
>
>> Hi,
>>
>> I refactored the sortextable code and add ORC unwind tables sort
>> support, for kernel boot speedup by sorting kernel tables at build time
>> as much as possible.
>>
>> Followed Peter's suggestion, I put ORC tables sort into a separated
>> thread makes these tables sort concurrently. That helps to avoid
>> kernel's link time as possible.
> Could you please also measure how much boot time this saves,
> approximately, and how long it takes to do it at build time?

Thanks for your review!

I've tested on 2vcpu16GB VM (with 2.5GHz Xeon CPU), it can saves near 90ms.
And the new sorttable tool costs about 0.074s to do extable and orc 
tables sort,
on host with same CPU.
>
> Thanks,
>
> 	Ingo
