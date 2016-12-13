Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-db5eur01on0104.outbound.protection.outlook.com ([104.47.2.104]:51223
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752056AbcLMMwK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Dec 2016 07:52:10 -0500
Subject: Re: [PATCH v2] kasan: Support for r/w instrumentation control
References: <1481608665-26941-1-git-send-email-maninder1.s@samsung.com>
 <CACT4Y+bQLjn23Vdsyq-gZY55RA+=tRYpq3DwHdu5vQLKbNBykA@mail.gmail.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <6cc0eadc-5204-ce36-f5e8-88ba76bb6826@virtuozzo.com>
Date: Tue, 13 Dec 2016 12:20:40 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bQLjn23Vdsyq-gZY55RA+=tRYpq3DwHdu5vQLKbNBykA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>, Maninder Singh <maninder1.s@samsung.com>
Cc: Alexander Potapenko <glider@google.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, kasan-dev <kasan-dev@googlegroups.com>, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, PANKAJ MISHRA <pankaj.m@samsung.com>, Ajeet Kumar Yadav <ajeet.y@samsung.com>, Vaneet narang <v.narang@samsung.com>



On 12/13/2016 11:58 AM, Dmitry Vyukov wrote:

> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -40,6 +40,14 @@ similar to the following to the respective kernel Makefile:
> 
>      KASAN_SANITIZE := n
> 
> +Sometimes it may be useful to disable instrumentation of reads, or writes
> +or both for the entire kernel. For example, if binary size is a concern,
> +it may be useful to disable instrumentation of reads to reduce binary size but
> +still catch more harmful bugs on writes. Or, if one is interested only in
> +sanitization of a particular module and performance is a concern, she can
> +disable instrumentation of both reads and writes for kernel code.
> +Instrumentation can be disabled with CONFIG_KASAN_READS and
> CONFIG_KASAN_WRITES.
> +

I don't understand this. How this can be related to modules? Configs are global.
You can't just disable/enable config per module.

>  Error reports
> 
