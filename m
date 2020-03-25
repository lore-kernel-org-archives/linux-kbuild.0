Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:59891 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbgCYDuc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 23:50:32 -0400
MIME-Version: 1.0
References: <20200324161539.7538-1-masahiroy@kernel.org> <CAMuHMdWPNFRhUVGb0J27MZg2CrWWm06N9OQjQsGLMZkNXJktAg@mail.gmail.com>
In-Reply-To: <CAMuHMdWPNFRhUVGb0J27MZg2CrWWm06N9OQjQsGLMZkNXJktAg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 Mar 2020 12:49:46 +0900
Message-ID: <CAK7LNAQFbcfK=q4eYW_dQUqe-sqbjpxSpQBeCkp0Vr4P3HJc7A@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: wan: wanxl: use $(CC68K) instead of $(AS68K) for
 rebuilding firmware
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Mar 25, 2020 at 2:47 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Tue, Mar 24, 2020 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > As far as I understood from the Kconfig help text, this build rule is
> > used to rebuild the driver firmware, which runs on the QUICC, m68k-based
> > Motorola 68360.
> >
> > The firmware source, wanxlfw.S, is currently compiled by the combo of
> > $(CPP) and $(AS68K). This is not what we usually do for compiling *.S
> > files. In fact, this is the only user of $(AS) in the kernel build.
> >
> > Moreover, $(CPP) is not likely to be a m68k tool because wanxl.c is a
> > PCI driver, but CONFIG_M68K does not select CONFIG_HAVE_PCI.
> > Instead of combining $(CPP) and (AS) from different tool sets, using
> > single $(CC68K) seems simpler, and saner.
> >
> > After this commit, the firmware rebuild will require cc68k instead of
> > as68k. I do not know how many people care about this, though.
> >
> > I do not have cc68k/ld68k in hand, but I was able to build it by using
> > the kernel.org m68k toolchain. [1]
>
> Would this work with a "standard" m68k-linux-gnu-gcc toolchain, like
> provided by Debian/Ubuntu, too?
>

Yes, I did 'sudo apt install gcc-8-m68k-linux-gnu'
It successfully compiled this firmware.

In my understanding, the difference is that
the kernel.org ones lack libc,
so cannot link userspace programs.

They do not make much difference for this case.

-- 
Best Regards
Masahiro Yamada
