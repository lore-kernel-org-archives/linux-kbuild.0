Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41030 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfG2JQd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:16:33 -0400
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190728100906.18847-1-efremov@linux.com>
 <20190729151351.24f9eeb9@canb.auug.org.au>
From: Denis Efremov <efremov@linux.com>
Message-ID: <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
Date: Mon, 29 Jul 2019 12:16:29 +0300
MIME-Version: 1.0
In-Reply-To: <20190729151351.24f9eeb9@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

> Just a reminder that some of us (just me?) do well over 100+ builds per
> day ...  if this can be optimised some what that would be good.

These measurements for the worst case (allmodconfig). Is it possible to 
measure the slowdown in your case? How it will perform on your typical 
workflow?

Looks like it is possible to optimize it, but I need some hints from 
Masahiro on how to do it properly. Because I don't know how to match 
__ksymtab_<symbol> with the <symbol> without an additional loop. 
Introduce another hash table?

The first loop from this patch could traverse only the exported symbols 
instead of all symbols. But in this case, I don't know how to break 
early from the loop because there can be many symbols with the same name 
but with the different scope (static/non-static).

For example, ring_buffer_size:
kernel/trace/ring_buffer.c
4334:unsigned long ring_buffer_size(struct ring_buffer *buffer, int cpu)
4347:EXPORT_SYMBOL_GPL(ring_buffer_size);
And
drivers/usb/misc/ldusb.c
125:static int ring_buffer_size = 128;

Or for, nfs4_disable_idmapping:
fs/nfs/super.c
2920:bool nfs4_disable_idmapping = true;
2930:EXPORT_SYMBOL_GPL(nfs4_disable_idmapping);
fs/nfsd/nfs4idmap.c
48:static bool nfs4_disable_idmapping = true;

Regards,
Denis
