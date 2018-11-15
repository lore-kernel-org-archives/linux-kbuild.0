Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:21732 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732953AbeKOXdJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 18:33:09 -0500
Date: Thu, 15 Nov 2018 05:25:16 -0800
From: Daniel Walker <danielwa@cisco.com>
Subject: Re: hidden string Kconfig ?
Message-ID: <20181115132516.o5eiomuhk4tq5cmr@zorba>
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba>
 <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
 <20181115000756.k2fsgzmswdbikpfb@zorba>
 <c13367b1-c28b-b889-ed91-233090f1410c@infradead.org>
 <20181115004706.r6azcyjd2fhtktio@zorba>
 <3d1cc558-17bf-d2b4-4121-33fff0625e22@infradead.org>
 <CAK7LNASk2NrsWkQs-pFAKFLG1-aDm29SQJJg378Voifqb320bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASk2NrsWkQs-pFAKFLG1-aDm29SQJJg378Voifqb320bw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Nov 15, 2018 at 11:50:56AM +0900, Masahiro Yamada wrote:
> 
> 
> In current Kconfig, a 'string' type symbol is written to the .config when
> 
> [1] it has a visible prompt
>     https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L364
> 
>    or
> 
> [2] it has a default property
>     https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L421
> 
 
Ok.


> 
> I am open to changing the behavior
> as long as it keeps grammatical consistency, though.
> 
> 
> As far as I understood this particular case,
> CONFIG_CMDLINE will go away after the GENERIC_CMDLINE migration is done.
> 
> (At least, upstream x86 and powerpc defconfig files seem complete).
> 
> 
> 
> Perhaps, some prompt for migration could be useful?
> 
> config CMDLINE
>         string "(LEGACY) Please make this empty and use CMDLINE_PREPEND instead"

I think it would be confusing to leave it. The reason I wanted to have it in
there silently is so I can print a warning, or BUILD_BUG_ON (which is what I
currently do). Just so that people 1) don't lose those options, and 2) So that I
can remind or catch people when they don't notice there was a change. Russell
(ARM32 maintainer) complained in this regard.

I'll look into the Kconfig code and see if I can make something acceptable.

Daniel
