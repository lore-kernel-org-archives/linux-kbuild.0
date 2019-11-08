Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:39219 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728370AbfKHBnV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 20:43:21 -0500
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
 <20191107154654.jyg24wzqujdtx7zq@treble>
From: Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <280e2634-e808-9177-478b-910b3210a958@linux.alibaba.com>
Date: Fri, 8 Nov 2019 09:43:18 +0800
MIME-Version: 1.0
In-Reply-To: <20191107154654.jyg24wzqujdtx7zq@treble>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org



On 2019/11/7 23:46, Josh Poimboeuf wrote:
> On Thu, Nov 07, 2019 at 10:32:01PM +0800, shile.zhang@linux.alibaba.com wrote:
>> From: Shile Zhang <shile.zhang@linux.alibaba.com>
>>
>> Hi,
>>
>> I found the unwind_init taken long time (more than 90ms) in kernel
>> booting, mainly spent on sorting the two ORC unwind tables, orc_unwind
>> and orc_unwind_ip.
>>
>> I also noticed that this issued has reported and discussed last year:
>> https://lkml.org/lkml/2018/10/8/342
>> But seems no final solution until now, I tried to sort the ORC tables at
>> build time, followed the helpful hints from Josh and Ingo in that thread.
>> And mainly referred the implementation of 'sortextable' tool:
>> https://lore.kernel.org/linux-mips/1334872799-14589-1-git-send-email-ddaney.cavm@gmail.com/
>>
>> What I did:
>>
>> - Add a Kconfig to control build-time sorting or runtime sorting;
>> - Referred 'sortextable', create a similar helper tool 'sortorctable',
>>    help to sort the ORC unwind tables at vmlinux link process.
>>
>> One potential improvement is to sort the module ORC tables in future.
>>
>> Thanks!
> Thanks a lot for working on this!
>
> I'd say the new config option isn't needed.  The runtime ORC sorting
> logic is unconditionally bad and the code should just be removed.  I saw
> recently that it's one of the main offenders for boot time latency.
Hi, Josh, Thanks very much for your quickly response!

I'll refactor the code as your advice.
Yes, the run-time sorting cost is bigger for currently Cloud products, 
such as serverless products, which needs boot up ASAP.
>
> I also agree with Peter that we should try to reduce the link-time
> penalty as much as possible.  But it's a necessary evil to a certain
> extent.
>
agree!

Thanks again and looking forwards more advice from you!
