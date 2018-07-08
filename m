Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:33587 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751422AbeGHPoY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 11:44:24 -0400
Received: by mail-pl0-f67.google.com with SMTP id 6-v6so4901987plb.0
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Jul 2018 08:44:24 -0700 (PDT)
Date: Mon, 9 Jul 2018 01:44:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc: 32BIT vs. 64BIT (PPC32 vs. PPC64)
Message-ID: <20180709012328.203993bb@roar.ozlabs.ibm.com>
In-Reply-To: <c0a17b80-6384-7437-045c-3688d9e5e7f9@infradead.org>
References: <3f906b03-98ff-c081-4e19-b490f0b35c51@infradead.org>
        <a3c9b9ee9ec116390c47dca65fcf14f138eccd3f.camel@kernel.crashing.org>
        <4f3a5969-88d5-134d-508d-7617947c588c@infradead.org>
        <20180707221316.5b75e075@roar.ozlabs.ibm.com>
        <c0a17b80-6384-7437-045c-3688d9e5e7f9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Sat, 7 Jul 2018 07:59:49 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 07/07/2018 05:13 AM, Nicholas Piggin wrote:
> > On Fri, 6 Jul 2018 21:58:29 -0700
> > Randy Dunlap <rdunlap@infradead.org> wrote:
> >   
> >> On 07/06/2018 06:45 PM, Benjamin Herrenschmidt wrote:  
> >>> On Thu, 2018-07-05 at 14:30 -0700, Randy Dunlap wrote:    
> >>>> Hi,
> >>>>
> >>>> Is there a good way (or a shortcut) to do something like:
> >>>>
> >>>> $ make ARCH=powerpc O=PPC32 [other_options] allmodconfig
> >>>>   to get a PPC32/32BIT allmodconfig
> >>>>
> >>>> and also be able to do:
> >>>>
> >>>> $make ARCH=powerpc O=PPC64 [other_options] allmodconfig
> >>>>   to get a PPC64/64BIT allmodconfig?    
> >>>
> >>> Hrm... O= is for the separate build dir, so there much be something
> >>> else.
> >>>
> >>> You mean having ARCH= aliases like ppc/ppc32 and ppc64 ?    
> >>
> >> Yes.
> >>  
> >>> That would be a matter of overriding some .config defaults I suppose, I
> >>> don't know how this is done on other archs.
> >>>
> >>> I see the aliasing trick in the Makefile but that's about it.
> >>>     
> >>>> Note that arch/x86, arch/sh, and arch/sparc have ways to do
> >>>> some flavor(s) of this (from Documentation/kbuild/kbuild.txt;
> >>>> sh and sparc based on a recent "fix" patch from me):    
> >>>
> >>> I fail to see what you are actually talking about here ... sorry. Do
> >>> you have concrete examples on x86 or sparc ? From what I can tell the
> >>> "i386" or "sparc32/sparc64" aliases just change SRCARCH in Makefile and
> >>> 32 vs 64-bit is just a Kconfig option...    
> >>
> >> Yes, your summary is mostly correct.
> >>
> >> I'm just looking for a way to do cross-compile builds that are close to
> >> ppc32 allmodconfig and ppc64 allmodconfig.  
> > 
> > Would there a problem with adding ARCH=ppc32 / ppc64 matching? This
> > seems to work...
> > 
> > Thanks,
> > Nick  
> 
> Yes, this mostly works and is similar to a patch (my patch) on my test machine.
> And they both work for allmodconfig, which is my primary build target.
> 
> And they both have one little quirk that is confusing when the build target
> is defconfig:
> 
> When ARCH=ppc32, the terminal output (stdout) is: (using O=PPC32)
> 
> make[1]: Entering directory '/home/rdunlap/lnx/lnx-418-rc3/PPC32'
>   GEN     ./Makefile
> *** Default configuration is based on 'ppc64_defconfig'   <<<<< NOTE <<<<<
> #
> # configuration written to .config
> #
> make[1]: Leaving directory '/home/rdunlap/lnx/lnx-418-rc3/PPC32'
> 
> 
> I expect that can be fixed also.  :)

It can, we'd just have to choose one of the many 32-bit configs to be
the default config in that case. I don't know much about 32 bit ppc,
so I don't know what would be the most useful for allmodconfig type of
build tests.

Even 64 bit have a bunch of major variants that are exclusive at build
time (Server vs embedded, endian, etc). So maybe the simple ppc64/ppc32
is not enough. Not sure.

Thanks,
Nick
