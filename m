Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:20292 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752571AbdI3AjB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 20:39:01 -0400
MIME-Version: 1.0
In-Reply-To: <cc4680bb-9e54-d449-606e-a3fa2e7a9763@arm.com>
References: <cc4680bb-9e54-d449-606e-a3fa2e7a9763@arm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 30 Sep 2017 09:37:53 +0900
Message-ID: <CAK7LNAQh=RDUCsxMfX0QY6w4NyeMdUdgc0GbXDP=SEWDzqKXWQ@mail.gmail.com>
Subject: Re: Fail to build Linux with O= in master
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-09-30 8:59 GMT+09:00 Julien Grall <julien.grall@arm.com>:
> Hello,
>
> I have tried to build the latest master and got the following error:
>
> 42sh> make O=~/works/linux-build/aarch64-4k -C ~/works/linux
> make: Entering directory '/home/julgra01/works/linux'
> Makefile:135: *** failed to create output directory "~/works/linux-build/aarch64-4k".  Stop.
> make: Leaving directory '/home/julgra01/works/linux'
>
> The bisector found the commit 8e9b466 "kbuild: use $(abspath ...)
> instead of $(shell cd ... && /bin/pwd)".
>
> Looking at the code, it seems that it is because the code is
> now using $(realpath ...). Indeed when I replace ~ by $HOME
> the kernel is now built.
>
> I am not a Makefile expert, so I would appreciate if anyone
> could suggest a patch for this.
>

Thanks for the report.

Which shell are you using?


I use bash and I have no problem.
If I try dash, indeed, it fails.

I will take a look.




-- 
Best Regards
Masahiro Yamada
