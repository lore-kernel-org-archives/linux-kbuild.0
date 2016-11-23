Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:58555 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933274AbcKWIsn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 03:48:43 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] kasan: turn off -fsanitize-address-use-after-scope for now
Date: Wed, 23 Nov 2016 09:46:42 +0100
Message-ID: <3117683.gtMMlH1SLc@wuerfel>
In-Reply-To: <e8b2d3b5-31c4-80ad-df2b-38c72dc0fa10@virtuozzo.com>
References: <20161122225424.3739294-1-arnd@arndb.de> <e8b2d3b5-31c4-80ad-df2b-38c72dc0fa10@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Martin =?utf-8?B?TGnFoWth?= <marxin@gcc.gnu.org>, stable@vger.kernel.org, Michal Marek <mmarek@suse.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org

On Wednesday, November 23, 2016 11:25:49 AM CET Andrey Ryabinin wrote:
> 
> We have implementation for this feature:
>         "[PATCH] kasan: support use-after-scope detection" - http://lkml.kernel.org/r/<1479226045-145148-1-git-send-email-dvyukov@google.com>
> and given how simple it is I'd suggest to just backport implementation.
> 
> BTW, we also need "[PATCH] kasan: update kasan_global for gcc 7" - http://lkml.kernel.org/r/<1479219743-28682-1-git-send-email-dvyukov@google.com>
> in v4.0+ stable.

Ah, good. What's the plan for this patch? Would you still expect to
see that merged into v4.9, or get backported later once it's part of v4.10?

Either way, you proabably want a Cc:stable tag on it to trigger the
backport to older kernels.

	Arnd
