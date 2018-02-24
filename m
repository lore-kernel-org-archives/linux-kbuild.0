Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:42532 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751425AbeBXANZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 19:13:25 -0500
Received: by mail-wr0-f193.google.com with SMTP id k9so15719669wre.9
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 16:13:25 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Sat, 24 Feb 2018 01:13:15 +0100
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Message-ID: <20180224001315.GA17706@example.com>
References: <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
 <20180220150018.mjyjmdmao7xqyukr@huvuddator>
 <20180220195119.GA14262@vmlxhi-102.adit-jv.com>
 <CAFkk2KRxERva+XZi_fR_Epr63TwA6hKjwjCYnwtnK+xOSJUWHg@mail.gmail.com>
 <CAK7LNATTqqzJReUfkoxE=5+GsVUMv4wjOuz--=-PY_B4eK4NeA@mail.gmail.com>
 <20180221061052.GA29861@example.com>
 <CAK7LNATHuCmU3WJJZs_S6ppZ2dbaZJa66yWhaCRJxqB6PLXgQg@mail.gmail.com>
 <20180223140420.GA10547@vmlxhi-102.adit-jv.com>
 <CAFkk2KRfaDZQG-F=3i-kQbGH6JzxP1q_fvKPzK1A_hJUb0GkMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KRfaDZQG-F=3i-kQbGH6JzxP1q_fvKPzK1A_hJUb0GkMQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>

Hi Ulf,

On Fri, Feb 23, 2018 at 11:18:17PM +0100, Ulf Magnusson wrote:
> On Fri, Feb 23, 2018 at 3:04 PM, Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> >
> > Hi Masahiro,
> >
> > On Fri, Feb 23, 2018 at 09:10:37PM +0900, Masahiro Yamada wrote:
> >> Eugeniu,
> >>
> >>
> >> 2018-02-21 15:10 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:
> >>
> >> >
> >> > I've tested https://patchwork.kernel.org/patch/10229545/ and
> >> > https://patchwork.kernel.org/patch/10231295/ and they work great for me.
> >> > Thank you for this feature.
> >> >
> >>
> >> I will give you that code in the second one.
> >
> > I appreciate that, although I am open minded who takes the authorship.
> > This feature makes my life easier and that's the most important part.
> >
> >>
> >> Please fill the commit log with yours,
> >> and also fix the bugs pointed by Petr.
> >
> > Sure. Will do that.
> >
> >> Anyway, I will claim my contribution
> >> in the form of Signed-off-by when I pick it up.  :)
> >
> > I have one side question loosely related to this patch.
> >
> > Reverse dependencies are still not printed in zconfdump() (used in our kernel
> > team for e.g. cross platform .config alignment/comparison). My gut feeling
> > tells me this is mainly caused by the extremely unfriendly unreadable
> > expressions which is how reverse dependencies used to be represented before
> > commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
> > readable"). Since this is now greatly improved, would you mind printing
> > Selected/Implied-by in zconfdump? There are also other zconfdump fixes
> > sitting in my local branch, like https://patchwork.kernel.org/patch/9253535/ .
> > I would like to push them to you (they probably deserve a separate
> > thread), if you think this is appropriate.
> >
> > Best regards,
> > Eugeniu.
> 
> Shameless plug:
> 
> If you need to do any fancy Kconfig parsing and comparison, then
> Kconfiglib (https://github.com/ulfalizer/Kconfiglib) might be handy.
> It makes it easy to walk the menu tree, print and inspect symbols and
> expressions, etc.

Currently, when comparing kernel configurations of two platforms P1 and
P2, our zconfdump parser generates reports like below. It helps us quite
much during .config alignment. The report can be isolated to a specific menu
entry (in this case, it is "General setup"). In this particular case, P1 is
imx6 using v3.14 kernel and P2 is rcar3 using a v4.x kernel. If Kconfiglib
is able to generate a similar diff report, I will happily embrace it.
If not, we might have no choice but keep using zconfdump for a while.

Unfortunately, I haven't found some time to put my hands on Kconfiglib
yet and I don't know what it is (or would be) capable of. Bottomline,
the motivation to fix and enrich vanilla zconfdump functionality
originates from making such reports possible on our side.

                                  Boolean -    - String   
                                Tristate - \  / - Hex
                              config -    \ || / - Integer
                         menuconfig - \    |||| /
                                     \|    |||||
  Config Name                 Val    MC    TBSHI    Cfg.Origin         Comments
                             P1 P2  P1 P2  P1 P2  P1         P2         P1 P2
HAVE_KERNEL_GZIP             y  -   C  C   B  B   sel-by     -          01 -
HAVE_KERNEL_LZMA             y  -   C  C   B  B   sel-by     -          02 -
HAVE_KERNEL_XZ               y  -   C  C   B  B   sel-by     -          03 -
HAVE_KERNEL_LZO              y  -   C  C   B  B   sel-by     -          04 -
HAVE_KERNEL_LZ4              y  -   C  C   B  B   sel-by     -          05 -
HAVE_KERNEL_LZ77             y  -   C  -   B  -   sel-by     -          06 -
KERNEL_LZO                   y  -   C  C   B  B   defconfig  -          -  -
KTIME_SCALAR                 y  -   C  -   B  -   sel-by     -          07 -
GENERIC_CLOCKEVENTS_BUILD    y  -   C  -   B  -   default    -          08 -
IKCONFIG                     m  y   C  C   T  T   defconfig  defconfig  -  -
MM_OWNER                     y  -   C  -   B  -   sel-by     -          09 -
PERF_USE_VMALLOC             y  -   C  C   B  B   sel-by     -          10 -
HAVE_OPROFILE                y  -   C  C   B  B   sel-by     -          11 -
UPROBES                      y  n   C  C   B  B   sel-by     default    12 13
ARCH_USE_BUILTIN_BSWAP       y  -   C  C   B  B   sel-by     -          14 -
HAVE_DMA_ATTRS               y  -   C  -   B  -   sel-by     -          15 -
ARCH_WANT_IPC_PARSE_VERSION  y  -   C  C   B  B   sel-by     -          16 -
MODULES_USE_ELF_REL          y  -   C  C   B  B   sel-by     -          17 -
OLD_SIGACTION                y  -   C  C   B  B   sel-by     -          18 -
TREE_PREEMPT_RCU             y  -   C  -   B  -   sel-by-ch  -          19 -
RCU_FANOUT                   32 64  C  C   I  I   default    default    20 21
RESOURCE_COUNTERS            y  -   C  -   B  -   defconfig  -          -  -

Comments:
01) selected by (ARM [=y])
02) selected by (ARM [=y])
03) selected by (ARM [=y])
04) selected by (ARM [=y])
05) selected by (ARM [=y])
06) selected by (ARM [=y])
07) selected by (ARM [=y])
08) default y if GENERIC_CLOCKEVENTS [=y]
09) selected by (MEMCG [=y] && CGROUPS [=y] && RESOURCE_COUNTERS [=y])
10) selected by (ARM [=y])
11) selected by (ARM [=y] && HAVE_PERF_EVENTS [=y])
12) selected by (UPROBE_EVENT [=y] && TRACING_SUPPORT [=y] && FTRACE [=y] &&
                 ARCH_SUPPORTS_UPROBES [=y] && MMU [=y] && PERF_EVENTS [=y])
13) default n
14) selected by (ARM [=y])
15) selected by (ARM [=y])
16) selected by (ARM [=y])
17) selected by (ARM [=y])
18) selected by (ARM [=y])
19) selected by choice "RCU Implementation"
20) default 32 if ((TREE_RCU || TREE_PREEMPT_RCU) && !64BIT) [=y]
21) default 64 if ((TREE_RCU || PREEMPT_RCU) && RCU_EXPERT && 64BIT) [=y]
 
> Cheers,
> Ulf

Best regards,
Eugeniu.
