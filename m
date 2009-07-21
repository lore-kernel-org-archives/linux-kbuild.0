Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f197.google.com ([209.85.210.197]:33301 "EHLO
	mail-yx0-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754953AbZGUGLH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Jul 2009 02:11:07 -0400
Received: by yxe35 with SMTP id 35so616811yxe.33
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2009 23:11:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090717203128.GB6872@merkur.ravnborg.org>
References: <1d3f23370906282226t5944cfc8xa4af82ffd0ce5095@mail.gmail.com>
	 <20090629094123.9c3f3c14.randy.dunlap@oracle.com>
	 <1d3f23370907051824m4a75dfd5uedb359b650741444@mail.gmail.com>
	 <20090717203128.GB6872@merkur.ravnborg.org>
Date: Tue, 21 Jul 2009 16:05:52 +1000
Message-ID: <1d3f23370907202305n19a956f3w544edf1a7f0e1df5@mail.gmail.com>
Subject: Re: Update/override CONFIG_ during kbuild?
From: John Williams <john.williams@petalogix.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Williams <john.williams@petalogix.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, John Linn <John.Linn@xilinx.com>, Michal Simek <michal.simek@petalogix.com>

On Sat, Jul 18, 2009 at 6:31 AM, Sam Ravnborg<sam@ravnborg.org> wrote:
> On Mon, Jul 06, 2009 at 11:24:07AM +1000, John Williams wrote:
>> On Tue, Jun 30, 2009 at 2:41 AM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
>> >
>> > On Mon, 29 Jun 2009 15:26:51 +1000 John Williams wrote:
>> >
>> > > Is there a mechanism to override or update a CONFIG_ value during the
>> > > make process?
>> > >
>> > > In the MicroBlaze architecture we have a highly configurable CPU -
>> > > various ALU options can be enabled or disabled at will during the
>> > > hardware build phase.  We have several Kconfig options that must match
>> > > this, and which are used to generate the appropriate CFLAGS during
>> > > kernel build.  e.g.
>> > >
>> > > CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_DIV) += -mno-xl-soft-div
>> > > CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_BARREL) += -mxl-barrel-shift
>> > > CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR) += -mxl-pattern-compare
>> > >
>> > [snip]
>>
>>
>> >
>> > > Thus, returning to the question - is there a sane way that we can
>> > > override or force the relevant CONFIG_ values, from within the
>> > > Makefile itself?   Or, must we resort to a script, and do it as a
>> > > preprocessing step?  Is there a reasonable way to still integrate this
>> > > into the kernel build phase?
>> >
>> > I thought that it was possible to override CONFIG_ symbols on the
>> > "make" command line, and my limited testing confirms that.
>> >
>> > E.g.:
>> >
>> > make ARCH=x86_64 O=xx64 defconfig
>> > make CONFIG_HEADERS_CHECK=y CONFIG_BUILD_DOCSRC=y ARCH=x86_64 O=xx64 -j4 all
>> >
>> > does cause BUILD_DOCSRC builds to happen although BUILD_DOCSRC is not set in
>> > the defconfig file.  (I set HEADERS_CHECK=y first since BUILD_DOCSRC depends
>> > on HEADERS_CHECK.)
>>
>> Sure, this works.  What I'm wondering is if there is a valid way we
>> can do the override *inside* the kbuild process itself, ie in our arch
>> Makefile we could parse the DTS file and automagically update the
>> relevent CONFIG_* to match the DTS file.
>>
>> Thoughts from any kbuild experts?  I can go hack something up but
>> would prefer to have some non-zero probability of future merge
>> acceptance.
>
> I recall I already provided an answer. But my mailbox is on another box...
>
> What you do is to use either a CONFIG_ or a dts defined symbol to decide
> if you support a feature or not. And give precedence to the dts symbol.
>
> In this was you do not need to override a config symbol, but you
> rather use a config symbol to decide to final value for
> a supported feature.
>
> Would that work out for you?

I've finally had time for some quick tests, and indeed just forcing
CONFIG_.. in our arch Makefile does the trick, as long as I do it
*before* we derive our CONFIG-dependent CFLAGS_KERNEL

kbuild even is smart enough to figure out that the CFLAGS have
changed, and forces a recompile of just about everything - nice.

There's one catch I hadn't considered, include/config/*.h are not
updated with this mechanism.  We have a couple of #ifdef code paths in
a .S file that test a CONFIG_ CPU feature, and emits assembly
instructions accordingly (either native opcodes or slow, multi-cycle
emulations for things like barrel shift).  This fails my method
because include/config is out of date.

Any nice one-liner I can call from our arch Makefile to trigger a
regen of include/config?

Or am I going about this the wrong way do you think?

Thanks,

John
