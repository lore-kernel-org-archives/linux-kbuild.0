Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:50662 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfKFEct (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:32:49 -0500
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2754bf80-2653-5d94-6b1e-f33a34914b77@infradead.org>
Date: Tue, 5 Nov 2019 20:32:47 -0800
MIME-Version: 1.0
In-Reply-To: <20191106043120.GB6355@fieldses.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 11/5/19 8:31 PM, J. Bruce Fields wrote:
> On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
>> BTW.
>> Bruce,
>> Does the current script expect RHEL or something?
>> I do not see 'new-kernel-pkg' on my Ubuntu machine.
> 
> I test on Fedora.  Looks like on recent Fedora that's only provided by
> an rpm "grubby-deprecated", which is an inauspicious name....
> 
> I think maybe you're supposed to use "grubby" itself now.  Do you have
> that?
> 
>> It would still work with 'new-kernel-pkg: command not found'
>> warning.
>>
>> We could bypass it if we like.
>>
>> command -v new-kernel-pkg && new-kernel-pkg --remove $f
> 
> Looks like it's what updates the grub configuration, which is probably a
> nice thing to do if you can.

on openSUSE, I don't have new-kernel-pkg or grubby.

-- 
~Randy
