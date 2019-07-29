Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46481 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfG2Jdj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:33:39 -0400
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190728100906.18847-1-efremov@linux.com>
 <20190729151351.24f9eeb9@canb.auug.org.au> <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
In-Reply-To: <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Jul 2019 18:32:55 +0900
Message-ID: <CAK7LNATFKv=gm=Q8_0Xqjq4NAb-FL59xY6C3VQ3RXq3NaP2=jQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jul 29, 2019 at 6:16 PM Denis Efremov <efremov@linux.com> wrote:
>
> > Just a reminder that some of us (just me?) do well over 100+ builds per
> > day ...  if this can be optimised some what that would be good.
>
> These measurements for the worst case (allmodconfig). Is it possible to
> measure the slowdown in your case? How it will perform on your typical
> workflow?
>
> Looks like it is possible to optimize it, but I need some hints from
> Masahiro on how to do it properly. Because I don't know how to match
> __ksymtab_<symbol> with the <symbol> without an additional loop.

Right.
This is not feasible without an additional loop
since we put only exported symbols into the hash table.


Perhaps, we could put every symbol into the hash table
so that we can quickly look-up <symbol> from __ksymtab_<symbol>,
but it would consume lots of memory.

So, I think the implementation is this patch is good enough.


> Introduce another hash table?
>
> The first loop from this patch could traverse only the exported symbols
> instead of all symbols. But in this case, I don't know how to break
> early from the loop because there can be many symbols with the same name
> but with the different scope (static/non-static).
>
> For example, ring_buffer_size:
> kernel/trace/ring_buffer.c
> 4334:unsigned long ring_buffer_size(struct ring_buffer *buffer, int cpu)
> 4347:EXPORT_SYMBOL_GPL(ring_buffer_size);
> And
> drivers/usb/misc/ldusb.c
> 125:static int ring_buffer_size = 128;
>
> Or for, nfs4_disable_idmapping:
> fs/nfs/super.c
> 2920:bool nfs4_disable_idmapping = true;
> 2930:EXPORT_SYMBOL_GPL(nfs4_disable_idmapping);
> fs/nfsd/nfs4idmap.c
> 48:static bool nfs4_disable_idmapping = true;





-- 
Best Regards
Masahiro Yamada
