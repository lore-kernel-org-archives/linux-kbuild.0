Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr30101.outbound.protection.outlook.com ([40.107.3.101]:45116
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753522AbdGNQtu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jul 2017 12:49:50 -0400
Subject: Re: [PATCH 1/4] kasan: support alloca() poisoning
References: <20170706220114.142438-1-ghackmann@google.com>
 <20170706220114.142438-2-ghackmann@google.com>
 <66645c53-de05-8371-ead8-d4e939af60a7@virtuozzo.com>
 <39dd8c5c-e606-486a-bcef-b8481c5203a1@google.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <0e51dc15-1c93-2326-444d-8257b61af54f@virtuozzo.com>
Date: Fri, 14 Jul 2017 19:52:05 +0300
MIME-Version: 1.0
In-Reply-To: <39dd8c5c-e606-486a-bcef-b8481c5203a1@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Hackmann <ghackmann@google.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>

On 07/14/2017 01:49 AM, Greg Hackmann wrote:
> On 07/10/2017 03:30 AM, Andrey Ryabinin wrote:
>> gcc now supports this too. So I think this patch should enable it.
>> It's off by default so you'll have to add --param asan-instrument-allocas=1 into cflags
>> to make it work
> 
> Thanks, will fix.  For now, it looks like I'll need to build gcc from git to test this?
> 

Right, you'll need quite fresh revision >= 250032

>>>   lib/test_kasan.c  | 22 ++++++++++++++++++++++
>>
>> Tests would be better as a separate patch.
> 
> I was following the precedent in 828347f8f9a5 ("kasan: support use-after-scope detection") which added both at the same time. But I can split the test off into a separate patch if you feel really strongly about it.

Please, do the split.
