Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:49779 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755435Ab3KEXGY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Nov 2013 18:06:24 -0500
Received: by mail-wi0-f178.google.com with SMTP id hn9so2883237wib.17
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Nov 2013 15:06:23 -0800 (PST)
Date: Wed, 6 Nov 2013 00:06:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Segmentation Fault with 'm' Dependencies
Message-ID: <20131105230619.GC3337@free.fr>
References: <4647748.CU0TquGsxA@tacticalops>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4647748.CU0TquGsxA@tacticalops>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Dirk Gouders <dirk@gouders.net>, Andrew Morton <akpm@linux-foundation.org>, Libo Chen <libo.chen@huawei.com>

Martin, All,

On 2013-10-28 03:16 +0100, Martin Walch spake thusly:
> this test case leads to a segmentation fault:
> 
> config A
> 	tristate "A" if m
> 
> config MODULES
> 	boolean "MODULES"
> 	option modules
> 
> As you can see, the MODULES symbol with the option modules is declared after
> the first occurrence of an 'm' dependency. (Actually you can drop the MODULES
> section or use a different symbol name. It does not matter.) Internally 'm' gets
> converted into (symbol_mod && modules_sym), which adds a dependency on a
> bad symbol, finally leading to dereferencing a null pointer.

Indeed, reproduced here. I'll investigate further (although anyone is
free to hack it, too! :-p)

> If you move the declaration of the MODULES symbol to the top, everything
> works fine.
> 
> The crash has been introduced last month with
> 
> > 6902dccfda005fa4c42410fa064fdd331ab42479
> > kconfig: do not special-case 'MODULES' symbol
> 
> However, things were probably broken before. The problem has only
> become visible.
> 
> The reason that configuring a Linux kernel does not crash the
> configuration system is that there is currently no architecture that has a
> symbol with a dependency on 'm' anywhere before the MODULES symbol.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
