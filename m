Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34421 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfG2MwS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 08:52:18 -0400
Reply-To: efremov@linux.com
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190728100906.18847-1-efremov@linux.com>
 <20190729151351.24f9eeb9@canb.auug.org.au>
 <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
 <20190729224007.2f7fdcb4@canb.auug.org.au>
From: Denis Efremov <efremov@linux.com>
Message-ID: <65ea1c44-ac7f-b63f-8ba0-85bb12349383@linux.com>
Date: Mon, 29 Jul 2019 15:52:15 +0300
MIME-Version: 1.0
In-Reply-To: <20190729224007.2f7fdcb4@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/29/19 3:40 PM, Stephen Rothwell wrote:
> Hi Denis,
> 
> On Mon, 29 Jul 2019 12:16:29 +0300 Denis Efremov <efremov@linux.com> wrote:
>>
>>> Just a reminder that some of us (just me?) do well over 100+ builds per
>>> day ...  if this can be optimised some what that would be good.  
>>
>> These measurements for the worst case (allmodconfig). Is it possible to 
>> measure the slowdown in your case? How it will perform on your typical 
>> workflow?
> 
> I did 3 x86_64 allmodconfig builds without and with the patch (I do
> -j 80 powerpc64 le hosted cross builds) and it doesn't look like the
> patch has much impact at all.
> 
> Without the patch:
> 
> real	8m41.390s user	587m25.249s sys	22m0.411s
> real	8m40.100s user	587m32.148s sys	21m58.419s
> real	8m40.084s user	587m25.311s sys	22m2.794s
> 
> With the patch:
> 
> real	8m40.351s user	587m21.819s sys	21m57.389s
> real	8m40.868s user	587m23.730s sys	21m58.737s
> real	8m40.970s user	587m22.525s sys	22m2.467s
> 
> I do other builds as well, but that is the biggest, so actually looks
> ok.
> 

Is it worth to include your measurements instead of mine in the commit
description? Maybe the note about performance downgrade could be omitted
at all in this case?

Denis
