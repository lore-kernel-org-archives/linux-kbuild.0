Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:46439 "EHLO
        www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbdHLLVb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Aug 2017 07:21:31 -0400
Date: Sat, 12 Aug 2017 13:21:26 +0200
From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: make clean all broken with -j? + question regarding modpost
Message-ID: <20170812112126.GB7704@localhost.localdomain>
References: <20170810154251.GA23083@localhost.localdomain>
 <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
 <CAK7LNARwaZJv62LEqBv5BiGsV9r4TdeNZ41bWH2H-cXA6g7WzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARwaZJv62LEqBv5BiGsV9r4TdeNZ41bWH2H-cXA6g7WzA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, Aug 12, 2017 at 12:15:11PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> 2017-08-11 3:28 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> 
> >> 2.) compile modpost with debug symbols, -g
> >> how do I compile the modpost helper program with debug symbols? In what
> >> makefile, kbuild file do I need to add the compiler flag?
> >> Any help would be appreciated!
> 
> 
> If you want to pass extra options to the build command of host-programs,
> HOST_EXTRACFLAGS is supported.
> 
> For example,  HOST_EXTRACFLAGS=-g

Yes, after reading Documentation/kbuild/makefiles.txt and studying the
top level Makefile I was able to figure it out by myself.

But many thanks for the hint!

Now I just need to find out why an UML kernel with CONFIG_GCOV fails to
build all modules. modpost abends with missing symbols
__gcov_init, etc.


with kind regards
thomas
> 
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
