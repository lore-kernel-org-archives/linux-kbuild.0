Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43592 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfBTBZ1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 20:25:27 -0500
Received: by mail-qt1-f195.google.com with SMTP id y4so25525369qtc.10
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 17:25:26 -0800 (PST)
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
References: <20190219214940.391081-1-arnd@arndb.de>
 <1550614664.6911.45.camel@lca.pw>
 <CAKwvOdn+MJxYc+ykvyf-WhEzzDn0zEusjpQuksknnf8bPb=Q6g@mail.gmail.com>
 <CAN=P9pgC8EzawtxMzp6d3AsMPkSpTd0Ry6j+Jn+YgC_XP2Fd_w@mail.gmail.com>
From: Qian Cai <cai@lca.pw>
Message-ID: <d925ca37-ff0d-adba-6e1e-a7eaa47404b0@lca.pw>
Date: Tue, 19 Feb 2019 20:25:23 -0500
MIME-Version: 1.0
In-Reply-To: <CAN=P9pgC8EzawtxMzp6d3AsMPkSpTd0Ry6j+Jn+YgC_XP2Fd_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kostya Serebryany <kcc@google.com>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Mark Brown <broonie@kernel.org>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, Andrey Konovalov <andreyknvl@google.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Evgenii Stepanov <eugenis@google.com>



On 2/19/19 7:33 PM, Kostya Serebryany wrote:
>>> Well, I am using clang 8.0 on arm64 and running the kernel just fine for a few
>>> weeks now and never trigger a single stack overflow (THREAD_SHIFT = 15) because
>>> I never use any of those drivers you mentioned above. I don't think it is a good
>>> idea to blankly remove the testing coverage here and affect people don't use all
>>> those offensive functions at all.
>>
>> Thanks for the patch, Arnd!  Hopefully we can fix that up in Clang
>> soon.  Qian, I guess the alternative would be to add `-mllvm
>> -asan-stack=0` on potentially up to 140 Makefiles?

Depends on the exact stack consumption of those 140 functions. For example, I
don't care if you turn-off -asan-stack if the current stack size is < 32k.

For those functions always consume like a lot of stack like 8k or more, fix them
in Makefile if not too many of them.
