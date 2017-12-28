Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:34096 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbdL1T32 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Dec 2017 14:29:28 -0500
Subject: Re: [Regression 4.15] Can't kill CONFIG_UNWINDER_ORC with fire or
 plague.
References: <20171226043003.GB10431@windriver.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d053e6df-ed00-2a02-eb27-4287b7549276@infradead.org>
Date: Thu, 28 Dec 2017 11:29:26 -0800
MIME-Version: 1.0
In-Reply-To: <20171226043003.GB10431@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/25/2017 08:30 PM, Paul Gortmaker wrote:
> There is a regression new to 4.15 that happens in a rather common
> workflow which results in the frustrating situation where the user has
> clearly disabled UNWINDER_ORC in their ".config" file, and yet they
> still get the immediate false error saying they need libelf-dev since
> "CONFIG_UNWINDER_ORC=y" is still set, and hence they can not build.
> 
> The regression requires UNWINDER_ORC=y (now the default in commit
> fc72ae40e303) followed by the user subsequently disabling it, which is
> common if the user doesn't have libelf-dev and doesn't care about ORC.
> 
> This happens because the recently added test in the top level Makefile
> assumes that ,config data will be mapped into include/config/auto.conf
> either by the end user running "make oldconfig" or the Makefile itself
> detecting that "silentoldconfig" should be run.  As the simple
> reproducer below shows, this clearly does not happen as expected.
> 
> Note that the test for CONFIG_STACK_VALIDATION and libelf-dev in the
> same place in the Makefile is broken in the same way, but since it is a
> warning and not an error, nobody cared about the bogus false positives.

Yeah, that's odd.

> Since there is no way I'm going to debug Makefile stuff on Christmas
> Day, I figured that I should at least report it intstead.  The work
> around is to save your .config and run a "make distclean" or manually
> clobber the stale include/config/auto.conf or similar.  But a frustrated
> user wouldn't know that w/o the root cause...
> 

I have tried to reproduce this multiple times but cannot do so.
It remains with:

> grep UNWINDER .config
# CONFIG_UNWINDER_ORC is not set
CONFIG_UNWINDER_FRAME_POINTER=y

> 
>     --------------------- reproducer ------------------------
> 
> paul@gw:~/git/linux-head$ git describe 
> v4.15-rc5
> paul@gw:~/git/linux-head$ make distclean 
> paul@gw:~/git/linux-head$ make defconfig
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   SHIPPED scripts/kconfig/zconf.tab.c
>   SHIPPED scripts/kconfig/zconf.lex.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> *** Default configuration is based on 'x86_64_defconfig'
> #
> # configuration written to .config
> #
> paul@gw:~/git/linux-head$ make
> scripts/kconfig/conf  --silentoldconfig Kconfig
> Makefile:926: *** "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel".  Stop.
> paul@gw:~/git/linux-head$ vi .config  # disable ORC in favour of FRAME_POINTER
> paul@gw:~/git/linux-head$ make oldconfig
> scripts/kconfig/conf  --oldconfig Kconfig
> #
> # configuration written to .config
> #
> paul@gw:~/git/linux-head$ grep UNWINDER .config
> # CONFIG_UNWINDER_ORC is not set
> CONFIG_UNWINDER_FRAME_POINTER=y
> paul@gw:~/git/linux-head$ make
> Makefile:926: *** "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel".  Stop.
> paul@gw:~/git/linux-head$ ls -l .config include/config/auto.conf
> -rw-rw-r-- 1 paul paul 115953 Dec 25 22:48 .config
> -rw-rw-r-- 1 paul paul  33069 Dec 25 22:46 include/config/auto.conf
> paul@gw:~/git/linux-head$ grep UNWINDER include/config/auto.conf
> CONFIG_UNWINDER_ORC=y
> paul@gw:~/git/linux-head$ 
> 
>     --------------------- reproducer ------------------------


-- 
~Randy
