Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:33821 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756456AbcKWJe1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 04:34:27 -0500
Received: by mail-qk0-f172.google.com with SMTP id q130so8321522qke.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 01:34:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3117683.gtMMlH1SLc@wuerfel>
References: <20161122225424.3739294-1-arnd@arndb.de> <e8b2d3b5-31c4-80ad-df2b-38c72dc0fa10@virtuozzo.com>
 <3117683.gtMMlH1SLc@wuerfel>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 23 Nov 2016 10:33:41 +0100
Message-ID: <CACT4Y+byCnW6kWUTUn+YhdJKtadhHuYn+AvvyAZ+AuToJWNufg@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off -fsanitize-address-use-after-scope for now
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <marxin@gcc.gnu.org>, stable <stable@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Alexander Potapenko <glider@google.com>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Nov 23, 2016 at 9:46 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday, November 23, 2016 11:25:49 AM CET Andrey Ryabinin wrote:
>>
>> We have implementation for this feature:
>>         "[PATCH] kasan: support use-after-scope detection" - http://lkml.kernel.org/r/<1479226045-145148-1-git-send-email-dvyukov@google.com>
>> and given how simple it is I'd suggest to just backport implementation.
>>
>> BTW, we also need "[PATCH] kasan: update kasan_global for gcc 7" - http://lkml.kernel.org/r/<1479219743-28682-1-git-send-email-dvyukov@google.com>
>> in v4.0+ stable.
>
> Ah, good. What's the plan for this patch? Would you still expect to
> see that merged into v4.9, or get backported later once it's part of v4.10?
>
> Either way, you proabably want a Cc:stable tag on it to trigger the
> backport to older kernels.

+Andrew, what is the plan for the "[PATCH] kasan: update kasan_global
for gcc 7" patch?
Do I need to remail to include Cc:stable?
