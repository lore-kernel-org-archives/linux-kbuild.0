Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:36157 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbfKRB5O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Nov 2019 20:57:14 -0500
Subject: Re: [RFC PATCH v4 0/7] Speed booting by sorting ORC unwind tables at
 build time
References: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
 <20191115175224.ozuiei2vlfvynok5@treble>
From: Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <39ff8865-8fef-6220-e024-293ee4fadf65@linux.alibaba.com>
Date: Mon, 18 Nov 2019 09:57:10 +0800
MIME-Version: 1.0
In-Reply-To: <20191115175224.ozuiei2vlfvynok5@treble>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org



On 2019/11/16 01:52, Josh Poimboeuf wrote:
> On Sat, Nov 16, 2019 at 12:45:32AM +0800, Shile Zhang wrote:
>> Hi,
>>
>> I refactored the code, followed by Peter's suggestions in v3, thank you!
>> Any suggestions and comments are welcome!
>>
>> Thanks!
>>
>> Changelog:
>> ==========
>> v3->v4:
>> - Code refactored for Peter's review findings and suggestions.
> Hi Shile,
>
> I haven't given it a proper review yet, but one minor suggestion.  In
> general it's good practice to wait at least a few business days before
> posting a new version of a patch set.  That way it gives people time to
> review, and it also helps to avoid flooding people's inboxes.
>

Hi, Josh,

Thank you very much for your kindly reminder!
I got it and very sorry for that flooding.

Best regards!

--- Shile
