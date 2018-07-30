Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:51445 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726703AbeG3LMe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Jul 2018 07:12:34 -0400
Date: Mon, 30 Jul 2018 11:42:41 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [kbuild:kconfig2 1/10] arch/um/Kconfig:3: can't open file
        "arch/x86_64/um/Kconfig"
Message-ID: <20180730094241.GA19128@lst.de>
References: <201807281506.H8XSZLgK%fengguang.wu@intel.com> <CAK7LNAS6vY1SMcos_VOaqPUrLUJqgsH9jQ4aKodx5yesCPSCBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS6vY1SMcos_VOaqPUrLUJqgsH9jQ4aKodx5yesCPSCBQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

On Sun, Jul 29, 2018 at 11:11:47AM +0900, Masahiro Yamada wrote:
> Hi Christoph,
> 
> 2018-07-28 16:23 GMT+09:00 kbuild test robot <lkp@intel.com>:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig2
> > head:   0e83fd903bc85173711186755591b61405647cf3
> > commit: 2cc1bfaf2c45056c73970a99c3a7467e157f56aa [1/10] um: stop abusing KBUILD_KCONFIG
> > config: um-x86_64_defconfig
> > compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
> > reproduce:
> >         git checkout 2cc1bfaf2c45056c73970a99c3a7467e157f56aa
> >         make ARCH=um SUBARCH=x86_64 defconfig
> >         make ARCH=um SUBARCH=x86_64
> 
> 
> Hmm.
> SUBARCH is used by arch/x86/um/Kconfig
> to choose 64BIT.
> 
> Maybe, do we need $(SUBSRCARCH) ?
> 
> 
> (In hindsight, HOST_ARCH and HOST_SRCARCH
> might be clearer, though...)

Looks like it.  I'll give it a spin and will resend (including the
folded PREEMPT_CODE fix).
