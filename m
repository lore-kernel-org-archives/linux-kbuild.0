Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gateway24.websitewelcome.com ([192.185.50.45]:18659 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726315AbfH1SXw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 14:23:52 -0400
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id ECA6F9467
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 13:02:41 -0500 (CDT)
References: <20190815225844.145726-1-nhuck@google.com>
 <20190827004155.11366-1-natechancellor@gmail.com>
 <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
Message-ID: <d42b1f1c-f0fe-39ca-0573-04147c58b9e5@embeddedor.com>
Date: Wed, 28 Aug 2019 13:02:38 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Nathan Chancellor <natechancellor@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Huckleberry <nhuck@google.com>, Joe Perches <joe@perches.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>



On 8/28/19 11:20 AM, Masahiro Yamada wrote:

>>
>> Given these two problems need discussion and coordination, do not enable
>> -Wimplicit-fallthrough with clang right now. Add a comment to explain
>> what is going on as well. This commit should be reverted once these two
>> issues are fully flushed out and resolved.
>>
>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> ---
> 
> Applied to linux-kbuild. Thanks.
> 
> (If other clang folks give tags, I will add them later.)
> 

Acked-by: Gustavo A. R. Silva <gustavo@embeddedor.com>


Thanks
--
Gustavo
